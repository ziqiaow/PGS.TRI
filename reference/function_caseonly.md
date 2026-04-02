# Case only analysis for PGSxE interactions

Polygenic PGSxE interactions using the case-only method in unrelated
individuals with the disease/condition

## Usage

``` r
function_caseonly(prs_c, envir, mean_prs)
```

## Arguments

- envir:

  The environmental variables of interest for interaction effect. A
  vector of length N for one environmental variable or a data frame/data
  matrix of NxP for P environmental variables are allowed.

- mean_prs:

  The mean PGS value from an external dataset (or could use the same
  dataset, i.e., mean(pgs_c) as input). This step only influence the PGS
  main effect result.

- pgs_c:

  The PGS values of the affected individuals. A vector of length N, no
  missing values are allowed

## Value

Results of case-only analysis for PGSxE

- Coefficients:

  Results of PGSxE interaction effects
