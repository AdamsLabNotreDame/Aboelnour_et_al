# Aboelnour_et_al:
Analysis scripts of single cell and single nuclei transcriptomic data of the subcortical white matter from mice treated with either lysophosphatidylcholine (LPC) and cuprizone toxicity models, and compared to human MS dataset.

# Manuscript link:
https://www.biorxiv.org/content/10.1101/2025.03.24.645058v1 

# GEO data (mouse datasets):
Pandey et al. 2022: GSE182846
Shen et al. 2021: GSE148676
this publication: being deposited ASAP

# Zenodo data (human dataset):
DOI: 10.5281/zenodo.8338963

# Code:
This code is intended to serve as a repository showing how data was processed and analyzed in the manuscript (Aboelnour et al. 2025) currently on biorxiv. The code was run using numerous packages that must be installed to repeat the analyses, including both R and python packages. We prefer using 
a conda/mamba environment, and to facilitate the setup we have provided yml files containing all conda and pip installable dependencies. We include the cellbedner.yml (run on command line), sysVI.yml (integrations performed with sysVI or scVI tools were performed in this environment), and the edgeR.yml with corresponding r_packages.txt (all differential expression analysis, and most of the figure generation).

# Important citations and resources:

https://www.sc-best-practices.org/preamble.html

1.	Fleming, S. J. et al. Unsupervised removal of systematic background noise from droplet-based single-cell experiments using CellBender. Nat. Methods 20, 1323–1335 (2023).
2.	Hrovatin, K. et al. Integrating single-cell RNA-seq datasets with substantial batch effects. bioRxiv (2023).
3.	Gayoso, A. et al. A Python library for probabilistic analysis of single-cell omics data. Nat. Biotechnol. 40, 163–166 (2022).
4.	Dann, E., Henderson, N. C., Teichmann, S. A., Morgan, M. D. & Marioni, J. C. Differential abundance testing on single-cell data using k-nearest neighbor graphs. Nat. Biotechnol. 40, 245–253 (2022).
5.	Hoffman, G. E. & Roussos, P. Dream: powerful differential expression analysis for repeated measures designs. Bioinformatics 37, 192–201 (2020).
