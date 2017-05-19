/**
 * @file        md_beast_uart.h
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
#ifndef MD_BEAST_UART_H_
#define MD_BEAST_UART_H_

#ifdef __cplusplus
extern "C" {
#endif

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  Includes  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
//#include "md_circ_buffer.h"
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~  Configuration  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~  Public typedefs  ~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~~~  Public macro definitions  ~~~~~~~~~~~~~~~~~~~~~~ */
#define SCI_HW_TX_FIFO_DEPTH	16
#define SCI_HW_RX_FIFO_DEPTH	16
/* ~~~~~~~~~~~~~~~~~~~~~  Public variable definitions  ~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~~  Public function prototypes  ~~~~~~~~~~~~~~~~~~~~~ */

// (LSPCLK) derived from SYSCLK. LSPCLK uses a /4 divider by default,
// but the ratio can be changed via the LOSPCP register
#define LSPCLK_DEFAULT	(SYSCLKOUT / 4)

extern char txBuff[];    // Send data for SCI-A
extern char rxBuff[];    // Received data for SCI-A

extern const unsigned char escRed[];
extern const unsigned char escWhite[];
extern const unsigned char escLeft[];

interrupt void sciaTxFifoIsr(void);
interrupt void sciaRxFifoIsr(void);

void scia_fifo_config(const uint32_t baudrate);
void scia_config(const uint32_t baudrate);

void MD_SCI_putsRing(const char * str);
void MD_SCI_init(const uint32_t baudrate);
void MD_SCI_puts(const char * buf);

int SCI_open(const char * path, unsigned flags, int llv_fd);
int SCI_read(int dev_fd, char * buf, unsigned count);
int SCI_write(int dev_fd, const char * buf, unsigned count);
int SCI_close(int dev_fd);

void drawTILogo(void);
void clearTextBox(void);
void cursorRestore(void);


#ifdef __cplusplus
}
#endif

#endif
