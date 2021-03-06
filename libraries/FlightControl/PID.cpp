/*
 * PID.cpp
 *
 *  Created on: Apr 4, 2012
 *      Author: imaveek
 */

#include "PID.h"
#include <stdlib.h>

PID::PID() {
	// TODO Auto-generated constructor stub
	reset();
}

void PID::reset() {
	pre_error=0;
	integral=0;
	error=0;
	derivative=0;
}

PID::PID(float Kp, float Ki, float Kd, float epsilon, float dt, float MAX, float MIN) {
	pre_error=0;
	integral=0;
	error=0;
	derivative=0;

	this->Kp = Kp;
	this->Ki = Ki;
	this->Kd = Kd;
	this->epsilon = epsilon;
	this->dt = dt;
	this->MAX = MAX;
	this->MIN = MIN;
}

float PID::loop(float setpoint, float actual_position) {

	float output=0;

	//Calculate P,I,D
	error = setpoint - actual_position;

	//In case of error too small then stop integration
	if(abs(error) > epsilon)
	{
		integral = integral + error*dt;
	}
	derivative = (error - pre_error)/dt;
	output = Kp*error + Ki*integral + Kd*derivative;

	//Saturation Filter
	if(output > MAX)
	{
		output = MAX;
	}
	else if(output < MIN)
	{
		output = MIN;
	}

	//Update error
	pre_error = error;

	return output;
}

PID::~PID() {
	// TODO Auto-generated destructor stub
}

