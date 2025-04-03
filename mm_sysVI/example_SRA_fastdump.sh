#!/bin/bash

#$ -M eaboelno@nd.edu   # email address for job notification
#$ -m abe               # send mail for begin, end, or abort
#$ -pe smp 1            # specify parallel env and legal core size
#$ -q long              # specify queue
#$ -N sratoolkit53      # specify job name

# Activate sratools
module load bio/2.0

fastq-dump --split-files --origfmt --gzip SRR15622253
