#define ARDUINO_MAIN

#include "main.h"
#include "Wire.h"
#include "I2Cdev.h"
#include "MPU6050.h"
#include "HMC5883L.h"
#include "Comp6DOF_n0m1.h"
#include "MaxBotix.h"

int16_t mx, my, mz;
int16_t ax, ay, az;
int16_t gx, gy, gz;

uint16_t height=0;
Comp6DOF_n0m1 sixDOF1;


#define LED_PIN 23
bool blinkState = false;

void setup() {
	// configure Arduino LED for
	pinMode(LED_PIN, OUTPUT);

	// join I2C bus (I2Cdev library doesn't do this automatically)
	Wire.begin();

	// initialize serial communication
	// (38400 chosen because it works as well at 8MHz as it does at 16MHz, but
	// it's really up to you depending on your project)
	Serial1.begin(9600);

	// initialize device
	Serial1.println("Initializing I2C devices...");

	AccelGyro.initialize();
	AccelGyro.setI2CBypassEnabled(HIGH);

	Compass.initialize();
	Compass.setGain(0); // 1.3
	Compass.setMode(HMC5883L_MODE_CONTINUOUS);


	// verify connection
	Serial1.println("Testing device connections...");
	Serial1.println(Compass.testConnection() ? "HMC5883L connection successful" : "HMC5883L connection failed");
	Serial1.println(AccelGyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
}

void loop() {

	// read raw accel/gyro measurements from device
	AccelGyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);

	// display tab-separated accel/gyro x/y/z values
	Serial1.print("a/g:\t");
	Serial1.print(ax); Serial1.print("\t");
	Serial1.print(ay); Serial1.print("\t");
	Serial1.print(az); Serial1.print("\t");
	Serial1.print(gx); Serial1.print("\t");
	Serial1.print(gy); Serial1.print("\t");
	Serial1.println(gz);

	// read raw heading measurements from device
	Compass.getHeading(&mx, &my, &mz);

	// display tab-separated gyro x/y/z values
	Serial1.print("mag:\t");
	Serial1.print(mx-sixDOF1.xHardOff()); Serial1.print("\t");
	Serial1.print(my-sixDOF1.yHardOff()); Serial1.print("\t");
	Serial1.println(mz-sixDOF1.zHardOff());

	height = AltSensor.value();
	Serial1.print("height:\t");
	Serial1.println(height);

	delay(500);

	// blink LED to indicate activity
	blinkState = !blinkState;
	digitalWrite(LED_PIN, blinkState);
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

