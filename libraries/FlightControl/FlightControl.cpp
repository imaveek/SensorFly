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
#include "MaxBotix.h"
#include "LowPassFilter.h"
#include <stdlib.h>


#define GYRO_BIAS 5
#define GYRO_LPF_LEN 20
#define PWM_PERIOD 10000
#define PID_PERIOD 10000

#define DUTY_MIN 0
#define DUTY_MAX 1024
#define ALT_PID_FREQ_DIV 10

#define THROTTLE_SET 900
#define THROTTLE_DELTA 100

#define MAX_TAKEOFF_SPEED 10
#define MAX_LAND_SPEED 4
#define SPEED_DUTY_DELTA 20
#define THROTTLE_LAND_DELTA 20

#define YAW_PID_CUTOFF_DUTY 300
#define TURN_CUTOFF_DUTY 100

#define TURN_DUTY_OFFSET 3

#define HOP_LENGTH 200
#define TAKEOFF_TIME 90


void * pointerToObj;
static void wrapper();

float turnStop = 0;
int8_t turnDir;

int16_t hopCounter=0;
int16_t takeOffCounter=0;


FlightControl FlightControl1;
LowPassFilter altFilter(10);


void FlightControl::initialize() {
	// Initialize values
	yawPIDenabled = false;
	altPIDenabled = false;
	gyroSetPoint = GYRO_BIAS;
	altSetPoint = 70;

	dt = 0.01;//PID_PERIOD/1000000UL;

	throttle = 0;
	yawInput=0;
	topRotDuty=0;
	botRotDuty=0;
	gz=0;
	alt=0;

	gyrosum = 0;

	yawPID = new PID(0.2,0,0,500,dt,100,-100);
	altPID = new PID(5,0,0,5,dt*ALT_PID_FREQ_DIV,300,-200);

	flightMode = Idle;

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
	AccelGyro.setDLPFMode(MPU6050_DLPF_BW_98);
	AccelGyro.setFullScaleGyroRange(MPU6050_GYRO_FS_1000);

	Compass.initialize();


	// verify connection
	Serial1.println("Testing Accel/Gyro connections...");
	Serial1.println(AccelGyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
	Serial1.println(Compass.testConnection() ? "HMC5883L connection successful" : "HMC5883L connection failed");

	alt = AltSensor.value();
	//	// Compute gyro bias
	//	for(uint8_t i=0;i<20;i++) {
	//		LowPassFilter glp(20);
	//		gz = glp.filter(AccelGyro.getRotationZ());
	//		delay(1);
	//	}
	//	gyroSetPoint = gz;
}


// To call the main loop function in the timer interrupt
void wrapper() {
	FlightControl * mySelf =  (FlightControl *) pointerToObj;
	mySelf->mainLoop();
}

void FlightControl::mainLoop()
{
	sei();
	static uint8_t loopCounter=0;

	// Get measurements
	gz = AccelGyro.getRotationZ();
	mz = Compass.getHeadingZ();

	loopCounter++;

	switch(flightMode) {
	case Idle: // Do nothing. Stationary landed.
		yawPIDenabled = false;
		throttle = 0;
		topRotDuty = throttle;
		botRotDuty = throttle;
		break;
	case Hover: // Maintain altitude. Can go forward in this mode.
		// Slow Altitude Control loop
		if (altPIDenabled && (loopCounter % ALT_PID_FREQ_DIV)==0) {
			alt = altFilter.filter(AltSensor.value());
			altInput = altPID->loop(altSetPoint,alt);
			throttle = THROTTLE_SET + altInput;
			throttle = (throttle<DUTY_MIN) ? DUTY_MIN:throttle;
			throttle = (throttle>DUTY_MAX) ? DUTY_MAX:throttle;
		}
		topRotDuty = throttle;
		botRotDuty = throttle;
		break;
	case TakeOff: // Increase throttle till height is achieved
		takeOffCounter++;
		if(takeOffCounter >= TAKEOFF_TIME) {
			land();
			break;
		}
		if((loopCounter % ALT_PID_FREQ_DIV)==0) {
			throttle = throttle + THROTTLE_DELTA;
			if (throttle > YAW_PID_CUTOFF_DUTY) {
				yawPIDenabled = true;
			}
			throttle = (throttle>DUTY_MAX) ? DUTY_MAX:throttle;
			topRotDuty = throttle;
			botRotDuty = throttle;
		}
		break;
	case Land: // Decrease throttle to land smoothly
		if((loopCounter % ALT_PID_FREQ_DIV)!=0)
			break;
		throttle = throttle - THROTTLE_LAND_DELTA;
		throttle = (throttle<DUTY_MIN) ? DUTY_MIN:throttle;
		if (throttle < YAW_PID_CUTOFF_DUTY)
			yawPIDenabled = false;
		if (throttle == DUTY_MIN)
			idle();
		topRotDuty = throttle;
		botRotDuty = throttle;
		break;
	case Turn: // Execute open loop turn
		gyrosum += (gz-gyroSetPoint) * dt * 1000/32768;
		if (abs(gyrosum)-abs(turnStop) > 0) {
			gyrosum = 0;
			yawPIDenabled = true;
		} else {
			topRotDuty = throttle+(turnDir*TURN_DUTY_OFFSET);
			botRotDuty = throttle-(turnDir*TURN_DUTY_OFFSET);
		}
		break;
	case Hop: // Take off hop and land
		if(hopCounter==0) {
			forward(true);
		}
		hopCounter++;
		if (hopCounter >= HOP_LENGTH) {
			forward(false);
			land();
		}
		break;
	}

	// Fast Yaw Control loop
	if (yawPIDenabled) {
		yawInput = yawPID->loop(gyroSetPoint,gz);
		topRotDuty = throttle - yawInput;
		botRotDuty = throttle + yawInput;
	}

	// Set motor duty cycles
	setTopRotorDuty(topRotDuty);
	setBottomRotorDuty(botRotDuty);
}


void FlightControl::turn(int16_t angle) {
	gyrosum = 0;
	turnStop = angle;
	turnDir = angle/abs(angle);
	yawPIDenabled = false;
}

void FlightControl::hop() {
	hopCounter = 0;
	flightMode = Hop;
}

void FlightControl::takeOff() {
	takeOffCounter = 0;
	flightMode = TakeOff;
}

void FlightControl::land() {
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
	flightMode = Hover;
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
