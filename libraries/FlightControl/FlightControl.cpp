/*
 * FlightControl.cpp
 *
 *  Created on: Mar 28, 2012
 *      Author: imaveek
 */

#include "FlightControl.h"
#include "TimerOne.h"
#include "TimerThree.h"
#include "MPU6050.h"
#include "HMC5883L.h"
#include "LowPassFilter.h"
#include "Comp6DOF_n0m1.h"
#include "MaxBotix.h"
#include <stdlib.h>


#define GYRO_BIAS 22
#define GYRO_LPF_LEN 20
#define PWM_PERIOD 100
#define PID_PERIOD 10000UL

#define DUTY_MIN 0
#define DUTY_MAX 1024
#define ALT_PID_FREQ_DIV 1

#define THROTTLE_MAX 1000
#define THROTTLE_MIN 600

#define THROTTLE_SET 750
#define THROTTLE_TAKEOFF_DELTA 10
#define THROTTLE_LAND_DELTA 40

#define TURN_GYRO_SET_OFFSET 5000
#define HOVER_ACC_SET_OFFSET 500

#define TAKEOFF_TIME 2000

#define HOVER_HEIGHT 80

#define ACC_FILTER_MAX 5000
#define ACC_FILTER_MIN 500

void * pointerToObj;
static void wrapper();

float turnStop = 0;
int8_t turnDir;

LowPassFilter altLP(5);

unsigned long takeOffStart=0;
unsigned long loopCounter=0;


FlightControl FlightControl1;

void FlightControl::initialize() {
	// Initialize values
	yawPIDenabled = false;
	altPIDenabled = false;
	gyroBias = 0;
	accZbias = 0;
	accZsetPoint = 0;
	gyroSetPoint = 0;

	dt = 0.01;

	throttle = 0;
	yawInput=0;
	topRotDuty=0;
	botRotDuty=0;
	gz=0;
	alt=0;
	heading=0;
	gyrosum = 0;
	velZ=0;
	dispZ=0;

	yawPID = new PID(0.2,0,0,200,dt,200,-200);
	altPID = new PID(8,0,0,200,dt,250,-200);
	alt2PID = new PID(2,0,0,200,dt,0,-200);

	isExecutingFlightPlan = false;

	flightMode = Idle;
	lastFlightMode = Idle;

	// *************** Motor PWM *******************
	// set a timer of length 100 microseconds
	// Needed to set the mode 8 for phase and frequency correct PWM
	Timer1.initialize(PWM_PERIOD);
	Timer1.pwm(MOTOR1_PIN, 0, PWM_PERIOD); // PWM frequency 10000Hz
	Timer1.pwm(MOTOR2_PIN, 0, PWM_PERIOD);

	pinMode(MOTOR3_PIN, OUTPUT);
	pinMode(MOTOR3_DIR_PIN,OUTPUT);
	digitalWrite(MOTOR3_DIR_PIN,LOW);

	// *************** PID Control *****************
	Timer3.initialize(PID_PERIOD); // Timer 3, 10000us, 100Hz
	pointerToObj = this;
	Timer3.attachInterrupt(wrapper, PID_PERIOD);

	// initialize device
	Serial1.println("Initializing Accel/Gyro ...");
	AccelGyro.initialize();
	AccelGyro.setI2CBypassEnabled(HIGH);
	AccelGyro.setDLPFMode(MPU6050_DLPF_BW_5);
	AccelGyro.setFullScaleGyroRange(MPU6050_GYRO_FS_1000);
	AccelGyro.setFullScaleAccelRange(MPU6050_ACCEL_FS_4);


	// verify connection
	Serial1.println("Testing Accel/Gyro connections...");
	Serial1.println(AccelGyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
	Serial1.println(Compass.testConnection() ? "HMC5883L connection successful" : "HMC5883L connection failed");

}

void FlightControl::flightPlan() {
	static unsigned long start = 0;
	static bool isFirstRun = true;
	static uint8_t step = 0;

	if (!isExecutingFlightPlan)
		return;

	if (isFirstRun) {
		step = 0;
		start = millis();
		isFirstRun = false;
	}

	unsigned long elapsedTime = millis() - start;

	switch(step) {
	case 0:
		if (elapsedTime <  6000)
			break;
		turn(180);
		step++;
		break;
//	case 1:
//		if (elapsedTime <  12000)
//			break;
//		turn(90);
//		step++;
//		break;
//	case 2:
//		if (elapsedTime <  18000)
//			break;
//		turn(90);
//		step++;
//		break;
	case 1:
		if (elapsedTime < 12000)
			break;
		land();
		step++;
		break;
	case 2:
		step = 0;
		start = 0;
		isFirstRun = true;
		isExecutingFlightPlan = false;
		break;
	}
}

void FlightControl::executeFlightPlan() {
	if (!isExecutingFlightPlan)
		isExecutingFlightPlan = true;
}


// To call the main loop function in the timer interrupt
void wrapper() {
	FlightControl * mySelf =  (FlightControl *) pointerToObj;
	mySelf->mainLoop();
}

void FlightControl::mainLoop()
{
	sei();

	// Get measurements
	gz = AccelGyro.getRotationZ();

	loopCounter++;

	flightPlan();

	switch(flightMode) {
	case Idle: idleMode(); // Do nothing. Stationary landed.
	break;
	case Hover: hoverMode(); // Maintain altitude. Can go forward in this mode.
	break;
	case TakeOff: takeOffMode(); // Increase throttle till height is achieved
	break;
	case Land: landMode(); // Decrease throttle to land smoothly
	break;
	case Turn: turnMode(); // Execute open loop turn
	break;
	}

	// Altitude control loop
	if (altPIDenabled) {
		if (alt > 200) {
			alt = 20;
		}
		if (loopCounter % ALT_PID_FREQ_DIV == 0) {
			alt = altLP.filter(AltSensor.value());
			int16_t err =  altSetPoint - alt;
			if (err > 0)
				altInput = altPID->loop(altSetPoint,alt);
			else
				altInput = alt2PID->loop(altSetPoint,alt);
			throttle = THROTTLE_SET + altInput;
			throttle = (throttle>THROTTLE_MAX) ? THROTTLE_MAX:throttle;
			throttle = (throttle<THROTTLE_MIN) ? THROTTLE_MIN:throttle;
		}
	}

	// Yaw Control loop
	if (yawPIDenabled) {
		yawInput = yawPID->loop(gyroSetPoint,gz);
		topRotDuty = throttle - yawInput;
		botRotDuty = throttle + yawInput;
	}

	// Set motor duty cycles
	setTopRotorDuty(topRotDuty);
	setBottomRotorDuty(botRotDuty);
}

inline void FlightControl::hoverMode() {
	topRotDuty = throttle;
	botRotDuty = throttle;
}

inline void FlightControl::idleMode() {
	altPIDenabled = false;
	yawPIDenabled = false;
	throttle = DUTY_MIN;
	topRotDuty = throttle;
	botRotDuty = throttle;
}

inline void FlightControl::takeOffMode() {
	unsigned long now = millis();
	if ((now-takeOffStart) > TAKEOFF_TIME) {
		hover();
		return;
	}
	throttle = throttle + THROTTLE_TAKEOFF_DELTA;
	if (throttle > 100) {
		yawPIDenabled = true;
	}
	throttle = (throttle>THROTTLE_MAX) ? THROTTLE_MAX:throttle;
	topRotDuty = throttle;
	botRotDuty = throttle;
}

inline void FlightControl::landMode() {
	throttle = throttle - THROTTLE_LAND_DELTA;
	throttle = (throttle<DUTY_MIN) ? DUTY_MIN:throttle;
	alt = altLP.filter(AltSensor.value());
	if (throttle==DUTY_MIN) {
		idle();
	}
	if (alt < 25 || alt > 200) {
		idle();
	}
	if (throttle < 300)
		yawPIDenabled = false;
}

inline void FlightControl::turnMode() {
	gyrosum += (gz-gyroBias) * dt * 1000/32768;
	if ((turnDir * (turnStop - gyrosum)) < 0) {
		gyrosum = 0;
		gyroSetPoint = gyroBias;
		flightMode = lastFlightMode;
	}
}

void FlightControl::turn(int16_t angle) {
	gyrosum = 0;
	turnStop = angle;
	turnDir = angle/abs(angle);
	lastFlightMode = flightMode;
	gyroSetPoint = turnDir * TURN_GYRO_SET_OFFSET;
	flightMode = Turn;
}

void FlightControl::takeOff() {
	FlightControl1.calibrateGyro();
	FlightControl1.calibrateAccZ();
	takeOffStart = millis();
	gyroSetPoint = gyroBias;
	flightMode = TakeOff;
}

void FlightControl::land() {
	velZ = 0;
	dispZ = 0;
	altPIDenabled = false;
	gyroSetPoint = gyroBias;
	flightMode = Land;
}

void FlightControl::forward(bool status) {
	if(status)
		digitalWrite(MOTOR3_PIN,HIGH);
	else
		digitalWrite(MOTOR3_PIN,LOW);
}

void FlightControl::hover() {
	yawPIDenabled = true;
	altPIDenabled = true;
	gyroSetPoint = gyroBias;
	altSetPoint = HOVER_HEIGHT;
	flightMode = Hover;
	executeFlightPlan();
}

void FlightControl::idle() {
	flightMode = Idle;
}

void FlightControl::enableYawPID(bool status) {
	this->yawPIDenabled = status;
}

void FlightControl::enableAltPID(bool status) {
	this->altPIDenabled = status;
}

void FlightControl::setTopRotorDuty(uint16_t duty) {
	static uint16_t lastDuty=0;
	// Set motor input
	if(duty <= 0){
		duty = (duty<DUTY_MIN) ? DUTY_MIN:duty;
	}
	else{
		duty = (duty>DUTY_MAX) ? DUTY_MAX:duty;
	}
	if(duty != lastDuty)
		Timer1.setPwmDuty(MOTOR1_PIN,duty);
	lastDuty = duty;
}

void FlightControl::setBottomRotorDuty(uint16_t duty) {
	static uint16_t lastDuty=0;
	if(duty <= 0){
		duty = (duty<DUTY_MIN) ? DUTY_MIN:duty;
	}
	else{
		duty = (duty>DUTY_MAX) ? DUTY_MAX:duty;
	}
	if(duty != lastDuty)
		Timer1.setPwmDuty(MOTOR2_PIN,duty);
	lastDuty = duty;
}



void FlightControl::calibrateGyro() {
	int16_t gz = 0;
	LowPassFilter glp(100);
	for(uint8_t i=0;i<100;i++) {
		delay(1);
		gz = glp.filter(AccelGyro.getRotationZ());
	}
	gyroBias = gz;
}

void FlightControl::calibrateAccZ() {
	int16_t az = 0;
	LowPassFilter alp(100);
	for(uint8_t i=0;i<100;i++) {
		delay(1);
		az = alp.filter(AccelGyro.getAccelerationZ());
	}
	accZbias = az;
}
