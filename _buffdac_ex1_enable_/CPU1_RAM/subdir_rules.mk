################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
DCL_PID.obj: ../DCL_PID.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --include_path="/opt/ti/controlSUITE/device_support/F2837xD/v200/common/driverlib" --include_path="/media/data/CODES/ccs7_theBeast/buffdac_ex1_enable_" --include_path="/media/data/CODES/ccs7_theBeast/buffdac_ex1_enable_/device" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --define=_LAUNCHXL_F28379D --define=DEBUG --define=CPU1 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="DCL_PID.d" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

buffdac_ex1_enable.obj: ../buffdac_ex1_enable.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --include_path="/opt/ti/controlSUITE/device_support/F2837xD/v200/common/driverlib" --include_path="/media/data/CODES/ccs7_theBeast/buffdac_ex1_enable_" --include_path="/media/data/CODES/ccs7_theBeast/buffdac_ex1_enable_/device" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --define=_LAUNCHXL_F28379D --define=DEBUG --define=CPU1 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="buffdac_ex1_enable.d" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


