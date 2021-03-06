#define ARDUINO_MAIN

#include "main.h"

#include "Wire.h"
#include "I2Cdev.h"
#include "ZigduinoRadio.h"

// NODE
#define DEBUG 1
#define ANCHOR_NUM 5
#define ANCHOR_ID_SETOFF 2
#define deviceID 2
#define LED_PIN 23

bool blinkState = false;
bool recvComplete = false;
bool getRangingResult = false;
rangingPkt pktRx;
rangingPkt pktTx;
int8_t aveRssi;
int8_t rssi[ANCHOR_NUM];
uint8_t count;
const uint8_t sendbuflen = 13;

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
	ZigduinoRadio.begin(21);
	ZigduinoRadio.attachError(errHandle);
	ZigduinoRadio.attachTxDone(onXmitDone);
}

void loop() {
	uint8_t buf[sizeof(rangingPkt)];

	// Get Commands
//	Serial1.print("packet accumatled by far: ");
//	Serial1.print(ZigduinoRadio.available());
//	Serial1.println();
	if (ZigduinoRadio.available() >= (int8_t)sizeof(rangingPkt))
	{
		aveRssi = 0;
		for(uint8_t i = 0; i < sizeof(rangingPkt); i++)
		{
			buf[i] = ZigduinoRadio.read();
		}
		aveRssi = ZigduinoRadio.getLastRssi();
		if (aveRssi > -9 || aveRssi < -91)
		{
			aveRssi = -1;
		}

		memcpy(&pktRx, buf, sizeof(rangingPkt));
		executePkt();
	}
	else
	{
		ZigduinoRadio.flush();
	}

	delay(10);
}

void executePkt()
{
	switch(pktRx.c) {
	case RANGING:
#ifdef DEBUG
	Serial1.print(pktRx.id);
	Serial1.print(", ");
	Serial1.print(pktRx.c);
	Serial1.print(", ");
	Serial1.println(aveRssi);
#endif
		collectingRanging();
		break;
	case RANGING_RESULT:
		break;
	case RANGING_REQUEST:
		for (uint8_t ii = 0; ii < ANCHOR_NUM; ii++)
		{
			rssi[ii] = -1;
		}

		break;
	default:
		break;
	}

	blinkState = !blinkState;
	digitalWrite(LED_PIN, blinkState);
}

void collectingRanging()
{

	uint8_t id = pktRx.id - ANCHOR_ID_SETOFF;
	if (id > 0 && id <= ANCHOR_NUM)
	{
		rssi[id - 1] = aveRssi;
	}

	if (id == ANCHOR_NUM)
	{
		sendRangingResult();
	}
}

void sendRangingResult()
{
	pktTx.c = RANGING_RESULT;
	pktTx.id = deviceID;
	for (uint8_t ii = 0; ii < ANCHOR_NUM; ii++)
	{
		pktTx.data[ii] = rssi[ii];
	}

	uint8_t sendBuffer[sendbuflen];
	memcpy(sendBuffer, &pktTx, sendbuflen);

//	Serial1.println("send result");

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
