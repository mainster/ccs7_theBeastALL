################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
abs/Example_F28379D_LaunchPadDemo.obj: ../abs/Example_F28379D_LaunchPadDemo.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/Example_F28379D_LaunchPadDemo.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_Adc.obj: ../abs/F2837xD_Adc.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_Adc.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_CodeStartBranch.obj: ../abs/F2837xD_CodeStartBranch.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_CodeStartBranch.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_CpuTimers.obj: ../abs/F2837xD_CpuTimers.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_CpuTimers.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_DefaultISR.obj: ../abs/F2837xD_DefaultISR.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_DefaultISR.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_GlobalVariableDefs.obj: ../abs/F2837xD_GlobalVariableDefs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_GlobalVariableDefs.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_Gpio.obj: ../abs/F2837xD_Gpio.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_Gpio.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_PieCtrl.obj: ../abs/F2837xD_PieCtrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_PieCtrl.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_PieVect.obj: ../abs/F2837xD_PieVect.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_PieVect.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_Sci.obj: ../abs/F2837xD_Sci.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_Sci.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_SysCtrl.obj: ../abs/F2837xD_SysCtrl.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_SysCtrl.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/F2837xD_usDelay.obj: ../abs/F2837xD_usDelay.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/F2837xD_usDelay.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

abs/sci_io.obj: ../abs/sci_io.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="abs/sci_io.d" --obj_directory="abs" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


