/**
 * @file        md_beast_uart.c
 * @project		_MD_adc_soc_pid_dcl_cla
 *
 * @date        6 May 2017
 * @author      Manuel Del Basso (mainster)
 * @email       manuel.delbasso@gmail.com
 *
 * @ide         Code Composer Studio Version: 7.1.0.00015
 * @license		GNU GPL v3
 *
 * @brief       TODO
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
//#include <file.h>
#include <stdint.h>
#include <stdbool.h>
#include "F28x_Project.h"
#include "F2837xD_GlobalPrototypes.h"
#include "md_circ_buffer.h"
#include "md_beast_uart.h"
//#include "ti_ascii.h"

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~  Private typedefs  ~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~  Private macro definitions  ~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~  Private variable declaration  ~~~~~~~~~~~~~~~~~~~~ */
//static rbd_t _rbd;
//static char _rbmem[8];

char txBuff [SCI_HW_TX_FIFO_DEPTH];    // Send data for SCI-A
char rxBuff [SCI_HW_TX_FIFO_DEPTH];    // Received data for SCI-A

const unsigned char escRed[] = { 0x1B, 0x5B, '3', '1', 'm' };
const unsigned char escWhite[] = { 0x1B, 0x5B, '3', '7', 'm' };
const unsigned char escLeft[] = { 0x1B, 0x5B, '3', '7', 'm' };
const unsigned char pucTempString[] = "\nADCIN14 Sample:     ";

#ifdef RING_BUFF
static rbd_t _rbdRx;
static rbd_t _rbdTx;
#endif

#ifdef RING_BUFF
static char _rbmemRx[8];
static char _rbmemTx[8];
#endif

int deviceOpen = 0;
//static unsigned short indexX = 0;
//static unsigned short indexY = 0;

/* ~~~~~~~~~~~~~~~~~~~~~  Private function prototypes  ~~~~~~~~~~~~~~~~~~~~~ */
void scia_fifo_config(const uint32_t baudrate);

/* ------------------------------------------------------------------------- */

__interrupt void sciaTxFifoIsr(void) {
	volatile uint16_t err = 0;

#ifdef RING_BUFF
	for (short i=0; i < SCI_HW_TX_FIFO_DEPTH; i++)
		err = ring_buffer_get(_rbdTx, (uint16_t *) &SciaRegs.SCITXBUF.all);
#endif

	return;

	SciaRegs.SCIFFTX.bit.TXFFINTCLR = 1;   // Clear SCI Interrupt flag
	PieCtrlRegs.PIEACK.bit.ACK9 = 1;       // Issue PIE ACK
}

__interrupt void sciaRxFifoIsr(void) {
	volatile uint16_t err = 0;

#ifdef RING_BUFF
	for (short i=0; i < SCI_HW_RX_FIFO_DEPTH; i++)
		err = ring_buffer_put(_rbdRx, (uint16_t *) &SciaRegs.SCIRXBUF.all);
#endif

	return;

	SciaRegs.SCIFFRX.bit.RXFFOVRCLR = 1;   // Clear Overflow flag
	SciaRegs.SCIFFRX.bit.RXFFINTCLR = 1;   // Clear Interrupt flag

	PieCtrlRegs.PIEACK.bit.ACK9 = 1;       // Issue PIE ack
}

/* ------------------------------------------------------------------------- */

void scia_fifo_config(const uint32_t baudrate) {
	SciaRegs.SCICCR.all = 0x0007;      // 1 stop bit,  No loopback
	// No parity,8 char bits,
	// async mode, idle-line protocol
	SciaRegs.SCICTL1.all = 0x0003;     // enable TX, RX, internal SCICLK,
	// Disable RX ERR, SLEEP, TXWAKE
	SciaRegs.SCICTL2.bit.TXINTENA = 1;
	SciaRegs.SCICTL2.bit.RXBKINTENA = 1;
	SciaRegs.SCIHBAUD.all = 0x0000;
	SciaRegs.SCILBAUD.all = LSPCLK_DEFAULT / (baudrate * 8) - 1;
	SciaRegs.SCICCR.bit.LOOPBKENA = 0;  // Enable loop back
	SciaRegs.SCIFFTX.all = 0xC022;
	SciaRegs.SCIFFRX.all = 0x0022;
	SciaRegs.SCIFFCT.all = 0x00;

	SciaRegs.SCICTL1.all = 0x0023;     // Relinquish SCI from Reset
	SciaRegs.SCIFFTX.bit.TXFIFORESET = 1;
	SciaRegs.SCIFFRX.bit.RXFIFORESET = 1;
}

void scia_config(const uint32_t baudrate) {
	SciaRegs.SCICCR.all = 0x0007;
	SciaRegs.SCICTL1.all = 0x0003;
	SciaRegs.SCICTL2.bit.TXINTENA = 1;
	SciaRegs.SCICTL2.bit.RXBKINTENA = 1;
	SciaRegs.SCIHBAUD.all = 0;
	SciaRegs.SCILBAUD.all = LSPCLK_DEFAULT / (baudrate * 8) - 1;
	SciaRegs.SCICTL1.all = 0x0023;  // Relinquish SCI from Reset
}

/* ------------------------------------------------------------------------- */

#ifdef RING_BUFF
void MD_SCI_putsRing(const char * str) {
	ring_buffer_put(_rbdTx, (char *) str);
}
#endif

void MD_SCI_init(const uint32_t baudrate) {
//	GPIO_SetupPinMux(42, GPIO_MUX_CPU1, 1);
//	GPIO_SetupPinOptions(42, GPIO_INPUT, GPIO_PUSHPULL);
//	GPIO_SetupPinMux(43, GPIO_MUX_CPU1, 1);
//	GPIO_SetupPinOptions(43, GPIO_OUTPUT, GPIO_ASYNC);
    EALLOW;
    GpioCtrlRegs.GPBMUX1.bit.GPIO42 = 3;
    GpioCtrlRegs.GPBMUX1.bit.GPIO43 = 3;
    GpioCtrlRegs.GPBGMUX1.bit.GPIO42 = 3;
    GpioCtrlRegs.GPBGMUX1.bit.GPIO43 = 3;
    EDIS;

	// Interrupts that are used in this example are re-mapped to
	// ISR functions found within this file.
	EALLOW;  // This is needed to write to EALLOW protected registers
	PieVectTable.SCIA_RX_INT = &sciaRxFifoIsr;
	PieVectTable.SCIA_TX_INT = &sciaTxFifoIsr;
	EDIS;    // This is needed to disable write to EALLOW protected registers

#ifdef RING_BUFF
//	scia_fifo_config(baudrate);
	scia_config(baudrate);

	/* Initialize the ring buffer */
	rb_attr_t attrRx = {
			sizeof(_rbmemRx[0]),
			sizeof(_rbmemRx) / sizeof(_rbmemRx[0]),
			_rbmemRx
	};

	rb_attr_t attrTx = {
			sizeof(_rbmemTx[0]),
			sizeof(_rbmemTx) / sizeof(_rbmemTx[0]),
			_rbmemTx
	};

	ring_buffer_init(&_rbdRx, &attrRx);
	ring_buffer_init(&_rbdTx, &attrTx);
#else
	scia_config(baudrate);
#endif
}

void MD_SCI_puts(const char * buf) {
	while (*buf != '\0') {
		while (!SciaRegs.SCICTL2.bit.TXRDY);;
		SciaRegs.SCITXBUF.all = *buf++;
	}
}

/* ------------------------------------------------------------------------- */

int SCI_open(const char * path, unsigned flags, int llv_fd) {
	if (deviceOpen) {
		return (-1);
	}
	else {
		deviceOpen = 1;
		return (1);
	}
}

int SCI_read(int dev_fd, char * buf, unsigned count) {
	uint16_t readCount = 0;
	uint16_t * bufPtr = (uint16_t *) buf;

	if (count == 0) {
		return (0);
	}

	while ((readCount < count) && SciaRegs.SCIRXST.bit.RXRDY) {
		*bufPtr = SciaRegs.SCIRXBUF.all;
		readCount++;
		bufPtr++;
	}

	return (readCount);
}

int SCI_write(int dev_fd, const char * buf, unsigned count) {
	uint16_t writeCount = 0;
	uint16_t * bufPtr = (uint16_t *) buf;

	if (count == 0) {
		return (0);
	}

	while (writeCount < count) {
		while (!SciaRegs.SCICTL2.bit.TXRDY)
			;
		SciaRegs.SCITXBUF.all = *bufPtr;
		writeCount++;
		bufPtr++;
	}

	return (writeCount);
}

int SCI_close(int dev_fd) {
	if ((dev_fd != 1) || (!deviceOpen)) {
		return (-1);
	}
	else {
		deviceOpen = 0;
		return (0);
	}
}

/* ------------------------------------------------------------------------- */

#ifdef UPPER_SCI
void drawTILogo(void) {
	unsigned char ucChar, lastChar;

	putchar('\n');
	while (indexY < 45) {
		if (indexY < 45) {
			if (indexX < 77) {
				ucChar = ti_ascii[indexY][indexX++];

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

void clearTextBox(void) {
	putchar(0x08);

	// Move back 24 columns
	putchar(0x1B);
	putchar('[');
	putchar('2');
	putchar('6');
	putchar('D');

	// Move up 3 lines
	putchar(0x1B);
	putchar('[');
	putchar('3');
	putchar('A');

	// Change to Red text
	putchar(escRed[0]);
	putchar(escRed[1]);
	putchar(escRed[2]);
	putchar(escRed[3]);
	putchar(escRed[4]);

	printf((char*) pucTempString);

	// Move down 1 lines
	putchar(0x1B);
	putchar('[');
	putchar('1');
	putchar('B');

	// Move back 20 columns
	putchar(0x1B);
	putchar('[');
	putchar('2');
	putchar('0');
	putchar('D');

	// Save cursor position
	putchar(0x1B);
	putchar('[');
	putchar('s');
}

void cursorRestore(void) {
	putchar(0x1B);
	putchar('[');
	putchar('u');
//	printf("%d               ", currentSample);
}
#endif
