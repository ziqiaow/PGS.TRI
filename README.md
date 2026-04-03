
<!-- README.md is generated from README.Rmd. Please edit that file -->

<img src="https://github.com/user-attachments/assets/5630687f-dc02-45a3-a616-9b45e19ca443"  width=95% height=95%>


<!-- badges: start -->
<!-- badges: end -->

PGS-TRI is for the analysis of polygenic scores (PGS) or polygenic risk
scores (PRS) in case-parent trio studies for estimation of the risk of
an index condition associated with direct effects of inherited PGS,
indirect effects of parental PGS, and gene-environment interactions
under a unified log-linear modeling framework. This tool can
characterize genetic risks of diseases in the presence of population
structure, assortative mating, and indirect genetic effects.

## Recent Version History
* Apr 3, 2026: Add command line feature to run PGS-TRI.
* Apr 2, 2026: Update example codes.
* March 30, 2026: Update PGS-TRI function, added PGS-TRI-centered feature for centering $\delta$-IDE using reference data.
* June 17, 2025: Update citation medRxiv version 2.
* Sept 18, 2024: Repository made public.

The source code for the manuscript is available in [https://github.com/ziqiaow/PGS-TRI-Analysis](https://github.com/ziqiaow/PGS-TRI-Analysis).

## Run PGS-TRI in R
The full tutorial of PGS.TRI package and data examples are in this website [https://ziqiaow.github.io/PGS.TRI/](https://ziqiaow.github.io/PGS.TRI/). An interactive R tutorial with examples is provided at: [Get started](https://ziqiaow.github.io/PGS.TRI/articles/PGS-TRI.html).

### Installation in R

The package can be easily installed from Github

    library(devtools)
    install_github("ziqiaow/PGS.TRI")

If you only want to use specific functions, you can also do this

    rm(list = ls())
    require(devtools)
    source_url("https://github.com/ziqiaow/PGS.TRI/blob/main/R/PGS-TRI.R?raw=TRUE")
    source_url("https://github.com/ziqiaow/PGS.TRI/blob/main/R/simulation.R?raw=TRUE")

    #If directly downloaded the R files from Github to your local directory 
    source("./R/PGS-TRI.R")
    source("./R/simulation.R")



## Run PGS-TRI from Command Line
PGS-TRI can also be run directly from the command line without starting an R session. Example codes for running PGS-TRI using command line:
```bash
# Download or clone this GitHub repository by 
git clone https://github.com/ziqiaow/PGS.TRI.git

# Go to the directory
cd PGS.TRI

```


---

## Usage Examples using Command Line

### Test with example data
Input the column names for child, mother, father under command
```bash
package='/dcs04/nilanjan/data/zwang/tools/PGS.TRI'
path_example='/dcs04/nilanjan/data/zwang/tools/PGS.TRI/inst/extdata/'

Rscript ${package}/inst/pgs_tri \
  --input ${path_example}/testdat_snipar.txt \
  --output ${path_example}/test_results.txt \
  --offspring-col pgs_c \
  --mother-col pgs_m \
  --father-col pgs_f \
  --save-rds \
  --verbose
```

### Basic analysis

```bash
Rscript inst/pgs_tri --input data.txt --output results.txt
```

### Full model

```bash
Rscript inst/pgs_tri \
  --input data.txt \
  --output results.txt \
  --offspring-col pgs_c \
  --mother-col pgs_m \
  --father-col pgs_f
  --gxe \
  --parental-indirect \
  --parental-diff-ref 0 \
  --envir age,sex,bmi \
  --formula '~ age + factor(sex) + bmi' \
  --small-trio \
  --save-rds \
  --verbose
```


---

## Command Line Options

```
Required:
  --input FILE              Input file, see format below. Each row presents a family, each column represents the PGS values of child, mother, father, respectively; if GxE interactions analysis is required, then environmental variables can also be included in the same .txt file
  --output FILE             Output file path

Analysis Options:
  --gxe                     Estimate gene-environment interactions
  --parental-indirect       Estimate parental indirect effects
  --parental-diff-ref NUM   Reference data female-male PGS difference [default: 0]
  --envir VARS              Environmental variables (comma-separated)
  --formula FORMULA         R formula for environmental variables
  --side INT                Test side: 1 or 2 [default: 2]
  --small-trio              Use t-test for small samples (<100)

Input Format:
  --sep CHAR                Field separator [default: tab]
  --header                  Input has header [default: TRUE]
  --offspring-col NAME      Offspring PGS column [default: pgs_c]
  --mother-col NAME         Mother PGS column [default: pgs_m]
  --father-col NAME         Father PGS column [default: pgs_f]

Output Options:
  --save-rds                Save results as RDS files
  --verbose                 Print detailed output
  --version                 Print version
  --help                    Show this help message
```

---

## Input File Format

Tab-delimited file with family PGS data:

```
pgs_c	pgs_m	pgs_f	age	sex
0.523	0.412	0.389	45	1
0.678	0.534	0.621	52	0
0.234	0.289	0.198	38	1
```

For GxE analysis, include environmental variables as additional columns.

---

# Questions

This software will be constantly updated, so please send your
questions/suggestions to <ziqiao.wang@virginia.edu> to help improve the package.

**Reference**

-   Ziqiao Wang, Luke Grosvenor, Debashree Ray, Ingo Ruczinski, Terri
    Beaty, Heather Volk, Christine Ladd-Acosta, Nilanjan Chatterjee
    (2024). Estimation of Direct and Indirect Polygenic Effects and
    Gene-Environment Interactions using Polygenic Scores in Case-Parent
    Trio Studies. medRxiv. <https://www.medrxiv.org/content/10.1101/2024.10.08.24315066v2>


