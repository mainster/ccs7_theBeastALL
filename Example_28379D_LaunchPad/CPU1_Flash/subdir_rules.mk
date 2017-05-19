################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
Example_F28379D_LaunchPadDemo.obj: /opt/ti/c2000ware/device_support/f2837xd/examples/cpu1/launchxl_f28379d/cpu01/Example_F28379D_LaunchPadDemo.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="Example_F28379D_LaunchPadDemo.d" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

sci_io.obj: /opt/ti/c2000ware/device_support/f2837xd/examples/cpu1/launchxl_f28379d/cpu01/sci_io.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -O4 --opt_for_speed=0 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D -g --printf_support=minimal --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="sci_io.d" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


