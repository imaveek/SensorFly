/*
 * PID.h
 *
 *  Created on: Apr 4, 2012
 *      Author: imaveek
 */

#ifndef PID_H_
#define PID_H_

class PID {
public:

	// Properties
	float epsilon;
	float dt;        //100ms loop time

	float MAX;    //For Current Saturation
	float MIN;
	float Kp;
	float Ki;
	float Kd;
	float pre_error;
	float integral;
	float error;
	float derivative;

	float loop(float setpoint, float actual_position);
	PID(float Kp, float Ki, float Kd, float epsilon, float dt, float MAX, float MIN);
	PID();
	void reset();
	virtual ~PID();
};

#endif /* PID_H_ */
