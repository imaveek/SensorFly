/*
 * MaxBotix.cpp
 *
 *  Created on: Apr 4, 2012
 *      Author: imaveek
 */

#include "MaxBotix.h"

MaxBotix AltSensor;

MaxBotix::MaxBotix() {
	// TODO Auto-generated constructor stub
	pinMode(A0,INPUT);
	digitalWrite(A0, LOW);
}

uint16_t MaxBotix::value() {
	uint16_t value;
	value = analogRead(A0);
	return(value);
}

MaxBotix::~MaxBotix() {
	// TODO Auto-generated destructor stub
}

