#!/bin/bash

#$ -M eaboelno@nd.edu      # Email address for job notification
#$ -m abe                  # Send mail when job begins, ends and aborts
#$ -pe mpi-24 24           # Specify parallel environment and legal core size
#$ -q long                 # Specify queue
#$ -N cellranger_Pandey1   # Specify job name

/afs/crc.nd.edu/user/e/eaboelno/cellranger/cellranger-7.2.0/cellranger count --id=SRR15622247 --fastqs=/afs/crc.nd.edu/user/e/eaboelno/SRA/ --sample=SRR15622247 --transcriptome=/afs/crc.nd.edu/user/e/eaboelno/cellranger/refdata-gex-mm10-2020-A --chemistry=threeprime

/afs/crc.nd.edu/user/e/eaboelno/cellranger/cellranger-7.2.0/cellranger count --id=SRR15622248 --fastqs=/afs/crc.nd.edu/user/e/eaboelno/SRA/ --sample=SRR15622248 --transcriptome=/afs/crc.nd.edu/user/e/eaboelno/cellranger/refdata-gex-mm10-2020-A --chemistry=threeprime

/afs/crc.nd.edu/user/e/eaboelno/cellranger/cellranger-7.2.0/cellranger count --id=SRR15622249 --fastqs=/afs/crc.nd.edu/user/e/eaboelno/SRA/ --sample=SRR15622249 --transcriptome=/afs/crc.nd.edu/user/e/eaboelno/cellranger/refdata-gex-mm10-2020-A --chemistry=threeprime

/afs/crc.nd.edu/user/e/eaboelno/cellranger/cellranger-7.2.0/cellranger count --id= SRR15622250 --fastqs=/afs/crc.nd.edu/user/e/eaboelno/SRA/ —sample= SRR15622250 --transcriptome=/afs/crc.nd.edu/user/e/eaboelno/cellranger/refdata-gex-mm10-2020-A --chemistry=threeprime

cp /afs/crc.nd.edu/user/e/eaboelno/SRA/SRR15622247/outs /scratch365/eaboelno/Pandey2022_Oligo/SRR15622247
cp /afs/crc.nd.edu/user/e/eaboelno/SRA/SRR15622248/outs /scratch365/eaboelno/Pandey2022_Oligo/SRR15622248
cp /afs/crc.nd.edu/user/e/eaboelno/SRA/SRR15622249/outs /scratch365/eaboelno/Pandey2022_Oligo/SRR15622249
cp /afs/crc.nd.edu/user/e/eaboelno/SRA/SRR15622250/outs /scratch365/eaboelno/Pandey2022_Oligo/SRR15622250
