################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
bsp/F2837xD_Adc.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_Adc.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_Adc.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_CodeStartBranch.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_CodeStartBranch.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_CodeStartBranch.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_CpuTimers.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_CpuTimers.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_CpuTimers.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_DefaultISR.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_DefaultISR.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_DefaultISR.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_EPwm.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_EPwm.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_EPwm.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_GlobalVariableDefs.obj: /opt/ti/c2000ware/device_support/f2837xd/headers/source/F2837xD_GlobalVariableDefs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_GlobalVariableDefs.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_Gpio.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_Gpio.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_Gpio.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_PieCtrl.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_PieCtrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_PieCtrl.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_PieVect.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_PieVect.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_PieVect.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_SysCtrl.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_SysCtrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_SysCtrl.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_usDelay.obj: /opt/ti/c2000ware/device_support/f2837xd/common/source/F2837xD_usDelay.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --fp_mode=relaxed --include_path="/media/data/CODES/ccs7_theBeast/theBeast_DCL_PID_compilable" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/libraries/control/DCL/c28/include" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --advice:performance=all --define=DEBUG --define=CLA_C --define=CPU1 -g --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_usDelay.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


