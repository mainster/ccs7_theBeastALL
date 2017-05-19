#include "F28x_Project.h"
#include "F2837xD_GlobalPrototypes.h"
#include "md_beast_uart.h"

//!< ADC channel definition
#define AIN_CHA_y	2		//!< ADCINB2 plant_a output
#define AIN_CHA_r	2		//!< ADCINC2 plant_a set-point
//#define AIN_CHB_y	?		//!< ADCINx3 plant_a output
//#define AIN_CHB_r	?		//!< ADCINx4 plant_a setpoint

#define TS	4096

long IdleLoopCount = 0;
long IsrCount = 0;

//float uk_dac;
//
////PID pid1 = PID_DEFAULTS;	//!< PID instance
//float rk = 0.25f;			//!< reference
//float yk;					//!< feedback
//float lk;					//!< saturation
//float uk;					//!< control out

const char * msg = "Welccome\n";

/*
 * ===================== main of _md_adc_soc_epwm_dcl =====================
 */
void main(void) {
	InitSysCtrl();
	InitGpio();
	DINT;
	//!< Disable CPU interrupts

	InitPieCtrl();

	// Disable CPU interrupts and clear all CPU interrupt flags:
	IER = 0x0000;
	IFR = 0x0000;

	InitPieVectTable();

//	MD_SCI_config(115200);
	MD_SCI_init(19200);

//	rk = 0.25f;							// initial value for control reference
//	lk = 1.0f;							// control loop not saturated

	PieCtrlRegs.PIECTRL.bit.ENPIE = 1;   // Enable the PIE block
	PieCtrlRegs.PIEIER9.bit.INTx1 = 1;   // PIE Group 9, INT1
	PieCtrlRegs.PIEIER9.bit.INTx2 = 1;   // PIE Group 9, INT2
	IER = 0x100;                         // Enable CPU INT

	EINT;
	//!< Enable Global interrupt INTM
	ERTM;
	//!< Enable Global realtime interrupt DBGM

	//
	// Step 5. User specific code, enable interrupts:
	//
	// Init send data.  After each transmission this data
	// will be updated for the next transmission
	//

	SCI_write(0, msg, 9);

	/* idle loop */
	while (1) {
		MD_SCI_puts(msg);
		//		SCI_write(-1, msg, sizeof(msg)/sizeof(*msg));
		IdleLoopCount++;
		asm(" NOP");
	}
}
