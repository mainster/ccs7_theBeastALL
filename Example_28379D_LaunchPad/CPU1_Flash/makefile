################################################################################
# Automatically-generated file. Do not edit!
################################################################################

CG_TOOL_ROOT := /opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS

GEN_OPTS__FLAG := 
GEN_CMDS__FLAG := 

ORDERED_OBJS += \
"./Example_F28379D_LaunchPadDemo.obj" \
"./sci_io.obj" \
"./abs/Example_F28379D_LaunchPadDemo.obj" \
"./abs/F2837xD_Adc.obj" \
"./abs/F2837xD_CodeStartBranch.obj" \
"./abs/F2837xD_CpuTimers.obj" \
"./abs/F2837xD_DefaultISR.obj" \
"./abs/F2837xD_GlobalVariableDefs.obj" \
"./abs/F2837xD_Gpio.obj" \
"./abs/F2837xD_PieCtrl.obj" \
"./abs/F2837xD_PieVect.obj" \
"./abs/F2837xD_Sci.obj" \
"./abs/F2837xD_SysCtrl.obj" \
"./abs/F2837xD_usDelay.obj" \
"./abs/sci_io.obj" \
"./bsp/F2837xD_Adc.obj" \
"./bsp/F2837xD_CodeStartBranch.obj" \
"./bsp/F2837xD_CpuTimers.obj" \
"./bsp/F2837xD_DefaultISR.obj" \
"./bsp/F2837xD_GlobalVariableDefs.obj" \
"./bsp/F2837xD_Gpio.obj" \
"./bsp/F2837xD_PieCtrl.obj" \
"./bsp/F2837xD_PieVect.obj" \
"./bsp/F2837xD_Sci.obj" \
"./bsp/F2837xD_SysCtrl.obj" \
"./bsp/F2837xD_usDelay.obj" \
"../2837xD_FLASH_lnk_cpu1.cmd" \
"../F2837xD_Headers_nonBIOS_cpu1.cmd" \
$(GEN_CMDS__FLAG) \
-lrts2800_fpu32.lib \
-llibc.a \

-include ../makefile.init

RM := rm -rf
RMDIR := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include abs/subdir_vars.mk
-include bsp/subdir_vars.mk
-include subdir_rules.mk
-include abs/subdir_rules.mk
-include bsp/subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(INO_DEPS)),)
-include $(INO_DEPS)
endif
ifneq ($(strip $(CLA_DEPS)),)
-include $(CLA_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(SV7A_DEPS)),)
-include $(SV7A_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(PDE_DEPS)),)
-include $(PDE_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXE_OUTPUTS += \
Example_28379D_LaunchPad.out \

EXE_OUTPUTS__QUOTED += \
"Example_28379D_LaunchPad.out" \

BIN_OUTPUTS += \
Example_28379D_LaunchPad.hex \

BIN_OUTPUTS__QUOTED += \
"Example_28379D_LaunchPad.hex" \


# All Target
all: Example_28379D_LaunchPad.out secondary-outputs

# Tool invocations
Example_28379D_LaunchPad.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: C2000 Linker'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number -z -m"Example_28379D_LaunchPad.map" --heap_size=0x400 --stack_size=0x100 --warn_sections -i"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/lib" -i"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --reread_libs --display_error_number --xml_link_info="Example_28379D_LaunchPad_linkInfo.xml" --rom_model -o "Example_28379D_LaunchPad.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '

Example_28379D_LaunchPad.hex: $(EXE_OUTPUTS)
	@echo 'Invoking: C2000 Hex Utility'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/hex2000"  -o "Example_28379D_LaunchPad.hex" $(EXE_OUTPUTS__QUOTED)
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(BIN_OUTPUTS__QUOTED)$(EXE_OUTPUTS__QUOTED)
	-$(RM) "Example_F28379D_LaunchPadDemo.obj" "sci_io.obj" "abs/Example_F28379D_LaunchPadDemo.obj" "abs/F2837xD_Adc.obj" "abs/F2837xD_CodeStartBranch.obj" "abs/F2837xD_CpuTimers.obj" "abs/F2837xD_DefaultISR.obj" "abs/F2837xD_GlobalVariableDefs.obj" "abs/F2837xD_Gpio.obj" "abs/F2837xD_PieCtrl.obj" "abs/F2837xD_PieVect.obj" "abs/F2837xD_Sci.obj" "abs/F2837xD_SysCtrl.obj" "abs/F2837xD_usDelay.obj" "abs/sci_io.obj" "bsp/F2837xD_Adc.obj" "bsp/F2837xD_CodeStartBranch.obj" "bsp/F2837xD_CpuTimers.obj" "bsp/F2837xD_DefaultISR.obj" "bsp/F2837xD_GlobalVariableDefs.obj" "bsp/F2837xD_Gpio.obj" "bsp/F2837xD_PieCtrl.obj" "bsp/F2837xD_PieVect.obj" "bsp/F2837xD_Sci.obj" "bsp/F2837xD_SysCtrl.obj" "bsp/F2837xD_usDelay.obj" 
	-$(RM) "Example_F28379D_LaunchPadDemo.d" "sci_io.d" "abs/Example_F28379D_LaunchPadDemo.d" "abs/F2837xD_Adc.d" "abs/F2837xD_CpuTimers.d" "abs/F2837xD_DefaultISR.d" "abs/F2837xD_GlobalVariableDefs.d" "abs/F2837xD_Gpio.d" "abs/F2837xD_PieCtrl.d" "abs/F2837xD_PieVect.d" "abs/F2837xD_Sci.d" "abs/F2837xD_SysCtrl.d" "abs/sci_io.d" "bsp/F2837xD_Adc.d" "bsp/F2837xD_CpuTimers.d" "bsp/F2837xD_DefaultISR.d" "bsp/F2837xD_GlobalVariableDefs.d" "bsp/F2837xD_Gpio.d" "bsp/F2837xD_PieCtrl.d" "bsp/F2837xD_PieVect.d" "bsp/F2837xD_Sci.d" "bsp/F2837xD_SysCtrl.d" 
	-$(RM) "abs/F2837xD_CodeStartBranch.d" "abs/F2837xD_usDelay.d" "bsp/F2837xD_CodeStartBranch.d" "bsp/F2837xD_usDelay.d" 
	-@echo 'Finished clean'
	-@echo ' '

secondary-outputs: $(BIN_OUTPUTS)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

