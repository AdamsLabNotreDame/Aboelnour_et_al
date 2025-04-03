#!/bin/bash

#$ -M eaboelno@nd.edu   # email address for job notification
#$ -m abe               # send mail for begin, end, or abort
#$ -pe smp 1            # specify parallel env and legal core size
#$ -q long              # specify queue
#$ -N cellbender        # specify job name

# Activate your Conda environment
conda activate cellbender

# Call on CUDA
module load cuda/11.0

input_file="/scratch365/eaboelno/snRNA_seq_analysis/curpizone/cc2/raw_feature_bc_matrix.h5"
output_file="/scratch365/eaboelno/snRNA_seq_analysis/curpizone/cc2/cellbender_output2/output_file.h5"

cellbender remove-background --cuda --learning-rate 0.00005 --input "$input_file" --output "$output_file"

input_file="/scratch365/eaboelno/snRNA_seq_analysis/lyso/ss2/raw_feature_bc_matrix.h5"
output_file="/scratch365/eaboelno/snRNA_seq_analysis/lyso/ss2/cellbender_output2/output_file.h5"

cellbender remove-background --cuda --learning-rate 0.00005 --input "$input_file" --output "$output_file"

# Deactivate the Conda environment (optional but recommended)
conda deactivate
