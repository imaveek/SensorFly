#define ARDUINO_MAIN

#include "main.h"

#include "Wire.h"
#include "I2Cdev.h"
#include "ZigduinoRadio.h"


#define LED_PIN 23
bool blinkState = false;

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
	if (Serial1.available())
	{
		ZigduinoRadio.beginTransmission();

		Serial1.println();
		Serial1.print("Tx: ");

		while(Serial1.available())
		{
			char c = Serial1.read();
			Serial1.write(c);
			ZigduinoRadio.write(c);
		}

		Serial1.println();

		ZigduinoRadio.endTransmission();
	}

	if (ZigduinoRadio.available())
	{
		Serial1.println();
		Serial1.print("Rx: ");

		while(ZigduinoRadio.available())
			Serial1.write(ZigduinoRadio.read());

		Serial1.println();
		Serial1.print("LQI: ");
		Serial1.print(ZigduinoRadio.getLqi(), 10);
		Serial1.print(", RSSI: ");
		Serial1.print(ZigduinoRadio.getLastRssi(), 10);
		Serial1.print(" dBm, ED: ");
		Serial1.print(ZigduinoRadio.getLastEd(), 10);
		Serial1.println("dBm");
	}
	delay(100);
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

