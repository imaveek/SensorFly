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
}

uint16_t MaxBotix::value() {
	return(analogRead(A0));
}

MaxBotix::~MaxBotix() {
	// TODO Auto-generated destructor stub
}

