# Aboelnour_et_al
Analysis scripts of single cell and single nuclei transcriptomic data of the subcortical white matter from mice treated with either lysophosphatidylcholine (LPC) and cuprizone toxicity models, and compared to human MS dataset.

# Manuscript link
https://www.biorxiv.org/content/10.1101/2025.03.24.645058v1 

# GEO Data (mouse datasets):
Pandey et al. 2022: GSE182846
Shen et al. 2021: GSE148676
this publication: being deposited ASAP

# Zenodo data (human datasets):
DOI: 10.5281/zenodo.8338963

# Code

This code is intended to serve as a repository to observe how the data was processed and analyzed. To run code, several packages 
must be installed, including both R and python packages. We prefer using a conda/mamba environment, and to facilitate the setup 
we have provided the sysVI.yml (integrations with sysVI or scVI tools were performed in this environment) and edgeR.yml, r_packages.txt
(all differential expression analysis, and most of the figure generation), these contain all conda and pip installable dependencies.
