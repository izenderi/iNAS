################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
dsplib/source/matrix/%.obj: ../dsplib/source/matrix/%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP430 Compiler'
	"/Applications/ti/ccs1210/ccs/tools/compiler/ti-cgt-msp430_21.6.0.LTS/bin/cl430" -vmspx --data_model=restricted --use_hw_mpy=F5 --include_path="/Applications/ti/ccs1210/ccs/ccs_base/msp430/include" --include_path="/Users/ziliang/Developer/Git/iNAS/intermittent-inference-library/driverlib/MSP430FR5xx_6xx" --include_path="/Users/ziliang/Developer/Git/iNAS/intermittent-inference-library/dsplib/include" --include_path="/Users/ziliang/Developer/Git/iNAS/intermittent-inference-library" --include_path="/Applications/ti/ccs1210/ccs/tools/compiler/ti-cgt-msp430_21.6.0.LTS/include" --advice:power="all" --advice:hw_config="all" --define=__MSP430FR5994__ --define=_MPU_ENABLE -g --printf_support=minimal --diag_warning=225 --diag_wrap=off --display_error_number --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU40 --preproc_with_compile --preproc_dependency="dsplib/source/matrix/$(basename $(<F)).d_raw" --obj_directory="dsplib/source/matrix" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


