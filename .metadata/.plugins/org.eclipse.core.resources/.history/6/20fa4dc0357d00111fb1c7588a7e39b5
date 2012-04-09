#define ARDUINO_MAIN

#include "main.h"

#include "Wire.h"
#include "I2Cdev.h"
#include "MPU6050.h"
#include "HMC5883L.h"

MPU6050 accelgyro;
HMC5883L mag;

int16_t mx, my, mz;
int16_t ax, ay, az;
int16_t gx, gy, gz;

#define LED_PIN 23
bool blinkState = false;

void setup() {
	// join I2C bus (I2Cdev library doesn't do this automatically)
	Wire.begin();

	// initialize serial communication
	// (38400 chosen because it works as well at 8MHz as it does at 16MHz, but
	// it's really up to you depending on your project)
	Serial1.begin(9600);

	// configure Arduino LED for
	pinMode(LED_PIN, OUTPUT);

	// initialize device
	Serial1.println("Initializing I2C devices...");

	accelgyro.initialize();
	accelgyro.setI2CBypassEnabled(HIGH);

	mag.initialize();

	// verify connection
	Serial1.println("Testing device connections...");
	Serial1.println(mag.testConnection() ? "HMC5883L connection successful" : "HMC5883L connection failed");
	Serial1.println(accelgyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
}

void loop() {
	// read raw accel/gyro measurements from device
	accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);

	// these methods (and a few others) are also available
	//accelgyro.getAcceleration(&ax, &ay, &az);
	//accelgyro.getRotation(&gx, &gy, &gz);

	// display tab-separated accel/gyro x/y/z values
	Serial1.print("a/g:\t");
	Serial1.print(ax); Serial1.print("\t");
	Serial1.print(ay); Serial1.print("\t");
	Serial1.print(az); Serial1.print("\t");
	Serial1.print(gx); Serial1.print("\t");
	Serial1.print(gy); Serial1.print("\t");
	Serial1.println(gz);

	// read raw heading measurements from device
	mag.getHeading(&mx, &my, &mz);

	// display tab-separated gyro x/y/z values
	Serial1.print("mag:\t");
	Serial1.print(mx); Serial1.print("\t");
	Serial1.print(my); Serial1.print("\t");
	Serial1.println(mz);

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

