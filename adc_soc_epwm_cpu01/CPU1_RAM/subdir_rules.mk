################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
adc_soc_epwm_cpu01.obj: /opt/ti/c2000ware/device_support/f2837xd/examples/cpu1/adc_soc_epwm/cpu01/adc_soc_epwm_cpu01.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_17.3.0.STS/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --define=CPU1 -g --diag_suppress=1311 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="adc_soc_epwm_cpu01.d" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


