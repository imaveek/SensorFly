/*
 * main.h
 *
 *  Created on: Mar 8, 2012
 *      Author: imaveek
 */

#ifndef MAIN_H_
#define MAIN_H_

#include "Arduino.h"

extern HardwareSerial Serial1;

enum pkt_cmd
{
	RANGING_REQUEST, // base to all
	RANGING, // anchor to node
	RANGING_RESULT // node to base
};

typedef struct rangingPkt
{
	uint8_t id;
	pkt_cmd c;
	int8_t data[10];
}rangingPkt;

int main();
void sendRangingResult();
void executePkt();
void collectingRanging();

#endif /* MAIN_H_ */
