# Load example dataset

Load example dataset

## Usage

``` r
load_sim_dat()
```

## Value

A 1000 × 3 data frame containing simulated polygenic scores (PGS). Each
row represents a family and columns represent PGS values for the child,
mother, and father, respectively. The PGS is calculated using 1000
independent SNPs and weights generated created by SNIPAR. Specifically,
the example dataset is randomly selected case-parent trios of the 20th
generation of 100000 families across 1000 independent SNPs,
incorporating assortative mating with the parental phenotype correlation
at 0.5.

## Examples

``` r
PRS_fam_select <- load_sim_dat()
head(PRS_fam_select)
#>       pgs_c       pgs_m    pgs_f
#> 1  0.315095  0.51697000 0.565983
#> 2  2.432170  1.57718000 1.461760
#> 3 -0.121539 -0.00146488 0.318542
#> 4  1.930570  1.07737000 2.186780
#> 5  1.690790  0.68059100 0.912145
#> 6 -0.513648 -0.12753900 0.108064
```
