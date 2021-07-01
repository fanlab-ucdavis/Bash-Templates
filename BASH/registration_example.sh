#!/bin/bash

### Directories 
FSL_DIR=/data/condorWorkspace/fsl5.9/fsl/bin
FSL6_DIR=/data/condorWorkspace/fsl6/bin
MRICRO_PATH=/data/condorWorkspace/bin/dcm2niix

### Participant Directories ( Ouput_DIR=where you want your re
# nifti images (Perf_DIR: file of perfusion weighted image directory, M0_DIR file of proton density image output from Basil, Struct_DIR=file of structural weighted image_
perf_DIR=/Users/cdonnay/Desktop/65031/ASL/BASIL/Basil/native_space/perfusion_calib.nii.gz
M0_DIR=/Users/cdonnay/Desktop/65031/ASL/BASIL/Basil/calib/M0.nii.gz
struct_DIR=/Users/cdonnay/Desktop/65031/Segmented/65031_080818_3DT1_Brain_corrSmTP_segmentedWMT-Z4T_PMatched_fslspace.nii.gz
# folder where you output everything 
output_DIR=//Users/cdonnay/Desktop/65031/registration

############ REGISTRATION
mkdir ${output_DIR}

if [ ! -f ${output_DIR}/perfusion_calb_seg.nii.gz ]
then

flirt -in ${struct_DIR} -ref ${M0_DIR} -out ${output_DIR}/struct2funct6dof.nii.gz -omat ${output_DIR}/struct2funct6dof.mat -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 9  -interp trilinear

convert_xfm -omat ${output_DIR}/funct2struct6dof.mat -inverse ${output_DIR}/struct2funct6dof.mat

flirt -in ${perf_DIR} -applyxfm -init ${output_DIR}/funct2struct6dof.mat -out ${output_DIR}/perfusion_calb_seg -paddingsize 0.0 -interp trilinear -ref ${struct_DIR}

echo finished registration to structural space

fi


############ view REGISTRATION in PNG (outputting a png of a red outline of the structural image on top of your perfusion image)

slices ${output_DIR}/perfusion_calb_seg ${struct_DIR} -o ${output_DIR}/perf_registration.png


