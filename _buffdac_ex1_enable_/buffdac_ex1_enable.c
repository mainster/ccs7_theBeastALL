//#############################################################################
//
// FILE:   buffdac_ex1_enable.c
//
// TITLE:   Buffered DAC Enable Output Example
//
//! \addtogroup driver_example_list
//! <h1> Buffered DAC Enable </h1>
//!
//! This example generates a voltage on the buffered DAC output,
//! DACOUTA/ADCINA0 and uses the default DAC reference setting of
//! VDAC.
//!
//! \b External \b Connections \n
//!  - When the DAC reference is set to VDAC, an external reference voltage
//!    must be applied to the VDAC pin. This can be accomplished by connecting a
//!    jumper wire from 3.3V to ADCINB0.
//!
//! \b Watch \b Variables \n
//!  - None.
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
#include "DCL.h"

//#define AUTOBAUD

//
// Globals
//
uint16_t dacVal = 2048;
short dir = 1;
uint16_t loopCounter = 0;

PID pid1 = PID_DEFAULTS;


// Function Prototypes
//
void configureDAC(void);
void configureSCI(void);

//
// Main
//
void main(void) {
	uint16_t receivedChar;
	unsigned char *msg;
	// Initialize device clock and peripherals
	Device_init();

//	InitSysPll(XTAL_OSC,IMULT_40,FMULT_0,PLLCLK_BY_2);

// Initialize PIE and clear PIE registers. Disables CPU interrupts.
	Interrupt_initModule();

	// Initialize the PIE vector table with pointers to the shell Interrupt
	// Service Routines (ISR).
	Interrupt_initVectorTable();

	// Configure the DAC module
	configureDAC();
	configureSCI();

	// Send starting message.
	msg = "\r\n\n\nHello World!\0";
	SCI_writeCharArray(SCIA_BASE, (uint16_t*) msg, 17);
	msg = "\r\nYou will enter a character, and the DSP will echo it back!\n\0";
	SCI_writeCharArray(SCIA_BASE, (uint16_t*) msg, 62);

	for (;;) {
		msg = "\r\nEnter a character: \0";
		SCI_writeCharArray(SCIA_BASE, (uint16_t*) msg, 22);

		// Read a character from the FIFO.
//		receivedChar = SCI_readCharBlockingFIFO(SCIA_BASE);
//
//		// Echo back the character.
//		msg = "  You sent: \0";
//		SCI_writeCharArray(SCIA_BASE, (uint16_t*)msg, 13);
//		SCI_writeCharBlockingFIFO(SCIA_BASE, receivedChar);
//
//		// Increment the loop count variable.
//		loopCounter++;
	}

	// Continuously set the DAC output value
	while (1) {
		if (((dir > 0) && dacVal >= DAC_VALS_DACVALS_M)
		        || ((dir < 0) && dacVal == DAC_VALS_DACVALS_S)) dir *= -1;
		dacVal += dir;

		DAC_setShadowValue(DACA_BASE, dacVal);
//		DEVICE_DELAY_US(2);
	}
}

void configureSCI(void) {

	// Disable pin locks and enable internal pullups.
	Device_initGPIO();

//    // GPIO28 is the SCI Rx pin.
//    GPIO_setMasterCore(28, GPIO_CORE_CPU1);
//    GPIO_setPinConfig(GPIO_28_SCIRXDA);
//    GPIO_setDirectionMode(28, GPIO_DIR_MODE_IN);
//    GPIO_setPadConfig(28, GPIO_PIN_TYPE_STD);
//    GPIO_setQualificationMode(28, GPIO_QUAL_ASYNC);
//
//    // GPIO29 is the SCI Tx pin.
//    GPIO_setMasterCore(29, GPIO_CORE_CPU1);
//    GPIO_setPinConfig(GPIO_29_SCITXDA);
//    GPIO_setDirectionMode(29, GPIO_DIR_MODE_OUT);
//    GPIO_setPadConfig(29, GPIO_PIN_TYPE_STD);
//    GPIO_setQualificationMode(29, GPIO_QUAL_ASYNC);

	// GPIO42 is the SCI Rx pin.
	GPIO_setMasterCore(43, GPIO_CORE_CPU1);
	GPIO_setPinConfig(GPIO_43_SCIRXDA);
	GPIO_setDirectionMode(43, GPIO_DIR_MODE_IN);
	GPIO_setPadConfig(43, GPIO_PIN_TYPE_STD);
	GPIO_setQualificationMode(43, GPIO_QUAL_ASYNC);

	// GPIO43 is the SCI Tx pin.
	GPIO_setMasterCore(42, GPIO_CORE_CPU1);
	GPIO_setPinConfig(GPIO_42_SCITXDA);
	GPIO_setDirectionMode(42, GPIO_DIR_MODE_OUT);
	GPIO_setPadConfig(42, GPIO_PIN_TYPE_STD);
	GPIO_setQualificationMode(42, GPIO_QUAL_ASYNC);

	// Initialize interrupt controller and vector table.
	Interrupt_initModule();
	Interrupt_initVectorTable();

	// Initialize SCIA and its FIFO.
	SCI_performSoftwareReset(SCIA_BASE);

	// Configure SCIA for echoback.
	SCI_setConfig(SCIA_BASE, DEVICE_LSPCLK_FREQ, 1,
	        (SCI_CONFIG_WLEN_8 | SCI_CONFIG_STOP_ONE | SCI_CONFIG_PAR_NONE));

	SCI_resetChannels(SCIA_BASE);
	SCI_resetRxFIFO(SCIA_BASE);
	SCI_resetTxFIFO(SCIA_BASE);
	SCI_clearInterruptStatus(SCIA_BASE, SCI_INT_TXFF | SCI_INT_RXFF);
	SCI_enableFIFO(SCIA_BASE);
	SCI_enableModule(SCIA_BASE);
	SCI_performSoftwareReset(SCIA_BASE);

#ifdef AUTOBAUD
	// Perform an autobaud lock.
	// SCI expects an 'a' or 'A' to lock the baud rate.
	SCI_lockAutobaud(SCIA_BASE);
#endif
	uint32_t baud, config;

	SCI_setConfig(SCIA_BASE, DEVICE_LSPCLK_FREQ, 115200*2,
	        (SCI_CONFIG_WLEN_8 | SCI_CONFIG_STOP_ONE | SCI_CONFIG_PAR_NONE));
//	SCI_getConfig(SCIA_BASE, DEVICE_LSPCLK_FREQ, &baud, &config);
//
//	SCI_setConfig(SCIA_BASE, DEVICE_LSPCLK_FREQ, 19200,
//	        (SCI_CONFIG_WLEN_8 | SCI_CONFIG_STOP_ONE | SCI_CONFIG_PAR_NONE));
//	SCI_getConfig(SCIA_BASE, DEVICE_LSPCLK_FREQ, &baud, &config);
//
//	SCI_setConfig(SCIA_BASE, DEVICE_LSPCLK_FREQ, 115200,
//	        (SCI_CONFIG_WLEN_8 | SCI_CONFIG_STOP_ONE | SCI_CONFIG_PAR_NONE));
//	SCI_getConfig(SCIA_BASE, DEVICE_LSPCLK_FREQ, &baud, &config);
//
//	SCI_lockAutobaud(SCIA_BASE);
//	SCI_getConfig(SCIA_BASE, DEVICE_LSPCLK_FREQ, &baud, &config);
}

//
// Configure DAC - Setup the reference voltage and output value for the DAC
//
void configureDAC(void) {
	// Set VDAC as the DAC reference voltage.
	// Edit here to use ADC VREF as the reference voltage.
	DAC_setReferenceVoltage(DACA_BASE, DAC_REF_ADC_VREFHI);

	// Enable the DAC output
	DAC_enableOutput(DACA_BASE);

	// Set the DAC shadow output to 0
	DAC_setShadowValue(DACA_BASE, 0);

	// Delay for buffered DAC to power up
	DEVICE_DELAY_US(10);
}

//
// End of File
//
