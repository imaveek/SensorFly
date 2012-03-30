#define ARDUINO_MAIN

#include "main.h"
#include "TimerOne.h"

#define LED_PIN 23
#define MOTOR1_PIN 11
#define MOTOR2_PIN 10

#define MOTOR3_PIN 8
#define MOTOR3_DIR_PIN 13

bool blinkState = false;

//void timer1Isr();

void setup() {
	// Initialize the digital pin as output.
	// Pin 23 has an LED connected
	pinMode(LED_PIN, OUTPUT);
	//	pinMode(MOTOR2_PIN, OUTPUT);
	//	digitalWrite(MOTOR2_PIN, HIGH);

	// set a timer of length 10000 microseconds (or 0.01 sec - or 100Hz)
	// Needed to set the mode 8 for phase and frequency correct PWM
	Timer1.initialize(100);
	Timer1.pwm(MOTOR1_PIN, 0, 100);
	Timer1.pwm(MOTOR2_PIN, 0, 100);
	//	Timer1.attachInterrupt( timer1Isr ); // attach the service routine here
}

void loop() {
	// blink LED to indicate activity
	blinkState = !blinkState;
//	digitalWrite(LED_PIN, blinkState);
}

int main(void)
{
	init();
	setup();
	for (;;) {
		loop();
		if (serialEventRun) serialEventRun();
	}
	return 0;
}

//void timer1Isr()
//{
//    // Toggle LED
//    digitalWrite( LED_PIN, digitalRead( LED_PIN ) ^ 1 );
//}
