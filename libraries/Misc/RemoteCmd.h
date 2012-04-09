/*
 * RemoteCmd.h
 *
 *  Created on: Mar 31, 2012
 *      Author: imaveek
 */

#ifndef REMOTECMD_H_
#define REMOTECMD_H_

#include <stdint.h>

class RemoteCmd {
public:
	char cmd;
	float value;
	void decode(uint8_t * buf);
	void decode(char cmd, float value);
	void encode(uint8_t *buf);
	RemoteCmd();
	virtual ~RemoteCmd();
};

#endif /* REMOTECMD_H_ */
