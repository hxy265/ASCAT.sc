# ASCAT.sc
Copy number from DNA profiling techniques, including single-cell (sc),
shallow-coverage (sc), and targeted sequencing, as well as methylation arrays


## Install

First download the zip file on disk and then build and install with the following commands

> R CMD BUILD --no-build-vignettes ASCAT.sc/ 

> R CMD INSTALL ASCAT.sc_1.0.tar.gz 
<br>

> R CMD build --no-build-vignettes ASCAT.sc/ 

> R CMD install ASCAT.sc_0.1.tar.gz 
<br>

Alternatively, you can install with devtools in an R session:

> devtools::install_github("VanLoo-lab/ASCAT.sc", build_opts = c("--no-build-vignettes"))

Make sure to install dependencies before installing (this might take a while):

> BiocManager::install(c("GenomicRanges", "Biostrings", "DNAcopy", "minfi", "conumee", "Rsamtools", "xgboost"))

## Usage

See vignettes for how-to pipelines.


## Cell-line profiles

ASCAT.sc total copy-number profiles on cell lines from various sources (GDSC and CCLE) can be found here:
https://drive.google.com/drive/folders/1RwhF9cw6KP55fHtlNKTzk36syXN9fspo?usp=sharing
These are accompanied by the R script to derive the profiles, as well as sample ID mapping and QC flags.

**Credits to:** Philip S Smith, CRUK Cambridge Institute

