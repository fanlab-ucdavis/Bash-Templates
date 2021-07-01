#!/bin/bash

# Example script outline for creating directory 

##### General directories #####
FSL_DIR=/data/condorWorkspace/fsl5.9/fsl/bin
FSL6_DIR=/data/condorWorkspace/fsl6/bin
MRICRO_PATH=/data/condorWorkspace/bin/

##### Create folder where the analysis will take place #####

mkdir /bbdata/my_name
mkdir /bbdata/my_name/my_project

while read line
do
array=( $line )
ID=( ${array[0]} )
echo ${ID}
cd ${home_dir}${ID}
DATE=( ${array[1]} )
echo ${DATE}

#Organize and create folders 

mkdir /bbdata/my_name/my_project/${ID}
mkdir /bbdata/my_name/my_project/${ID}/${DATE}

mkdir /bbdata/my_name/my_project/${ID}/${DATE}/fmri
mkdir /bbdata/my_name/my_project/${ID}/${DATE}/structural


# Directories 

FMRI_DICOM_DIR=
FMRI_OUTPUT_DIR=bbdata/my_name/my_project/${ID}/${DATE}/fmri

STRUCTURAL_DICOM_DIR=/studies/adc/${ID}/${DATE}/
STRUCTURAL_OUTPUT_DIR=/bbdata/my_name/my_project/${ID}/${DATE}/structural

##### Convert DICOM to NIFTI for functional and structural images ##### 

${MRICRO_PATH}/dcm2niix -o ${FMRI_OUTPUT_DIR} -f MYNAME%f -z y ${FMRI_DICOM_DIR}

${MRICRO_PATH}/dcm2niix -o ${STRUCTURAL_OUTPUT_DIR} -f MYNAME%f -z y ${STRUCTURAL_DICOM_DIR}

done < /MY_LIST.txt