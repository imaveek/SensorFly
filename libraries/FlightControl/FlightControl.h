/*
 * FlightControl.h
 *
 *  Created on: Mar 28, 2012
 *      Author: imaveek
 */

#ifndef FLIGHTCONTROL_H_
#define FLIGHTCONTROL_H_

#include <stdint.h>
#include "PID.h"


#define MOTOR1_PIN 11
#define MOTOR2_PIN 10
#define MOTOR3_PIN 8
#define MOTOR3_DIR_PIN 17

class FlightControl {
public:
	// Properties
	int16_t gyroSetPoint;
	int16_t altSetPoint;
	int16_t throttle;

	int16_t topRotDuty;
	int16_t botRotDuty;

	int16_t gz;
	int16_t mx,my,mz;
	int16_t alt;

	float gyrosum;

	float dt;
	float yawInput;
	float altInput;

	PID* yawPID;
	PID* altPID;

	bool yawPIDenabled;
	bool altPIDenabled;
	enum  FlightMode {
		TakeOff,
		Land,
		Turn,
		Hover,
		Idle,
		Hop
	} flightMode;

	// Methods
	void initialize();
	void mainLoop();
	void enableYawPID(bool status);
	void enableAltPID(bool status);

	void setTopRotorDuty(uint16_t duty);
	void setBottomRotorDuty(uint16_t duty);

	void idle();
	void turn(int16_t angle);
	void takeOff();
	void forward(bool status);
	void land();
	void hover();
	void hop();
	void takeOffturn();
};

extern FlightControl FlightControl1;
#endif /* FLIGHTCONTROL_H_ */
