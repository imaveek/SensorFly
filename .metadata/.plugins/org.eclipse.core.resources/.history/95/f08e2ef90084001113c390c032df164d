/*
 *  Interrupt and PWM utilities for 16 bit Timer1 on ATmega168/328
 *  Original code by Jesse Tane for http://labs.ideo.com August 2008
 *  Modified March 2009 by Jérôme Despatis and Jesse Tane for ATmega328 support
 *  Modified June 2009 by Michael Polli and Jesse Tane to fix a bug in setPeriod() which caused the timer to stop
 *  Modified June 2011 by Lex Talionis to add a function to read the timer
 *  Modified Oct 2011 by Andrew Richards to avoid certain problems:
 *  - Add (long) assignments and casts to TimerThree::read() to ensure calculations involving tmp, ICR1 and TCNT1 aren't truncated
 *  - Ensure 16 bit registers accesses are atomic - run with interrupts disabled when accessing
 *  - Remove global enable of interrupts (sei())- could be running within an interrupt routine)
 *  - Disable interrupts whilst TCTN1 == 0.  Datasheet vague on this, but experiment shows that overflow interrupt
 *    flag gets set whilst TCNT1 == 0, resulting in a phantom interrupt.  Could just set to 1, but gets inaccurate
 *    at very short durations
 *  - startBottom() added to start counter at 0 and handle all interrupt enabling.
 *  - start() amended to enable interrupts
 *  - restart() amended to point at startBottom()
 * Modiied 7:26 PM Sunday, October 09, 2011 by Lex Talionis
 *  - renamed start() to resume() to reflect it's actual role
 *  - renamed startBottom() to start(). This breaks some old code that expects start to continue counting where it left off
 *
 *  This program is free software: you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation, either version 3 of the License, or
 *	(at your option) any later version.
 *
 *	This program is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  See Google Code project http://code.google.com/p/arduino-TimerThree/ for latest
 *
 *  Modified by Aveek Purohit for SensorFly on 3/10/2012
 *  For atMega128rfa1
 */
#ifndef TIMERTHREE_cpp
#define TIMERTHREE_cpp

#include "TimerThree.h"

TimerThree Timer3;              // preinstatiate

ISR(TIMER3_OVF_vect)          // interrupt service routine that wraps a user defined function supplied by attachInterrupt
{
	Timer3.isrCallback();
}


void TimerThree::initialize(long microseconds)
{
	TCCR3A = 0;                 // clear control register A
	TCCR3B = _BV(WGM33);        // set mode 8: phase and frequency correct pwm, stop the timer
	setPeriod(microseconds);
}


void TimerThree::setPeriod(long microseconds)		// AR modified for atomic access
{

	long cycles = (F_CPU / 2000000) * microseconds;                                // the counter runs backwards after TOP, interrupt is at BOTTOM so divide microseconds by 2
	if(cycles < RESOLUTION)              clockSelectBits = _BV(CS10);              // no prescale, full xtal
	else if((cycles >>= 3) < RESOLUTION) clockSelectBits = _BV(CS11);              // prescale by /8
	else if((cycles >>= 3) < RESOLUTION) clockSelectBits = _BV(CS11) | _BV(CS10);  // prescale by /64
	else if((cycles >>= 2) < RESOLUTION) clockSelectBits = _BV(CS12);              // prescale by /256
	else if((cycles >>= 2) < RESOLUTION) clockSelectBits = _BV(CS12) | _BV(CS10);  // prescale by /1024
	else        cycles = RESOLUTION - 1, clockSelectBits = _BV(CS12) | _BV(CS10);  // request was out of bounds, set as maximum

	oldSREG = SREG;
	cli();							// Disable interrupts for 16 bit register access
	ICR3 = cycles;                  // ICR1 is TOP in p & f correct pwm mode
	SREG = oldSREG;

	TCCR3B &= ~(_BV(CS30) | _BV(CS31) | _BV(CS32));
	TCCR3B |= clockSelectBits;                                          // reset clock select register, and starts the clock
}

void TimerThree::attachInterrupt(void (*isr)(), long microseconds)
{
	if(microseconds > 0) setPeriod(microseconds);
	isrCallback = isr;                                       // register the user's callback with the real ISR
	TIMSK3 = _BV(TOIE3);                                     // sets the timer overflow interrupt enable bit
	resume();
}

void TimerThree::detachInterrupt()
{
	TIMSK3 &= ~_BV(TOIE3);                                   // clears the timer overflow interrupt enable bit
}

void TimerThree::resume()				// AR suggested
{
	TCCR3B |= clockSelectBits;
}

void TimerThree::restart()		// Depricated - Public interface to start at zero - Lex 10/9/2011
{
	start();
}

void TimerThree::start()	// AR addition, renamed by Lex to reflect it's actual role
{
	unsigned int tcnt3;

	TIMSK3 &= ~_BV(TOIE3);        // AR added
	GTCCR |= _BV(PSRSYNC);   		// AR added - reset prescaler (NB: shared with all 16 bit timers);

	oldSREG = SREG;				// AR - save status register
	cli();						// AR - Disable interrupts
	TCNT3 = 0;
	SREG = oldSREG;          		// AR - Restore status register

	do {	// Nothing -- wait until timer moved on from zero - otherwise get a phantom interrupt
		oldSREG = SREG;
		cli();
		tcnt3 = TCNT3;
		SREG = oldSREG;
	} while (tcnt3==0);

}

void TimerThree::stop()
{
	TCCR3B &= ~(_BV(CS30) | _BV(CS31) | _BV(CS32));          // clears all clock selects bits
}

unsigned long TimerThree::read()		//returns the value of the timer in microseconds
{									//rember! phase and freq correct mode counts up to then down again
	unsigned long tmp;				// AR amended to hold more than 65536 (could be nearly double this)
	unsigned int tcnt3;				// AR added

	oldSREG= SREG;
	cli();
	tmp=TCNT3;
	SREG = oldSREG;

	char scale=0;
	switch (clockSelectBits)
	{
	case 1:// no prescalse
		scale=0;
		break;
	case 2:// x8 prescale
		scale=3;
		break;
	case 3:// x64
		scale=6;
		break;
	case 4:// x256
		scale=8;
		break;
	case 5:// x1024
		scale=10;
		break;
	}

	do {	// Nothing -- max delay here is ~1023 cycles.  AR modified
		oldSREG = SREG;
		cli();
		tcnt3 = TCNT3;
		SREG = oldSREG;
	} while (tcnt3==tmp); //if the timer has not ticked yet

	//if we are counting down add the top value to how far we have counted down
	tmp = (  (tcnt3>tmp) ? (tmp) : (long)(ICR3-tcnt3)+(long)ICR3  );		// AR amended to add casts and reuse previous TCNT1
	return ((tmp*1000L)/(F_CPU /1000L))<<scale;
}

#endif
