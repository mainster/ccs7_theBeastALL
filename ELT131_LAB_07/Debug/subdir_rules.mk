################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
ELT131_LAB_07_01.obj: ../ELT131_LAB_07_01.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C2000 Compiler'
	"/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/bin/cl2000" -v28 -ml -mt --cla_support=cla1 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu2 --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07/bsp" --include_path="/opt/ti/c2000ware/device_support/f2837xd/common/include" --include_path="/opt/ti/c2000ware/device_support/f2837xd/headers/include" --include_path="/media/data/CODES/ccs7_theBeast/ELT131_LAB_07" --include_path="/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS/include" --advice:performance=all --define=F_CPU=200e6 --define=CPU1 --define=RTOS_DISPATCHER --define=RTOS --define=xdc__strict --define=FLASH -g --c99 --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="ELT131_LAB_07_01.d" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

build-1585558241:
	@$(MAKE) -Onone -f subdir_rules.mk build-1585558241-inproc

build-1585558241-inproc: ../app_03.cfg
	@echo 'Building file: $<'
	@echo 'Invoking: XDCtools'
	"/opt/ti/xdctools_3_32_00_06_core/xs" --xdcpath="/opt/ti/tirtos_c2000_2_16_01_14/packages;/opt/ti/tirtos_c2000_2_16_01_14/products/tidrivers_c2000_2_16_01_13/packages;/opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages;/opt/ti/tirtos_c2000_2_16_01_14/products/ndk_2_25_00_09/packages;/opt/ti/tirtos_c2000_2_16_01_14/products/uia_2_00_05_50/packages;" xdc.tools.configuro -o configPkg -t ti.targets.C28_float -p ti.platforms.tms320x28:TMS320F28379D -r release -c "/opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS" --compileOptions "-g --optimize_with_debug" "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/linker.cmd: build-1585558241 ../app_03.cfg
configPkg/compiler.opt: build-1585558241
configPkg/: build-1585558241


