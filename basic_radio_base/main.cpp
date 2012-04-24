#define ARDUINO_MAIN

#include "main.h"
#include "Wire.h"
#include "I2Cdev.h"
#include "ZigduinoRadio.h"

#define DEBUG 1
#define deviceID 1
#define LED_PIN 23
#define SEND_BUF_SIZE 13
#define NODE_ID 2
#define TIMEOUT 12

bool blinkState = false;
bool recvComplete = true;
bool started = false;
rangingPkt pktRx;
rangingPkt pktTx;
int8_t aveRssi;

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

uint16_t failure_count = 0;

void loop() {
	uint8_t buf[sizeof(rangingPkt)];

	// Get command
	if (ZigduinoRadio.available() >= (int8_t)sizeof(rangingPkt))
	{
		failure_count = 0;
		for(uint8_t i = 0; i < sizeof(rangingPkt); i++)
			buf[i] = ZigduinoRadio.read();
		memcpy(&pktRx, buf, sizeof(rangingPkt));
		executePkt();
	}
	else
	{
		failure_count++;
		if(failure_count > TIMEOUT)
		{
			// if the system getting faster, should increase the time out para
			failure_count = 0;
			sendRangingRequest();
		}
	}
	delay(10);
}

void executePkt()
{
	switch(pktRx.c) {
	case RANGING_RESULT:
		// check the NODE_ID see if the pkt is damaged
		if (pktRx.id != NODE_ID)
		{
			break;
		}

#ifdef DEBUG
	Serial1.print(pktRx.id);
	Serial1.print(",");
	Serial1.print(pktRx.c);
	Serial1.print(",");
	Serial1.print(pktRx.data[0]);
	Serial1.print(",");
	Serial1.print(pktRx.data[1]);
	Serial1.print(",");
	Serial1.print(pktRx.data[2]);
	Serial1.print(",");
	Serial1.print(pktRx.data[3]);
	Serial1.print(",");
	Serial1.println(pktRx.data[4]);
#endif
		// send out the next request
		sendRangingRequest();
		break;
	case RANGING:
		break;
	case RANGING_REQUEST:
		break;
	default:
		break;
	}
}

void sendRangingRequest()
{
	// generate packet
	pktTx.c = RANGING_REQUEST;
	pktTx.id = deviceID;
	uint8_t sendBuffer[SEND_BUF_SIZE];
	memcpy(sendBuffer, &pktTx, SEND_BUF_SIZE);
	// send out packet
	ZigduinoRadio.beginTransmission();
	ZigduinoRadio.write(sendBuffer,SEND_BUF_SIZE);
	ZigduinoRadio.endTransmission();
}

int main(void)
{
	init();
	setup();

	// initializing packet to start everything
	sendRangingRequest();

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
