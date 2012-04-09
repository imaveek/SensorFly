/*
 * FlightControl.cpp
 *
 *  Created on: Mar 28, 2012
 *      Author: imaveek
 */

#include "FlightControl.h"
#include <stdlib.h>

FlightControl FlightControl1; //pre-instantiate controller

FlightControl::FlightControl() {
	// Initialize values
	epsilon = 0.01;
	dt = 0.01;        //100ms loop time
	yawMAX = 8;
	yawMIN = 12;
	yawKp = 0.1;
	yawKd = 0.01;
	yawKi = 0.005;
}

float FlightControl::yawPID(float setpoint, float actual_position) {

	static float pre_error = 0;
	static float integral = 0;
	float error;
	float derivative;
	float output;

	//Caculate P,I,D
	error = setpoint - actual_position;

	//In case of error too small then stop intergration
	if(abs(error) > epsilon)
	{
		integral = integral + error*dt;
	}
	derivative = (error - pre_error)/dt;
	output = yawKp*error + yawKi*integral + yawKd*derivative;

	//Saturation Filter
	if(output > yawMAX)
	{
		output = yawMAX;
	}
	else if(output < yawMIN)
	{
		output = yawMIN;
	}

	//Update error
	pre_error = error;

	return output;
}

