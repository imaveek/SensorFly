#define ARDUINO_MAIN

#include "main.h"
#include "Wire.h"
#include "I2Cdev.h"
#include "ZigduinoRadio.h"
#include "RemoteCmd.h"


#define LED_PIN 23
#define CMD_MAX_LEN 20

bool blinkState = false;
RemoteCmd remoteCmd;

void errHandle(radio_error_t err);
void onXmitDone(radio_tx_done_t x);

void setup() {
	// join I2C bus (I2Cdev library doesn't do this automatically)
	Wire.begin();

	// initialize serial communication
	// (38400 chosen because it works as well at 8MHz as it does at 16MHz, but
	// it's really up to you depending on your project)
	Serial1.begin(9600);

	// configure Arduino LED for
	pinMode(LED_PIN, OUTPUT);

	// ZigduinoRadio
	ZigduinoRadio.begin(11);
	ZigduinoRadio.attachError(errHandle);
	ZigduinoRadio.attachTxDone(onXmitDone);
}

void loop()
{
	static char mode = 0;
	const uint8_t rxbuflen = 38;
	uint8_t rxBuffer[rxbuflen];
	uint8_t buflen=0;
	float gyrosum;
	float dispZ;

	int16_t gz=0,h=0;
	float head=0;
	int16_t throttle=0,topRotDuty=0,botRotDuty=0;
	float yawInput=0,yawError=0;
	float altInput=0,altError=0;


	uint8_t buf[sizeof(RemoteCmd)];
	char cmdbuf[CMD_MAX_LEN];
	uint8_t val=0, cmdlen=0;
	char str[10];

	switch(mode) {
	case 'r': // Print received readings on screen
		if (ZigduinoRadio.available())
		{
			Serial1.println();
			Serial1.print("Rx: ");
			while(ZigduinoRadio.available() >= rxbuflen) {
				for(uint8_t k=0;k<rxbuflen;k++)
					rxBuffer[k]=ZigduinoRadio.read();
			}
			ZigduinoRadio.flush();

			memcpy(&h,rxBuffer+buflen,2);buflen += 2;
			memcpy(&gz,rxBuffer+buflen,2);buflen += 2;
			memcpy(&head,rxBuffer+buflen,4);buflen += 4;

			memcpy(&yawInput,rxBuffer+buflen,4);buflen += 4;
			memcpy(&yawError,rxBuffer+buflen,4);buflen += 4;
			memcpy(&topRotDuty,rxBuffer+buflen,2);buflen += 2;
			memcpy(&botRotDuty,rxBuffer+buflen,2);buflen += 2;

			memcpy(&altInput,rxBuffer+buflen,4);buflen += 4;
			memcpy(&altError,rxBuffer+buflen,4);buflen += 4;
			memcpy(&throttle,rxBuffer+buflen,2);buflen += 2;

			memcpy(&gyrosum,rxBuffer+buflen,4);buflen += 4;
			memcpy(&dispZ,rxBuffer+buflen,4);buflen += 4;

			// Sensors
			Serial1.println();
			Serial1.print("az:");Serial1.print(h);
			Serial1.print("\t gz:");Serial1.print(gz);
			Serial1.print("\t head:");Serial1.print(head);
			Serial1.println();
			// Yaw loop
			Serial1.print("yawInp:");Serial1.print(yawInput);
			Serial1.print("\t yawErr:");Serial1.print(yawError);
			Serial1.print("\t topRot:");Serial1.print(topRotDuty);
			Serial1.print("\t botRot:");Serial1.print(botRotDuty);
			Serial1.println();
			// Alt loop
			Serial1.print("altInp:");Serial1.print(altInput);
			Serial1.print("\t altErr:");Serial1.print(altError);
			Serial1.print("\t throttle:");Serial1.print(throttle);
			Serial1.println();
			// Turn
			Serial1.print("gyrosum:");Serial1.print(gyrosum);
			Serial1.print("\t dispZ:");Serial1.print(dispZ);
			Serial1.println();

		}
		Serial1.flush();
		delay(100);
		if (Serial1.available()) {
			char c = Serial1.read();
			if (c == 27)
				mode = 0;
		}
		break;
	case 'c': // Send commands
		Serial1.flush();
		Serial1.println("Enter command:");
		Serial1.print(">>");

		// Read command string
		cmdlen=0;
		while(true) {
			while(!Serial1.available());
			char c = Serial1.read();
			if (c == 27) {
				mode = 0;
				Serial1.flush();
				break;
			}
			if (c == '\r') {
				cmdbuf[cmdlen++] = '\0';
				Serial1.flush();
				break;
			}
			if (cmdlen >= CMD_MAX_LEN-1) {
				cmdbuf[CMD_MAX_LEN-1] = '\0';
				break;
			}
			cmdbuf[cmdlen++] = c;
			Serial1.print(c);
		}

		Serial1.println();

		// Parse string //%f does not work in sscanf
		val = sscanf(cmdbuf,"%c=%s",&remoteCmd.cmd,str);
		remoteCmd.value = atof(str);

		if (val==2) {
			Serial1.println("OK");
			// Send command
			remoteCmd.encode(buf);
			ZigduinoRadio.beginTransmission();
			ZigduinoRadio.write(buf,sizeof(RemoteCmd));
			ZigduinoRadio.endTransmission();
		} else {
			Serial1.println("Error. Try Again.");
		}
		break;
	default:
		Serial1.flush();
		Serial1.println("*************************");
		Serial1.println("Select Mode:");
		Serial1.println("r - Show Sensor Readings");
		Serial1.println("c - Send command");
		Serial1.print(">>");

		while(!Serial1.available());
		mode = Serial1.read();
		Serial1.print(mode);
		Serial1.println();
		break;
	}
	delay(10);
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

