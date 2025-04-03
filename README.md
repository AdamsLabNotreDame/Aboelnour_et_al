# Aboelnour_et_al
Analysis scripts of single cell and single nuclei transcriptomic data of the subcortical white matter from mice treated with either lysophosphatidylcholine (LPC) and cuprizone toxicity models, and compared to human MS dataset.

# Manuscript link
https://www.biorxiv.org/content/10.1101/2025.03.24.645058v1 

# GEO data (mouse datasets):
Pandey et al. 2022: GSE182846
Shen et al. 2021: GSE148676
this publication: being deposited ASAP

# Zenodo data (human dataset):
DOI: 10.5281/zenodo.8338963

# Code
This code is intended to serve as a repository showing how data was processed and analyzed in the manuscript (Aboelnour et al. 2025) currently on biorxiv. The code was run using numerous packages that must be installed to repeat the analyses, including both R and python packages. We prefer using 
a conda/mamba environment, and to facilitate the setup we have provided yml files containing all conda and pip installable dependencies. We include the cellbedner.yml (run on command line), sysVI.yml (integrations performed with sysVI or scVI tools were performed in this environment), and the edgeR.yml with corresponding r_packages.txt (all differential expression analysis, and most of the figure generation).
