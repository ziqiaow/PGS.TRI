# pTDT

Polygenic transmission disequilibrium test in case-parent trios for
direct PGS effect

## Usage

``` r
ptdt(pgs_c, pgs_m, pgs_f, side0 = 2)
```

## Arguments

- pgs_c:

  The PGS values of the affected probands (children). A vector of length
  N, no missing values are allowed

- pgs_m:

  The PGS values of mothers that corresponds to the children. A vector
  of same length N, no missing values are allowed

- pgs_f:

  The PGS values of fathers that corresponds to the children. A vector
  of same length N, no missing values are allowed

- side0=2:

  Sided of the t test, default is 2-sided.

## Value

Results of pTDT

- statistic:

  Results of polygenic transmission disequilibrium test
