################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
bsp/F2837xD_Adc.obj: ../bsp/F2837xD_Adc.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07/bsp" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --advice:performance=all --define=CPU1 --define=F_CPU=150e6 --define=RTOS_DISPATCHER --define=RTOS --define=xdc__strict --define=FLASH -g --c99 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_Adc.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_CodeStartBranch.obj: ../bsp/F2837xD_CodeStartBranch.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07/bsp" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --advice:performance=all --define=CPU1 --define=F_CPU=150e6 --define=RTOS_DISPATCHER --define=RTOS --define=xdc__strict --define=FLASH -g --c99 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_CodeStartBranch.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_CpuTimers.obj: ../bsp/F2837xD_CpuTimers.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07/bsp" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --advice:performance=all --define=CPU1 --define=F_CPU=150e6 --define=RTOS_DISPATCHER --define=RTOS --define=xdc__strict --define=FLASH -g --c99 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_CpuTimers.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_GlobalVariableDefs.obj: ../bsp/F2837xD_GlobalVariableDefs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07/bsp" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --advice:performance=all --define=CPU1 --define=F_CPU=150e6 --define=RTOS_DISPATCHER --define=RTOS --define=xdc__strict --define=FLASH -g --c99 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_GlobalVariableDefs.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_PieCtrl.obj: ../bsp/F2837xD_PieCtrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07/bsp" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --advice:performance=all --define=CPU1 --define=F_CPU=150e6 --define=RTOS_DISPATCHER --define=RTOS --define=xdc__strict --define=FLASH -g --c99 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_PieCtrl.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_SysCtrl.obj: ../bsp/F2837xD_SysCtrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07/bsp" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --advice:performance=all --define=CPU1 --define=F_CPU=150e6 --define=RTOS_DISPATCHER --define=RTOS --define=xdc__strict --define=FLASH -g --c99 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_SysCtrl.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

bsp/F2837xD_usDelay.obj: ../bsp/F2837xD_usDelay.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07/bsp" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --advice:performance=all --define=CPU1 --define=F_CPU=150e6 --define=RTOS_DISPATCHER --define=RTOS --define=xdc__strict --define=FLASH -g --c99 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="bsp/F2837xD_usDelay.d" --obj_directory="bsp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


