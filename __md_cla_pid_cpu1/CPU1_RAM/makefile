################################################################################
# Automatically-generated file. Do not edit!
################################################################################

CG_TOOL_ROOT := /opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS

GEN_OPTS__FLAG := 
GEN_CMDS__FLAG := 

ORDERED_OBJS += \
"./md_cla_pid_cpu1.obj" \
"./bsp/F2837xD_Adc.obj" \
"./bsp/F2837xD_CpuTimers.obj" \
"./bsp/F2837xD_EPwm.obj" \
"./bsp/F2837xD_Gpio.obj" \
"./bsp/F2837xD_PieVect.obj" \
"./bsp/F2837xD_SysCtrl.obj" \
"./bsp/F2837xD_struct.obj" \
"./device/device.obj" \
"./device/driverlib/adc.obj" \
"../2837xD_RAM_lnk_cpu1.cmd" \
"../driverlib.lib" \
"../device/driverlib/ccs/Debug/driverlib.lib" \
$(GEN_CMDS__FLAG) \
-llibc.a \

-include ../makefile.init

RM := rm -rf
RMDIR := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include bsp/subdir_vars.mk
-include device/subdir_vars.mk
-include device/driverlib/subdir_vars.mk
-include device/driverlib/ccs/Debug/subdir_vars.mk
-include subdir_rules.mk
-include bsp/subdir_rules.mk
-include device/subdir_rules.mk
-include device/driverlib/subdir_rules.mk
-include device/driverlib/ccs/Debug/subdir_rules.mk
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
md_cla_pid_cpu1.out \

EXE_OUTPUTS__QUOTED += \
"md_cla_pid_cpu1.out" \

BIN_OUTPUTS += \
md_cla_pid_cpu1.hex \

BIN_OUTPUTS__QUOTED += \
"md_cla_pid_cpu1.hex" \


# All Target
all: $(OBJS) $(CMD_SRCS) $(LIB_SRCS) $(GEN_CMDS)
	@$(MAKE) --no-print-directory -Onone "md_cla_pid_cpu1.out"

# Tool invocations
md_cla_pid_cpu1.out: $(OBJS) $(CMD_SRCS) $(LIB_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: C2000 Linker'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --define=DEBUG --define=CPU1 --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number -z -m"md_cla_pid_cpu1.map" --stack_size=0x100 --warn_sections -i"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/lib" -i"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --reread_libs --diag_wrap=off --display_error_number --xml_link_info="md_cla_pid_cpu1_linkInfo.xml" --rom_model -o "md_cla_pid_cpu1.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '

md_cla_pid_cpu1.hex: $(EXE_OUTPUTS)
	@echo 'Invoking: C2000 Hex Utility'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/hex2000"  -o "md_cla_pid_cpu1.hex" $(EXE_OUTPUTS__QUOTED)
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(BIN_OUTPUTS__QUOTED)$(EXE_OUTPUTS__QUOTED)
	-$(RM) "md_cla_pid_cpu1.obj" "bsp/F2837xD_Adc.obj" "bsp/F2837xD_CpuTimers.obj" "bsp/F2837xD_EPwm.obj" "bsp/F2837xD_Gpio.obj" "bsp/F2837xD_PieVect.obj" "bsp/F2837xD_SysCtrl.obj" "bsp/F2837xD_struct.obj" "device/device.obj" "device/driverlib/adc.obj" 
	-$(RM) "md_cla_pid_cpu1.d" "bsp/F2837xD_Adc.d" "bsp/F2837xD_CpuTimers.d" "bsp/F2837xD_EPwm.d" "bsp/F2837xD_Gpio.d" "bsp/F2837xD_PieVect.d" "bsp/F2837xD_SysCtrl.d" "bsp/F2837xD_struct.d" "device/device.d" "device/driverlib/adc.d" 
	-@echo 'Finished clean'
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

