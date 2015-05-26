#!/bin/bash			
#$ -V			
#$ -cwd			
#$ -pe 1way 12			
#$ -q normal			
#$ -l h_rt=00:15:00			
#$ -A Springer_Vaughn			
#$ -o /scratch/01955/water157/Mo17memory_samplenaming_o-$TASK_ID			
#$ -e /scratch/01955/water157/Mo17memory_samplenaming_e-$TASK_ID			
#$ -m e			
#$ -M water157@umn.edu		
#$ -N Mo17memory_samplenaming			
			
cd /scratch/01955/water157		
			
if [[ ${SGE_STDOUT_PATH} =~ /scratch/01955/water157/Mo17memory_samplenaming_o-(.+) ]]; then			
    TASK=${BASH_REMATCH[1]}			
fi			
			
NAME=`/bin/sed -n ${TASK}p /scratch/01955/water157/Mo17_memory_samples_Mandy.txt | cut -f 1`			
FIRSTLANE=`/bin/sed -n ${TASK}p /scratch/01955/water157/Mo17_memory_samples_Mandy.txt | cut -f 2`			
#SECLANE=`/bin/sed -n ${TASK}p /scratch/01595/springer/Mo17_memory_samples_Mandy.txt | cut -f 3`			
#THIRDLANE=`/bin/sed -n ${TASK}p /scratch/01595/springer/Mo17_memory_samples_Mandy.txt | cut -f 4`
#removed these since they weren't relevant with single samples
			
BASE="/corral-tacc/tacc/iplant/vaughn/springer_vaughn/eichten/waters"			
			
#cat ${FIRSTLANE}_R1_001.fastq ${SECLANE}_R1_001.fastq ${THIRDLANE}_R1_001.fastq > ${BASE}/${NAME}_R1.fastq			
			
#cat ${FIRSTLANE}_R2_001.fastq ${SECLANE}_R2_001.fastq ${THIRDLANE}_R2_001.fastq > ${BASE}/${NAME}_R2.fastq		

#The cat commands are removed for now and the mv commands below are simple ways to mv and rename the files

mv ${FIRSTLANE}_R1_001.fastq ${BASE}/${NAME}_R1.fastq

mv ${FIRSTLANE}_R2_001.fastq ${BASE}/${NAME}_R2.fastq

