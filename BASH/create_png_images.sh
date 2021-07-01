#!/bin/bash
# Website for these: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Miscvis

##### Directories ##### 
FSL_DIR=/data/condorWorkspace/fsl5.9/fsl/bin
FSL6_DIR=/data/condorWorkspace/fsl6/bin
MRICRO_PATH=/data/condorWorkspace/bin/dcm2niix

while read line
do
array=( $line )
ID=( ${array[0]} )
echo ${ID}
cd ${home_dir}${ID}
DATE=( ${array[1]} )
echo ${DATE}

${input_DIR}=
${output_DIR}=

##### output mid-sagittal, -coronal and -axial slices into one png image with min intensity 0 and max intensity 120 #####

${FSL_DIR}/slicer ${input_DIR}/input_image -a -i 0 120 ${output_DIR}/${ID}_${DATE}_output_image.png

done < /MY_LIST.txt
