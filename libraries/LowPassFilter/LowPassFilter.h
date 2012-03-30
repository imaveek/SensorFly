/*
 * LowPassFilter.h
 *
 *  Created on: Mar 29, 2012
 *      Author: imaveek
 */

#ifndef LOWPASSFILTER_H_
#define LOWPASSFILTER_H_

#include <stdint.h>

class LowPassFilter {

private:
	// Properties
	int16_t *buffer;
	uint8_t numItems;
	uint8_t curItem;
	int16_t lastSum;
	uint8_t bufferLen;

public:
	// Methods
	LowPassFilter(uint8_t bufferLen);
	virtual ~LowPassFilter();

	int16_t filter(int16_t x);
};

#endif /* LOWPASSFILTER_H_ */
