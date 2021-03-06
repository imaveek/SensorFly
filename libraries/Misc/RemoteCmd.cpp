/*
 * RemoteCmd.cpp
 *
 *  Created on: Mar 31, 2012
 *      Author: imaveek
 */

#include "RemoteCmd.h"

RemoteCmd::RemoteCmd() {
	// TODO Auto-generated constructor stub
	cmd = 0;
	value = 0;
}

void RemoteCmd::decode(uint8_t * buf) {
	uint32_t val;
	cmd = buf[0];
	val = ((uint32_t)buf[1] | (uint32_t)buf[2]<<8 |
			(uint32_t)buf[3]<<16 | (uint32_t)buf[4]<<24);
	value = *((float*)&val);
}

void RemoteCmd::decode(char cmd, float value) {
	this->cmd = cmd;
	this->value = cmd;
}

void RemoteCmd::encode(uint8_t *buf) {
	uint32_t val = *((uint32_t*)&value);

	buf[0] = (uint8_t)cmd;
	buf[1] = val;
	buf[2] = val >> 8;
	buf[3] = val >> 16;
	buf[4] = val >> 24;
}

RemoteCmd::~RemoteCmd() {
	// TODO Auto-generated destructor stub
}

