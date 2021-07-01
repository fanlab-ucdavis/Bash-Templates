/bin/bash -f

# Preprocessing Script for one participant in command line you can run hundreds of jobs using awk.  Prepare a separate file with two columns one with the ID numbers and one with the Dates (MMDDYY). In the command line, run this line:

# awk '{print "echo \"/bbdata/corinne/Example_batch.sh "$1" "$2"\" |qsub"}' /bbdata/corinne/ID_DATE_list.txt | sh

# to check the status of your job, type stat
set -u
ID=${1}
DATE=${2}

# MODIFY FOLLOWING DIRECTORIES 
# MRICRO_PATH IS THE PATH TO dcm2niix
# FSL_PATH IS THE MAIN FSL PATH AND SHOULD CONTAIN BIN/, CONFIG/, LIB/... SUBDIRECTORIES)

shopt -s extglob

##### General Directories #####

MRICRO_PATH=/data/condorWorkspace/bin/dcm2niix
FSL_PATH=/data/condorWorkspace/fsl5.9/fsl/bin/
FSL_PATH6=/data/condorWorkspace/fsl6/bin
home_dir=/bbdata/corinne/ADRC
LABELS=/bbdata/corinne/Reference/

echo ${ID} ${DATE}

##### Analysis per participant #####



