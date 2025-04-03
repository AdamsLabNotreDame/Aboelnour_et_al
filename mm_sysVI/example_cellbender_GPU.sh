#!/bin/bash

#$ -M eaboelno@nd.edu   # Email address for job notification
#$ -m abe            # Send mail when job begins, ends and aborts
#$ -pe smp 1         # Specify parallel environment and legal core size
#$ -q gpu            # Run on the GPU cluster
#$ -l gpu_card=1     # Run on 1 GPU card
#$ -N cellbender       # Specify job name

#Activate cellbender env
conda activate cellbender

input_file="/scratch365/eaboelno/snRNA_seq_analysis/lyso/ss2/raw_feature_bc_matrix.h5"
output_file="/scratch365/eaboelno/snRNA_seq_analysis/lyso/ss2/cellbender_output3/output_file.h5"

#Complete ambient RNA removal
cellbender remove-background --cuda --learning-rate 0.00001 --input "$input_file" --output "$output_file"

#Prepare a seurat compatible file
ptrepack --complevel 5 /scratch365/eaboelno/snRNA_seq_analysis/lyso/ss2/cellbender_output3/output_file_filtered.h5:/matrix /scratch365/eaboelno/snRNA_seq_analysis/lyso/ss2/cellbender_output2/output_filtered_seurat.h5:/matrix

#Deactivate cellbender env
conda deactivate cellbender
