# Load example dataset

Load example dataset

## Usage

``` r
load_sim_dat()
```

## Value

A data frame containing the simulated dataset generated using SNIPAR.
Each row corresponds to a family, columns correspond to child, mother,
and father PGS values

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
