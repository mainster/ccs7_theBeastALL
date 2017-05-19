################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
device/driverlib/sci.obj: ../device/driverlib/sci.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 -Ooff --include_path="/media/data/CODES/ccs7_theBeast/_adc_ex1_soc_software" --include_path="/media/data/CODES/ccs7_theBeast/_adc_ex1_soc_software/device" --include_path="/opt/ti/controlSUITE/device_support/F2837xD/v200/common/driverlib" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.9.1.LTS/include" --advice:performance=all --define=CPU1 --define=DEBUG --define=DLIB --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="device/driverlib/sci.d" --obj_directory="device/driverlib" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


