/**
 * @file        empty_driverlib_main_cpu1.c
 * @project		md_cla_pid_cpu1
 *
 * @date        4 May 2017
 * @author      Manuel Del Basso (mainster)
 * @email       manuel.delbasso@gmail.com
 *
 * @ide         Code Composer Studio Version: 7.1.0.00015
 * @license		GNU GPL v3
 *
 @verbatim

 ------------------------------------------------------------------------

 Copyright (C) 2017  Manuel Del Basso

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.

 ------------------------------------------------------------------------

 @endverbatim
 *
 */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  Includes  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#include "driverlib.h"
#include "device.h"
//#include "stdint.h"
//#include "F2837xD_GlobalPrototypes.h"
//#include "F2837xD_Adc_defines.h"
//#include "F2837xD_EPwm_defines.h"

//#include "F2837xD_adc.h"
//#include "F28x_Project.h"
//#include "F2837xD_Cla_defines.h"
//#include <stdint.h>

#include "F2837xD_Examples.h"
#include "F2837xD_device.h"
//#include "F2837xD_Adc_defines.h"
//#include "F2837xD_Cla_defines.h"
//#include "F2837xD_EPwm_defines.h"

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~  Private typedefs  ~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~~  Private macro definitions  ~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~  Private variable declaration  ~~~~~~~~~~~~~~~~~~~~ */
uint16_t dacVal = 2048;
short dir = 1;

/* ~~~~~~~~~~~~~~~~~~~~~  Private function prototypes  ~~~~~~~~~~~~~~~~~~~~~ */
void configureDAC(void);
void CLA_runTest(void);
void CLA_configClaMemory(void);
void CLA_initCpu1Cla1(void);

void EPWM_initEpwm(void);
void ADC_initAdcA(void);
__interrupt void cla1Isr1();
__interrupt void cla1Isr2();
__interrupt void cla1Isr3();
__interrupt void cla1Isr4();
__interrupt void cla1Isr5();
__interrupt void cla1Isr6();
__interrupt void cla1Isr7();
__interrupt void cla1Isr8();

__interrupt void Cla1Task1();
__interrupt void Cla1Task2();
__interrupt void Cla1Task3();
__interrupt void Cla1Task4();
__interrupt void Cla1Task5();
__interrupt void Cla1Task6();
__interrupt void Cla1Task7();
__interrupt void Cla1Task8();

/*
 * ===================== main of md_cla_pid_cpu1 =====================
 */
void main(void) {
	//!< Initialize device clock and peripherals
	Device_init();
	//!< Initialize PIE and clear PIE registers. Disables CPU interrupts.
	Interrupt_initModule();

	IER = 0x0000; 			//!< Disable CPU interrupts
	IFR = 0x0000;			//!< Clear all CPU interrupt flags:
	//!< Initialize the PIE vector table with pointers to the Interrupt Service Routines (ISR).
	Interrupt_initVectorTable();

	configureDAC();			//!< Configure the DAC module

	//!< Step 3. Configure the CLA memory spaces first followed by the CLA task vectors
	CLA_configClaMemory();
	CLA_initCpu1Cla1();

	//!< Enable global Interrupts and higher priority real-time debug events:
	EINT;
	//!< Enable Global interrupt INTM
	ERTM;
	//!< Enable Global realtime interrupt DBGM

	//!< Continuously set the DAC output value
	while (1) {
		if (((dir > 0) && dacVal >= DAC_VALS_DACVALS_M)
		        || ((dir < 0) && dacVal == DAC_VALS_DACVALS_S)) dir *= -1;
		dacVal += dir;

		DAC_setShadowValue(DACA_BASE, dacVal);
//		DEVICE_DELAY_US(2);
	}
}

/* ~~~~~~~~~~~~~~~~~~~  Private function implementations  ~~~~~~~~~~~~~~~~~~ */
//!< EPWM_initEpwm - Initialize EPWM1 and EPWM2 settings
void EPWM_initEpwm(void) {
	EALLOW;
	CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 0;       // Turn off the EPWM clock
	EPwm1Regs.ETSEL.bit.SOCAEN = 0;          	// Disable SOC on A group
	EPwm1Regs.ETSEL.bit.SOCASEL = 4;         	// Select SOC on up-count
	EPwm1Regs.ETPS.bit.SOCAPRD = 1;             // Generate pulse on 1st event
	EPwm1Regs.CMPA.bit.CMPA = PWM1_DUTY_CYCLE;  // Set compare A value to 2000
	                                            // counts
	EPwm1Regs.TBPRD = PWM1_PERIOD;              // Set period to 4000 counts
	EPwm1Regs.TBCTL.bit.CTRMODE = 3;            // freeze counter
	EPwm1Regs.ETSEL.bit.SOCAEN = 1;             //enable SOCA
	EPwm1Regs.TBCTL.bit.HSPCLKDIV = 0;

	EPwm2Regs.ETSEL.bit.SOCAEN = 0;          	// Disable SOC on A group
	EPwm2Regs.CMPA.bit.CMPA = PWM2_DUTY_CYCLE;  // Set compare A value to 10000
	                                            // counts
	EPwm2Regs.TBPRD = PWM2_PERIOD;              // Set period to 20000 counts
	EPwm2Regs.TBCTL.bit.CTRMODE = 3;            // freeze counter
	EPwm2Regs.TBCTL.bit.HSPCLKDIV = 0;

	EPwm1Regs.AQCTLA.bit.CAU = AQ_SET;          // Clear PWM1A on Zero
	EPwm1Regs.AQCTLA.bit.PRD = AQ_CLEAR;

	EPwm2Regs.AQCTLA.bit.CAU = AQ_SET;          // Clear PWM2A on Zero
	EPwm2Regs.AQCTLA.bit.PRD = AQ_CLEAR;

	EDIS;
}

//!< ADC_initAdcA - Initialize ADCA configurations and power it up
void ADC_initAdcA(void) {
	uint16_t i;
	EALLOW;
	//!< write configurations
	AdcaRegs.ADCCTL2.bit.PRESCALE = 6;  //set ADCCLK divider to /4
	ADC_setMode(ADC_ADCA, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
	//!< Set pulse positions to late
	AdcaRegs.ADCCTL1.bit.INTPULSEPOS = 1;
	//!< power up the ADC
	AdcaRegs.ADCCTL1.bit.ADCPWDNZ = 1;
	//!< delay for > 1ms to allow ADC time to power up
	for (i = 0; i < 1000; i++) {
		asm("   RPT#255 || NOP");
	}

	//!< Select the channels to convert and end of conversion flag ADCA
	AdcaRegs.ADCSOC0CTL.bit.CHSEL = 0;  		//!< SOC0 will convert pin A0
	AdcaRegs.ADCSOC0CTL.bit.ACQPS = 99; //!< sample window is 100 SYSCLK cycles
	AdcaRegs.ADCSOC0CTL.bit.TRIGSEL = 5; 		//!< trigger on ePWM1 SOCA/C
	AdcaRegs.ADCINTSEL1N2.bit.INT1SEL = 0; 	//!< end of SOC0 will set INT1 flag
	AdcaRegs.ADCINTSEL1N2.bit.INT1E = 1;   			//!< enable INT1 flag
	AdcaRegs.ADCINTFLGCLR.bit.ADCINT1 = 1; 	//!< make sure INT1 flag is cleared
	EDIS;
}

//!<  Configure DAC - Setup the reference voltage and output value for the DAC
void configureDAC(void) {
	//!< Set VDAC as the DAC reference voltage. Edit here to use ADC VREF as the
	//!< reference voltage.
	DAC_setReferenceVoltage(DACA_BASE, DAC_REF_ADC_VREFHI);
	//!< Enable the DAC output
	DAC_enableOutput(DACA_BASE);
	//!< Set the DAC shadow output to 0
	DAC_setShadowValue(DACA_BASE, 0);
	//!< Delay for buffered DAC to power up
	DEVICE_DELAY_US(10);
}

//!< CLA_runTest - Execute CLA task tests for specified vectors
//void CLA_runTest(void) {
//	int16_t i, error;
//
//	//!< Initialize the CPUToCLA1MsgRam variables here
//	PIBYTWO = 1.570796327;
//
//	for (i = 0; i < BUFFER_SIZE; i++) {
//		fVal = (float) ((BUFFER_SIZE / 2) - i);
//
//		Cla1ForceTask1andWait();
//
//		y[i] = fResult;
//		error = fabs(atan_expected[i] - y[i]);
//
//		if (error < 0.01) {
//			pass++;
//		}
//		else {
//			fail++;
//		}
//	}
//
//#if 0
//
//	Cla1ForceTask2andWait();
//	WAITSTEP;
//
//	Cla1ForceTask3andWait();
//	WAITSTEP;
//
//	Cla1ForceTask4andWait();
//	WAITSTEP;
//
//	Cla1ForceTask5andWait();
//	WAITSTEP;
//
//	Cla1ForceTask6andWait();
//	WAITSTEP;
//
//	Cla1ForceTask7andWait();
//	WAITSTEP;
//
//	Cla1ForceTask8andWait();
//	WAITSTEP;
//#endif
//}

//!< CLA_configClaMemory - Configure CLA memory sections
void CLA_configClaMemory(void) {
	extern uint32_t Cla1funcsRunStart, Cla1funcsLoadStart, Cla1funcsLoadSize;
	EALLOW;

#ifdef _FLASH
	// Copy over code from FLASH to RAM
	memcpy((uint32_t *)&Cla1funcsRunStart, (uint32_t *)&Cla1funcsLoadStart,
			(uint32_t)&Cla1funcsLoadSize);
#endif //_FLASH

	// Initialize and wait for CLA1ToCPUMsgRAM
	MemCfgRegs.MSGxINIT.bit.INIT_CLA1TOCPU = 1;
	while (MemCfgRegs.MSGxINITDONE.bit.INITDONE_CLA1TOCPU != 1) {
	};

	// Initialize and wait for CPUToCLA1MsgRAM
	MemCfgRegs.MSGxINIT.bit.INIT_CPUTOCLA1 = 1;
	while (MemCfgRegs.MSGxINITDONE.bit.INITDONE_CPUTOCLA1 != 1) {
	};

	//!< Select LS4RAM and LS5RAM to be the programming space for the CLA First configure the
	//! CLA to be the master for LS4 and LS5 and then set the space to be a program block
	MemCfgRegs.LSxMSEL.bit.MSEL_LS4 = 1;
	MemCfgRegs.LSxCLAPGM.bit.CLAPGM_LS4 = 1;
	MemCfgRegs.LSxMSEL.bit.MSEL_LS5 = 1;
	MemCfgRegs.LSxCLAPGM.bit.CLAPGM_LS5 = 1;

	//!< Next configure LS0RAM and LS1RAM as data spaces for the CLA First configure the CLA
	//! to be the master for LS0(1) and then set the spaces to be code blocks
	MemCfgRegs.LSxMSEL.bit.MSEL_LS0 = 1;
	MemCfgRegs.LSxCLAPGM.bit.CLAPGM_LS0 = 0;

	MemCfgRegs.LSxMSEL.bit.MSEL_LS1 = 1;
	MemCfgRegs.LSxCLAPGM.bit.CLAPGM_LS1 = 0;

	EDIS;
}

//!< CLA_initCpu1Cla1 - Initialize CLA1 task vectors and end of task interrupts
void CLA_initCpu1Cla1(void) {
	//!< Compute all CLA task vectors
	//!< On Type-1 CLAs the MVECT registers accept full 16-bit task addresses as opposed to
	//! offsets used on older Type-0 CLAs
	EALLOW;
	Cla1Regs.MVECT1 = (uint16_t) (&Cla1Task1);
	Cla1Regs.MVECT2 = (uint16_t) (&Cla1Task2);
	Cla1Regs.MVECT3 = (uint16_t) (&Cla1Task3);
	Cla1Regs.MVECT4 = (uint16_t) (&Cla1Task4);
	Cla1Regs.MVECT5 = (uint16_t) (&Cla1Task5);
	Cla1Regs.MVECT6 = (uint16_t) (&Cla1Task6);
	Cla1Regs.MVECT7 = (uint16_t) (&Cla1Task7);
	Cla1Regs.MVECT8 = (uint16_t) (&Cla1Task8);

	//!< Enable the IACK instruction to start a task on CLA in software for all 8 CLA tasks.
	//! Also, globally enable all 8 tasks (or a subset of tasks) by writing to their
	//! respective bits in the MIER register
	Cla1Regs.MCTL.bit.IACKE = 1;
	Cla1Regs.MIER.all = 0x00FF;

	//!< Configure the vectors for the end-of-task interrupt for all 8 tasks
	PieVectTable.CLA1_1_INT = &cla1Isr1;
	PieVectTable.CLA1_2_INT = &cla1Isr2;
	PieVectTable.CLA1_3_INT = &cla1Isr3;
	PieVectTable.CLA1_4_INT = &cla1Isr4;
	PieVectTable.CLA1_5_INT = &cla1Isr5;
	PieVectTable.CLA1_6_INT = &cla1Isr6;
	PieVectTable.CLA1_7_INT = &cla1Isr7;
	PieVectTable.CLA1_8_INT = &cla1Isr8;

	// Enable CLA interrupts at the group and subgroup levels
	PieCtrlRegs.PIEIER11.all = 0xFFFF;
	IER |= (M_INT11);
}

// cla1Isr1 - CLA1 ISR 1
__interrupt void cla1Isr1() {
	// Acknowledge the end-of-task interrupt for task 1
	PieCtrlRegs.PIEACK.all = M_INT11;

	// Uncomment to halt debugger and stop here
//    asm(" ESTOP0");
}

// cla1Isr2 - CLA1 ISR 2
__interrupt void cla1Isr2() {
	asm(" ESTOP0");
}

// cla1Isr3 - CLA1 ISR 3
__interrupt void cla1Isr3() {
	asm(" ESTOP0");
}

// cla1Isr4 - CLA1 ISR 4
__interrupt void cla1Isr4() {
	asm(" ESTOP0");
}

// cla1Isr5 - CLA1 ISR 5
__interrupt void cla1Isr5() {
	asm(" ESTOP0");
}

// cla1Isr6 - CLA1 ISR 6
__interrupt void cla1Isr6() {
	asm(" ESTOP0");
}

// cla1Isr7 - CLA1 ISR 7
__interrupt void cla1Isr7() {
	asm(" ESTOP0");
}

// cla1Isr8 - CLA1 ISR 8
__interrupt void cla1Isr8() {
	// Acknowledge the end-of-task interrupt for task 8
	PieCtrlRegs.PIEACK.all = M_INT11;
	// Uncomment to halt debugger and stop here
	//
//    asm(" ESTOP0");
}
