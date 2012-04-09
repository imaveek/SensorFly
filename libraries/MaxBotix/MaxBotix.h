/*
 * MaxBotix.h
 *
 *  Created on: Apr 4, 2012
 *      Author: imaveek
 */

#ifndef MAXBOTIX_H_
#define MAXBOTIX_H_

#include <stdint.h>
#include "Arduino.h"

class MaxBotix {
public:
	MaxBotix();
	uint16_t value();
	virtual ~MaxBotix();
};

extern MaxBotix AltSensor;

#endif /* MAXBOTIX_H_ */
