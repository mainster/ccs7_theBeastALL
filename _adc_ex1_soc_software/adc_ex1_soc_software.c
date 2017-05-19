//#############################################################################
//
// FILE:   adc_ex1_soc_software.c
//
// TITLE:  ADC Software Triggering
//
//! \addtogroup driver_example_list
//! <h1>ADC Software Triggering</h1>
//!
//! This example converts some voltages on ADCA and ADCB based on a software
//! trigger.
//!
//! The software triggers for the two ADCs happen sequentially, so the
//! two ADCs will run asynchronously.
//!
//! \b External \b Connections \n
//!  - A0, A1, B0, and B1 should be connected to signals to convert
//!
//! \b Watch \b Variables \n
//! - \b adcAResult0 - Digital representation of the voltage on pin A0
//! - \b adcAResult1 - Digital representation of the voltage on pin A1
//! - \b adcBResult0 - Digital representation of the voltage on pin B0
//! - \b adcBResult1 - Digital representation of the voltage on pin B1
//!
//
//#############################################################################
// $TI Release: F2837xD Support Library v3.00.00.00 $
// $Release Date: Wed Jan 25 16:05:20 CST 2017 $
// $Copyright:
// Copyright (C) 2013-2017 Texas Instruments Incorporated - http://www.ti.com/
//
// Redistribution and use in source and binary forms, with or without 
// modification, are permitted provided that the following conditions 
// are met:
// 
//   Redistributions of source code must retain the above copyright 
//   notice, this list of conditions and the following disclaimer.
// 
//   Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the 
//   documentation and/or other materials provided with the   
//   distribution.
// 
//   Neither the name of Texas Instruments Incorporated nor the names of
//   its contributors may be used to endorse or promote products derived
//   from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// $
//#############################################################################

//
// Included Files
//
#include "driverlib.h"
#include "device.h"

#include <stdint.h>
#include <stdbool.h>
//#include <stdio.h>
//#include <file.h>

//#include "F28x_Project.h"     // DSP28x Headerfile
//#include "ti_ascii.h"
//#include "sci_io_dlib.h"

//
// Defines
//
#define EX_ADC_RESOLUTION    ADC_RESOLUTION_12BIT   // Or ADC_RESOLUTION_16BIT
#define EX_ADC_SIGNAL_MODE   ADC_MODE_SINGLE_ENDED  // Or ADC_MODE_DIFFERENTIAL

//
// Globals
//
uint16_t adcAResult0;
uint16_t adcAResult1;
uint16_t adcBResult0;
uint16_t adcBResult1;

//
// Function Prototypes
//
void initADCs(void);
void initADCSOCs(void);
void scia_init();
void clearTextBox(void);
void drawTILogo(void);

const unsigned char escRed[] =
	{ 0x1B, 0x5B, '3', '1', 'm' };
const unsigned char escWhite[] =
	{ 0x1B, 0x5B, '3', '7', 'm' };
const unsigned char escLeft[] =
	{ 0x1B, 0x5B, '3', '7', 'm' };

static unsigned short indexX = 0;
static unsigned short indexY = 0;

#define SCI_BASE SCIA_BASE

#define putchar(c) SCI_writeCharArray(SCI_BASE, (uint16_t *) c, 1)


//#define SCI_

//
// Main
//
void main(void) {
	const char *msg = "Hello gipsy\n";

	volatile int status = 0;
//    volatile FILE *fid;

#ifdef _FLASH
	memcpy(&RamfuncsRunStart, &RamfuncsLoadStart, (size_t) &RamfuncsLoadSize);
#endif

	// Initialize device clock and peripherals
	Device_init();

	// Disable pin locks and enable internal pullups.
	Device_initGPIO();

	// Initialize PIE and clear PIE registers. Disables CPU interrupts.
	Interrupt_initModule();

	// Initialize the PIE vector table with pointers to the shell Interrupt
	// Service Routines (ISR).
	Interrupt_initVectorTable();

	// Set up ADCs, initializing the SOCs to be triggered by software
	initADCs();
	initADCSOCs();

	scia_init();
	SCI_writeCharArray(SCI_BASE, (uint16_t *) msg, sizeof(msg) / sizeof(*msg));
	//
	// Redirect STDOUT to SCI
	//
//    status = add_device("scia", _SSA, SCI_open, SCI_close, SCI_read, SCI_write,
//                        SCI_lseek, SCI_unlink, SCI_rename);
//    fid = fopen("scia","w");
//    freopen("scia:", "w", stdout);
//    setvbuf(stdout, NULL, _IONBF, 0);

	//
	// Print a TI Logo to STDOUT
	//

	SCI_lockAutobaud(SCI_BASE);

    while(1)
    	SCI_writeCharArray(SCI_BASE, (uint16_t *) "hallo\n", 6);
//    	drawTILogo();

	// Enable Global Interrupt (INTM) and realtime interrupt (DBGM)
	EINT;
	ERTM;

	// Loop indefinitely
	while (1) {
		// Convert, wait for completion, and store results
		ADC_forceSOC(ADCA_BASE, ADC_SOC_NUMBER0);
		ADC_forceSOC(ADCA_BASE, ADC_SOC_NUMBER1);
		ADC_forceSOC(ADCB_BASE, ADC_SOC_NUMBER0);
		ADC_forceSOC(ADCB_BASE, ADC_SOC_NUMBER1);

		// Wait for ADCA to complete, then acknowledge flag
		while (ADC_getInterruptStatus(ADCA_BASE, ADC_INT_NUMBER1) == false) {
		}
		ADC_clearInterruptStatus(ADCA_BASE, ADC_INT_NUMBER1);

		// Wait for ADCB to complete, then acknowledge flag
		while (ADC_getInterruptStatus(ADCB_BASE, ADC_INT_NUMBER1) == false) {
		}
		ADC_clearInterruptStatus(ADCB_BASE, ADC_INT_NUMBER1);

		// Store results
		adcAResult0 = ADC_readResult(ADCARESULT_BASE, ADC_SOC_NUMBER0);
		adcAResult1 = ADC_readResult(ADCARESULT_BASE, ADC_SOC_NUMBER1);
		adcBResult0 = ADC_readResult(ADCBRESULT_BASE, ADC_SOC_NUMBER0);
		adcBResult1 = ADC_readResult(ADCBRESULT_BASE, ADC_SOC_NUMBER1);

		// Software breakpoint. At this point, conversion results are stored in
		// adcAResult0, adcAResult1, adcBResult0, and adcBResult1.
		// Hit run again to get updated conversions.
//			ESTOP0;
	}
}

#ifdef DLIB
void scia_init() {
	// 115200 baud @LSPCLK = 22.5MHz (90 MHz SYSCLK)
	SCI_setConfig(SCIA_BASE, 22.5e6, 115200,
	SCI_CONFIG_WLEN_8 | SCI_CONFIG_PAR_NONE | SCI_CONFIG_STOP_ONE);

}
#else
void scia_init() {

	// Note: Clocks were turned on to the SCIA peripheral
	// in the InitSysCtrl() function

	// 1 stop bit,  No loopback, No parity,8 char bits, async mode,
	// idle-line protocol
	SciaRegs.SCICCR.all = 0x0007;

	// enable TX, RX, internal SCICLK, Disable RX ERR, SLEEP, TXWAKE
	SciaRegs.SCICTL1.all = 0x0003;

	SciaRegs.SCICTL2.bit.TXINTENA = 1;
	SciaRegs.SCICTL2.bit.RXBKINTENA = 1;

	// 115200 baud @LSPCLK = 22.5MHz (90 MHz SYSCLK)
	SciaRegs.SCIHBAUD.all = 0x0000;

	SciaRegs.SCILBAUD.all = 53;

	SciaRegs.SCICTL1.all = 0x0023;// Relinquish SCI from Reset

	return;
}
#endif
//
// Function to configure and power up ADCs A and B.
//
void initADCs(void) {
	// Set ADCCLK divider to /4
	ADC_setPrescaler(ADCA_BASE, ADC_CLK_DIV_4_0);
	ADC_setPrescaler(ADCB_BASE, ADC_CLK_DIV_4_0);

	// Set resolution and signal mode (see #defines above) and load
	// corresponding trims.
	ADC_setMode(ADCA_BASE, EX_ADC_RESOLUTION, EX_ADC_SIGNAL_MODE);
	ADC_setMode(ADCB_BASE, EX_ADC_RESOLUTION, EX_ADC_SIGNAL_MODE);

	// Set pulse positions to late
	ADC_setInterruptPulseMode(ADCA_BASE, ADC_PULSE_END_OF_CONV);
	ADC_setInterruptPulseMode(ADCB_BASE, ADC_PULSE_END_OF_CONV);

	// Power up the ADCs and then delay for 1 ms
	ADC_enableConverter(ADCA_BASE);
	ADC_enableConverter(ADCB_BASE);

	DEVICE_DELAY_US(1000);
}

//
// Function to configure SOCs 0 and 1 of ADCs A and B.
//
void initADCSOCs(void) {
	// Configure SOCs of ADCA
	// - SOC0 will convert pin A0.
	// - SOC1 will convert pin A1.
	// - Both will be triggered by software only.
	// - For 12-bit resolution, a sampling window of 15 (75 ns at a 200MHz
	//   SYSCLK rate) will be used.  For 16-bit resolution, a sampling window
	//   of 64 (320 ns at a 200MHz SYSCLK rate) will be used.
#if(EX_ADC_RESOLUTION == ADC_RESOLUTION_12BIT)
	ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER0, ADC_TRIGGER_SW_ONLY, ADC_CH_ADCIN0,
	        15);
	ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER1, ADC_TRIGGER_SW_ONLY, ADC_CH_ADCIN1,
	        15);
#elif(EX_ADC_RESOLUTION == ADC_RESOLUTION_16BIT)
	ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER0, ADC_TRIGGER_SW_ONLY,
			ADC_CH_ADCIN0, 64);
	ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER1, ADC_TRIGGER_SW_ONLY,
			ADC_CH_ADCIN1, 64);
#endif

	// Set SOC1 to set the interrupt 1 flag. Enable the interrupt and make
	// sure its flag is cleared.
	ADC_setInterruptSource(ADCA_BASE, ADC_INT_NUMBER1, ADC_SOC_NUMBER1);
	ADC_enableInterrupt(ADCA_BASE, ADC_INT_NUMBER1);
	ADC_clearInterruptStatus(ADCA_BASE, ADC_INT_NUMBER1);

	// Configure SOCs of ADCB
	// - SOC0 will convert pin B0.
	// - SOC1 will convert pin B1.
	// - Both will be triggered by software only.
	// - For 12-bit resolution, a sampling window of 15 (75 ns at a 200MHz
	//   SYSCLK rate) will be used.  For 16-bit resolution, a sampling window
	//   of 64 (320 ns at a 200MHz SYSCLK rate) will be used.
#if(EX_ADC_RESOLUTION == ADC_RESOLUTION_12BIT)
	ADC_setupSOC(ADCB_BASE, ADC_SOC_NUMBER0, ADC_TRIGGER_SW_ONLY, ADC_CH_ADCIN0,
	        15);
	ADC_setupSOC(ADCB_BASE, ADC_SOC_NUMBER1, ADC_TRIGGER_SW_ONLY, ADC_CH_ADCIN1,
	        15);
#elif(EX_ADC_RESOLUTION == ADC_RESOLUTION_16BIT)
	ADC_setupSOC(ADCB_BASE, ADC_SOC_NUMBER0, ADC_TRIGGER_SW_ONLY,
			ADC_CH_ADCIN0, 64);
	ADC_setupSOC(ADCB_BASE, ADC_SOC_NUMBER1, ADC_TRIGGER_SW_ONLY,
			ADC_CH_ADCIN1, 64);
#endif

	// Set SOC1 to set the interrupt 1 flag. Enable the interrupt and make
	// sure its flag is cleared.
	ADC_setInterruptSource(ADCB_BASE, ADC_INT_NUMBER1, ADC_SOC_NUMBER1);
	ADC_enableInterrupt(ADCB_BASE, ADC_INT_NUMBER1);
	ADC_clearInterruptStatus(ADCB_BASE, ADC_INT_NUMBER1);
}

//
// drawTILogo -
//
void drawTILogo(void) {
	unsigned char ucChar, lastChar;

	putchar('\n');
	while (indexY < 45) {
		if (indexY < 45) {
			if (indexX < 77) {
//                ucChar = ti_ascii[indexY][indexX++] ;

				//
				// We are in the TI logo make it red
				//
				if (ucChar != '7' && lastChar == '7') {
					putchar(escRed[0]);
					putchar(escRed[1]);
					putchar(escRed[2]);
					putchar(escRed[3]);
					putchar(escRed[4]);
				}

				//
				// We are in the TI logo make it red
				//
				if (ucChar == '7' && lastChar != '7') {
					putchar(escWhite[0]);
					putchar(escWhite[1]);
					putchar(escWhite[2]);
					putchar(escWhite[3]);
					putchar(escWhite[4]);
				}

				putchar(ucChar);
				lastChar = ucChar;
			}

			else {
				ucChar = 10;
				putchar(ucChar);
				ucChar = 13;
				putchar(ucChar);
				indexX = 0;
				indexY++;
			}
		}
	}
}

//
// clearTextBox -
//
void clearTextBox(void) {
	putchar(0x08);

	//
	// Move back 24 columns
	//
	putchar(0x1B);
	putchar('[');
	putchar('2');
	putchar('6');
	putchar('D');

	//
	// Move up 3 lines
	//
	putchar(0x1B);
	putchar('[');
	putchar('3');
	putchar('A');

	//
	// Change to Red text
	//
	putchar(escRed[0]);
	putchar(escRed[1]);
	putchar(escRed[2]);
	putchar(escRed[3]);
	putchar(escRed[4]);

//    printf((char*)pucTempString);

	//
	// Move down 1 lines
	//
	putchar(0x1B);
	putchar('[');
	putchar('1');
	putchar('B');

	//
	// Move back 20 columns
	//
	putchar(0x1B);
	putchar('[');
	putchar('2');
	putchar('0');
	putchar('D');

	//
	// Save cursor position
	//
	putchar(0x1B);
	putchar('[');
	putchar('s');
}

