#define ARDUINO_MAIN

#include "main.h"
#include "Wire.h"
#include "I2Cdev.h"
#include "FlightControl.h"
#include "ZigduinoRadio.h"
#include "LowPassFilter.h"
#include "MPU6050.h"
#include "RemoteCmd.h"

#define LED_PIN 23

#define DEBUG 1

void errHandle(radio_error_t err);
void onXmitDone(radio_tx_done_t x);
void blinkLED();
void executeRemoteCmd(RemoteCmd remoteCmd);

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

	// *************** ZigduinoRadio ***************
	ZigduinoRadio.begin(11);
	ZigduinoRadio.attachError(errHandle);
	ZigduinoRadio.attachTxDone(onXmitDone);

	// *************** Flight Controller ***********
	FlightControl1.initialize();
}

void loop() {

	const uint8_t sendbuflen = 32;
	uint8_t sendBuffer[sendbuflen];
	uint8_t buflen=0;

	uint8_t buf[sizeof(RemoteCmd)];
	RemoteCmd remoteCmd;

	// Get Commands
	if (ZigduinoRadio.available() >= (int8_t)sizeof(RemoteCmd))
	{
		Serial1.println();
		Serial1.print("Rx: ");
		for(uint8_t i=0;i<sizeof(RemoteCmd);i++)
			buf[i] = ZigduinoRadio.read();
		remoteCmd.decode(buf);
		ZigduinoRadio.flush();
		Serial1.print(remoteCmd.cmd);
		Serial1.print("=");
		Serial1.print(remoteCmd.value);
		Serial1.println();

		executeRemoteCmd(remoteCmd);
	}


	// Send  Readings
	// Sensors
	memcpy(sendBuffer+buflen,&FlightControl1.alt,2);buflen += 2;
	memcpy(sendBuffer+buflen,&FlightControl1.gz,2);buflen += 2;
	memcpy(sendBuffer+buflen,&FlightControl1.mz,2);buflen += 2;

	// Yaw loop
	memcpy(sendBuffer+buflen,&FlightControl1.yawInput,4);buflen += 4;
	memcpy(sendBuffer+buflen,&FlightControl1.yawPID->error,4);buflen += 4;
	memcpy(sendBuffer+buflen,&FlightControl1.topRotDuty,2);buflen += 2;
	memcpy(sendBuffer+buflen,&FlightControl1.botRotDuty,2);buflen += 2;

	// Alt loop
	memcpy(sendBuffer+buflen,&FlightControl1.altInput,4);buflen += 4;
	memcpy(sendBuffer+buflen,&FlightControl1.altPID->error,4);buflen += 4;
	memcpy(sendBuffer+buflen,&FlightControl1.throttle,2);buflen += 2;

	// Turn
	memcpy(sendBuffer+buflen,&FlightControl1.gyrosum,4);buflen += 4;

#ifdef DEBUG
	// Sensors
	Serial1.println();
	Serial1.print("h:");Serial1.print(FlightControl1.alt);
	Serial1.print("\t gz:");Serial1.print(FlightControl1.gz);
	Serial1.print("\t mz:");Serial1.print(FlightControl1.gz);
	Serial1.println();
	// Yaw loop
	Serial1.print("yawInp:");Serial1.print(FlightControl1.yawInput);
	Serial1.print("\t yawErr:");Serial1.print(FlightControl1.yawPID->error);
	Serial1.print("\t topRot:");Serial1.print(FlightControl1.topRotDuty);
	Serial1.print("\t botRot:");Serial1.print(FlightControl1.botRotDuty);
	Serial1.println();
	// Alt loop
	Serial1.print("altInp:");Serial1.print(FlightControl1.altInput);
	Serial1.print("\t altErr:");Serial1.print(FlightControl1.altPID->error);
	Serial1.print("\t throttle:");Serial1.print(FlightControl1.throttle);
	Serial1.println();
	// Turn
	Serial1.print("gyrosum:");Serial1.print(FlightControl1.gyrosum);
	Serial1.println();
#endif

	ZigduinoRadio.beginTransmission();
	ZigduinoRadio.write(sendBuffer,buflen);
	ZigduinoRadio.endTransmission();

	delay(200);
}

// Execute remote commands
void executeRemoteCmd(RemoteCmd remoteCmd) {
	switch(remoteCmd.cmd) {
	case 'p':
		FlightControl1.yawPID->Kp = remoteCmd.value;
		break;
	case 'i':
		FlightControl1.yawPID->Ki = remoteCmd.value;
		break;
	case 'd':
		FlightControl1.yawPID->Kd = remoteCmd.value;
		break;
	case 'g':
		FlightControl1.gyroSetPoint = remoteCmd.value;
		break;
	case 'a':
		FlightControl1.altSetPoint = remoteCmd.value;
		break;
	case 'l':
		FlightControl1.land();
		break;
	case 't':
		FlightControl1.takeOff();
		break;
	case 'h':
		FlightControl1.hover();
		break;
	case 'x':
		FlightControl1.throttle  = remoteCmd.value;
		break;
	case 'e':
		if(remoteCmd.value < 1)
			FlightControl1.enableYawPID(false);
		else
			FlightControl1.enableYawPID(true);
		break;
	case 'o':
		FlightControl1.turn(remoteCmd.value);
		break;
	case 'f':
		if(remoteCmd.value < 1)
			FlightControl1.forward(false);
		else
			FlightControl1.forward(true);
		break;	default:
		break;
	}
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
