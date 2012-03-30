#define ARDUINO_MAIN

#include "main.h"
#include "TimerOne.h"
#include "TimerThree.h"
#include "Wire.h"
#include "I2Cdev.h"
#include "MPU6050.h"
#include "FlightControl.h"
#include "ZigduinoRadio.h"
#include "LowPassFilter.h"

#define LED_PIN 23
#define MOTOR1_PIN 11`
#define MOTOR2_PIN 10
#define MOTOR3_PIN 8
#define MOTOR3_DIR_PIN 13
#define PWM_FREQ 100
#define PID_FREQ 1000000UL
#define GYRO_SET_POINT 0
#define THROTTLE 800
#define GYRO_LPF_LEN 20

int16_t gz, fgz;
//LowPassFilter gyroLPF(GYRO_LPF_LEN);

void errHandle(radio_error_t err);
void onXmitDone(radio_tx_done_t x);
void pidLoop();
void blinkLED();

void setup() {
	// Initialize the digital pin as output.
	// Pin 23 has an LED connected
	pinMode(LED_PIN, OUTPUT);
	digitalWrite(LED_PIN, LOW);

	// *************** Sensors *****************
	// join I2C bus (I2Cdev library doesn't do this automatically)
	Wire.begin();

	// initialize serial communication
	Serial1.begin(9600);

	// initialize device
	Serial1.println("Initializing I2C devices...");
	AccelGyro.initialize();
	AccelGyro.setI2CBypassEnabled(HIGH);
	AccelGyro.setDLPFMode(MPU6050_DLPF_BW_5);
	AccelGyro.setFullScaleGyroRange(MPU6050_GYRO_FS_1000);

	// verify connection
	Serial1.println("Testing device connections...");
	Serial1.println(AccelGyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");

	// *************** ZigduinoRadio ***************
	ZigduinoRadio.begin(11);
	ZigduinoRadio.attachError(errHandle);
	ZigduinoRadio.attachTxDone(onXmitDone);

	// *************** Motor PWM *******************
	// set a timer of length 100 microseconds
	// Needed to set the mode 8 for phase and frequency correct PWM
	Timer1.initialize(PWM_FREQ);
	Timer1.pwm(MOTOR1_PIN, 800, PWM_FREQ); // PWM frequency 10000Hz
	Timer1.pwm(MOTOR2_PIN, 800, PWM_FREQ);

	// *************** PID Control *****************
	Timer3.initialize(PID_FREQ); // Timer 3, 1000us, 100Hz
	Timer3.attachInterrupt(pidLoop, PID_FREQ);
}


void pidLoop()
{
	//	uint16_t yawInput;
	//	uint16_t throttle = THROTTLE;

	sei();

	// Get rotation
	gz = AccelGyro.getRotationZ();
//	fgz = gyroLPF.filter(gz);


	blinkLED();

	//	// Call PID loop
	//	yawInput = FlightControl1.yawPID(GYRO_SET_POINT,gz);
	//
	//    uint16_t topRotDuty = throttle - yawInput;
	//    uint16_t botRotDuty = throttle + yawInput;
	//
	//    // Set motor input
	//    if(topRotDuty <= 0 || botRotDuty <= 0){
	//       topRotDuty = (topRotDuty<4) ? 4:topRotDuty;
	//       botRotDuty = (botRotDuty<4) ? 4:botRotDuty;
	//    }
	//    else{
	//        topRotDuty = (topRotDuty > 1024) ? 1024:topRotDuty;
	//        botRotDuty = (botRotDuty > 1024) ? 1024:botRotDuty;
	//    }
	//
	//    // Set motor duty cycles
	//    Timer1.setPwmDuty(MOTOR1_PIN,topRotDuty);
	//    Timer1.setPwmDuty(MOTOR2_PIN,botRotDuty);
}

void loop() {

	uint8_t cmd;

	// Print out to screen
	Serial1.print(gz);
	Serial1.println();

	// Get Commands
	if (ZigduinoRadio.available())
	{
		Serial1.println();
		Serial1.print("Rx: ");
		while(ZigduinoRadio.available()) {
			cmd = ZigduinoRadio.read();
		}
	}

	// Send Gyro Readings
	ZigduinoRadio.beginTransmission();
	ZigduinoRadio.write((uint8_t *)&fgz,2);
	ZigduinoRadio.endTransmission();

	delay(1000);
}

int main(void)
{
	init();
	setup();

	for (;;) {
		loop();
		if (serialEventRun) serialEventRun();
	}
	return 0;
}

void errHandle(radio_error_t err)
{
	Serial1.println();
	Serial1.print("Error: ");
	Serial1.print((uint8_t)err, 10);
	Serial1.println();
}

void onXmitDone(radio_tx_done_t x)
{
	Serial1.println();
	Serial1.print("TxDone: ");
	Serial1.print((uint8_t)x, 10);
	Serial1.println();
}

void blinkLED() {
	static bool blinkState = false;
	// blink LED to indicate activity
	blinkState = !blinkState;
	digitalWrite(LED_PIN, blinkState);
}
