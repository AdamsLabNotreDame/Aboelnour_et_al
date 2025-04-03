#!/bin/bash

#$ -M eaboelno@nd.edu                   # Email address for job notification
#$ -m abe                               # Send mail when job begins, ends, and aborts
#$ -pe smp 1                            # Specify parallel environment and legal core size
#$ -q gpu                               # Run on the GPU cluster
#$ -l gpu_card=1                        # Run on 1 GPU card
#$ -N sysVI_Merged_new                  # Specify job name

# Activate scVI env
mamba activate sysVI

# Load data
python example_sysVI.py

# Unload modules
mamba deactivate
