/*
 * FlightControl.h
 *
 *  Created on: Mar 28, 2012
 *      Author: imaveek
 */

#ifndef FLIGHTCONTROL_H_
#define FLIGHTCONTROL_H_

class FlightControl {
public:

	// Properties
	int epsilon;
	int dt;        //100ms loop time
	int yawMAX;    //For Current Saturation
	int yawMIN;
	int yawKp;
	int yawKd;
	int yawKi;

	// Methods
	FlightControl();
	float yawPID(float setpoint, float actual_position);
};

extern FlightControl FlightControl1;
#endif /* FLIGHTCONTROL_H_ */
