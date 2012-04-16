/*
 * LowPassFilter.cpp
 *
 *  Created on: Mar 29, 2012
 *      Author: imaveek
 */

#include "LowPassFilter.h"

LowPassFilter::LowPassFilter(uint8_t bufferLen) {
	numItems = 0;
	lastSum = 0;
	curItem = 0;
	buffer = new int32_t[bufferLen];
	for(uint8_t i=0;i<bufferLen;i++)
		buffer[i] = 0;
	this->bufferLen = bufferLen;
}

int32_t LowPassFilter::filter(int32_t x) {
	int32_t replacedX;
	int32_t sum;
	curItem++;

	// Rollover
	if (curItem > bufferLen) {
		curItem = 1;
	}
	// Replace x
	replacedX = buffer[curItem-1];
	buffer[curItem-1] = x;
	// Return average
	sum = lastSum - replacedX + x;
	lastSum = sum;

	if (numItems < bufferLen)
		numItems++;

	return (sum / numItems);
}


LowPassFilter::~LowPassFilter() {
	delete[] buffer;
}

