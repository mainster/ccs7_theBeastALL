################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
md_launchPad_v2.obj: ../md_launchPad_v2.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --include_path="/headers/include" --include_path="/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D --define=_FLASH -g --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="md_launchPad_v2.d" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

sci_io.obj: ../sci_io.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --include_path="/headers/include" --include_path="/common/include" --advice:performance=all --define=CPU1 --define=_LAUNCHXL_F28379D --define=_FLASH -g --diag_suppress=1311 --diag_suppress=552 --diag_warning=225 --display_error_number --preproc_with_compile --preproc_dependency="sci_io.d" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


