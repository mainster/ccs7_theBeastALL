//###########################################################################
//
// FILE:   adc.c
//
// TITLE:  C28x ADC driver.
//
//###########################################################################
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
//###########################################################################

#include "adc.h"

//*****************************************************************************
//
// Defines for locations of ADC calibration functions in OTP for use in
// ADC_setMode() ONLY. Not intended for use by application code.
//
//*****************************************************************************
// The following functions calibrate the ADC linearity.  Use them in the
// ADC_setMode() function only
#define ADC_calADCAINL          0x0703B4U
#define ADC_calADCBINL          0x0703B2U
#define ADC_calADCCINL          0x0703B0U
#define ADC_calADCDINL          0x0703AEU

// This function looks up the ADC offset trim for a given condition. Use this
// in the ADC_setMode() function only.
#define ADC_getOffsetTrim       0x0703ACU

//*****************************************************************************
//
// ADC_setMode
//
//*****************************************************************************
void
ADC_setMode(uint32_t base, ADC_Resolution resolution,
            ADC_SignalMode signalMode)
{
    uint16_t offsetIndex;
    uint16_t offsetTrim;

    EALLOW;

    switch(base)
    {
        case ADCA_BASE:
            offsetIndex = 0U * 4U;
            if(*(uint16_t *)ADC_calADCAINL != 0xFFFFU)
            {
                // Trim function is programmed into OTP, so call it
                (*((void (*)(void))ADC_calADCAINL))();
            }
            else
            {
                // Do nothing, no INL trim function populated
            }
            break;
        case ADCB_BASE:
            offsetIndex = 1U * 4U;
            if(*(uint16_t *)ADC_calADCBINL != 0xFFFFU)
            {
                // Trim function is programmed into OTP, so call it
                (*((void (*)(void))ADC_calADCBINL))();
            }
            else
            {
                // Do nothing, no INL trim function populated
            }
            break;
        case ADCC_BASE:
            offsetIndex = 2U * 4U;
            if(*(uint16_t *)ADC_calADCCINL != 0xFFFFU)
            {
                // Trim function is programmed into OTP, so call it
                (*((void (*)(void))ADC_calADCCINL))();
            }
            else
            {
                // Do nothing, no INL trim function populated
            }
            break;
        case ADCD_BASE:
            offsetIndex = 3U * 4U;
            if(*(uint16_t *)ADC_calADCDINL != 0xFFFFU)
            {
                // Trim function is programmed into OTP, so call it
                (*((void (*)(void))ADC_calADCDINL))();
            }
            else
            {
                // Do nothing, no INL trim function populated
            }
            break;
    }

    // offset trim function is programmed into OTP, so call it
    if(*(uint16_t *)ADC_getOffsetTrim != 0xFFFFU)
    {
        // Calculate the index into OTP table of offset trims and call
        // function to return the correct offset trim
        offsetIndex += ((signalMode == ADC_MODE_DIFFERENTIAL) ? 1U : 0U) +
                       (2U * ((resolution == ADC_RESOLUTION_16BIT) ? 1U : 0U));

        offsetTrim =
            (*((uint16_t (*)(uint16_t index))ADC_getOffsetTrim))(offsetIndex);
    }
    else
    {
        // Offset trim function is not populated, so set offset trim to 0
        offsetTrim = 0U;
    }

    // Apply the resolution and signalMode to the specified ADC.
    HWREGH(base + ADC_O_CTL2) = (HWREGH(base + ADC_O_CTL2) &
                                 ~(ADC_CTL2_RESOLUTION | ADC_CTL2_SIGNALMODE))|
                                ((uint16_t)resolution | (uint16_t)signalMode);

    // Also apply the offset trim and, if needed, linearity trim correction.
    HWREGH(base + ADC_O_OFFTRIM) = offsetTrim;
    if (resolution == ADC_RESOLUTION_12BIT)
    {
        // 12-bit linearity trim workaround
        HWREG(base + ADC_O_INLTRIM1) &= 0xFFFF0000U;
        HWREG(base + ADC_O_INLTRIM2) &= 0xFFFF0000U;
        HWREG(base + ADC_O_INLTRIM4) &= 0xFFFF0000U;
        HWREG(base + ADC_O_INLTRIM5) &= 0xFFFF0000U;
    }

    EDIS;
}

//*****************************************************************************
//
// ADC_setPPBTripLimits
//
//*****************************************************************************
void
ADC_setPPBTripLimits(uint32_t base, ADC_PPBNumber ppbNumber,
                     int32_t tripHiLimit, int32_t tripLoLimit)
{
    uint32_t ppbHiOffset;
    uint32_t ppbLoOffset;

    //
    // Check the arguments.
    //
    ASSERT(ADC_isBaseValid(base));
    ASSERT((tripHiLimit <= 65535) && (tripHiLimit >= -65536));
    ASSERT((tripLoLimit <= 65535) && (tripLoLimit >= -65536));

    //
    // Get the offset to the appropriate trip limit registers.
    //
    ppbHiOffset = (ADC_PPBxTRIPHI_STEP * (uint32_t)ppbNumber) +
                  ADC_O_PPB1TRIPHI;
    ppbLoOffset = (ADC_PPBxTRIPLO_STEP * (uint32_t)ppbNumber) +
                  ADC_O_PPB1TRIPLO;

    EALLOW;

    //
    // Set the trip high limit.
    //
    HWREG(base + ppbHiOffset) =
        (HWREG(base + ppbHiOffset) & ~ADC_PPBTRIP_MASK) |
        ((uint32_t)tripHiLimit & ADC_PPBTRIP_MASK);

    //
    // Set the trip low limit.
    //
    HWREG(base + ppbLoOffset) =
        (HWREG(base + ppbLoOffset) & ~ADC_PPBTRIP_MASK) |
        ((uint32_t)tripLoLimit & ADC_PPBTRIP_MASK);

    EDIS;
}
