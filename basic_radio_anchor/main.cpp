#define ARDUINO_MAIN

#include "main.h"

#include "Wire.h"
#include "I2Cdev.h"
#include "ZigduinoRadio.h"

// ANCHOR
//#define DEBUG 1
#define deviceID 7 // changed before flush to anchors
#define LED_PIN 23

bool blinkState = false;
bool recvComplete = false;
rangingPkt pktRx;
rangingPkt pktTx;
int8_t aveRssi;
const uint8_t sendbuflen = 13; // size of the rangingPkt structure, see main.h

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
	ZigduinoRadio.begin(21,-17,0);
	ZigduinoRadio.attachError(errHandle);
	ZigduinoRadio.attachTxDone(onXmitDone);
}


void loop() {
	uint8_t buf[sizeof(rangingPkt)];

	// Get Commands
	if (ZigduinoRadio.available() >= (int8_t)sizeof(rangingPkt))
	{
		aveRssi = 0;
		for(uint8_t i=0;i<sizeof(rangingPkt);i++)
		{
			buf[i] = ZigduinoRadio.read();
			uint8_t tmpRssi = ZigduinoRadio.getLastRssi();
			aveRssi += tmpRssi;
		}
		memcpy(&pktRx, buf, sizeof(rangingPkt));
		executePkt();
	}

	delay(10);
}

void executePkt()
{
#ifdef DEBUG
	Serial1.println();
	Serial1.print("id: ");
	Serial1.print(pktRx.id);
	Serial1.print(", cmd");
	Serial1.print(pktRx.c);
	Serial1.print(", data");
	Serial1.print(pktRx.data[0]);
	Serial1.print(", rssi");
	Serial1.print(aveRssi);
	Serial1.println();
#endif

	switch(pktRx.c) {
	case RANGING:
		break;
	case RANGING_RESULT:
		break;
	case RANGING_REQUEST:
		delay((deviceID-1)*50); // delay different amount of time
		ranging(); // send out its ranging packet
		break;
	default:
		break;
	}

	blinkState = !blinkState;
	digitalWrite(LED_PIN, blinkState);
}

void ranging()
{
	// generate packet
	pktTx.c = RANGING;
	pktTx.id = deviceID;
	uint8_t sendBuffer[sendbuflen];
	memcpy(sendBuffer, &pktTx, sendbuflen);
	// transmit packet
	ZigduinoRadio.beginTransmission();
	ZigduinoRadio.write(sendBuffer,sendbuflen);
	ZigduinoRadio.endTransmission();
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
