
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

## Installation

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

## Tutorial

The full tutorial of PGS.TRI package and data examples are in this website [https://ziqiaow.github.io/PGS.TRI/](https://ziqiaow.github.io/PGS.TRI/).

The source code for the manuscript is available in [https://github.com/ziqiaow/PGS-TRI-Analysis](https://github.com/ziqiaow/PGS-TRI-Analysis).

## Recent Version History
Apr 2, 2026: Update example codes.
Nov 24, 2023: Repository made public.

# Questions

This software will be constantly updated, so please send your
questions/suggestions to <ziqiao.wang@virginia.edu> to help improve the package.

**Reference**

-   Ziqiao Wang, Luke Grosvenor, Debashree Ray, Ingo Ruczinski, Terri
    Beaty, Heather Volk, Christine Ladd-Acosta, Nilanjan Chatterjee
    (2024). Estimation of Direct and Indirect Polygenic Effects and
    Gene-Environment Interactions using Polygenic Scores in Case-Parent
    Trio Studies. medRxiv. <https://www.medrxiv.org/content/10.1101/2024.10.08.24315066v2>


