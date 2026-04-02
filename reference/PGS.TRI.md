# PGS.TRI

A unified framework for the estimation of polygenic direct effect,
indirect effect, and GxE interactions in case-parent trio studies

## Usage

``` r
PGS.TRI(
  pgs_offspring,
  pgs_mother,
  pgs_father,
  GxE_int = FALSE,
  parental_indirect = FALSE,
  parental_diff_ref = 0,
  formula = ~envir1 + envir2 + factor(s1),
  E,
  side = 2,
  smalltriosize = FALSE
)
```

## Arguments

- pgs_offspring:

  The PGS values of the affected probands (children). A vector of length
  N, no missing values are allowed

- pgs_mother:

  The PGS values of mothers that corresponds to the children. A vector
  of same length N, no missing values are allowed

- pgs_father:

  The PGS values of fathers that corresponds to the children. A vector
  of same length N, no missing values are allowed

- GxE_int:

  Whether there are interaction effect between pgs and environmental
  variables that are of interest in the model. If FALSE, then "formula"
  and "E" are ignored.

- parental_indirect:

  Whether to estimate potential parental indirent effect, returns an
  estimated difference of mother and father parental effect (delta_MF =
  beta_M - beta_F).

- parental_diff_ref:

  (Optional) Supplement a reference dataset female - male PGS difference
  to correct for background allele frequency differences in the
  population for the estimation of parental indirect effect difference.
  We employ a large population size (such as the UK Biobank) to minimize
  the additional variance induced by this term.

- formula:

  The environmental variables of interest for the PGSxE interaction
  effect

- E:

  The environmental variables of interest for interaction effect. A
  vector of length N for one environmental variable or a data frame/data
  matrix of NxP for P environmental variables are allowed.

- side:

  Sided of the Wald test or t test, default is 2-sided.

- smalltriosize:

  Whether number of trios is small (\<100), if TRUE, a t test will be
  used rather than a wald test.

## Value

A list of results of PGS.TRI

- Coefficients_direct:

  Results of direct PGS effect, if GxE_int is TRUE, then the result will
  also include PGSxE interaction effects

- Coefficients_indirect:

  Results of indirect parental PGS effect difference: PGS_mother -
  PGS_father

- Coefficients_indirect_centered:

  Results of indirect parental PGS effect difference: PGS_mother -
  PGS_father, after centering using a refenrece dataset of background
  allele frequency differences between males and females. When
  parental_diff_ref = 0, the result is the same as Coefficients_indirect

- var_fam:

  Within-family variances for each family

- var_fam_sum:

  Sum of within-family variances

- log_LC:

  Log likelihood of the offspring's transmission component

- log_LP_profile:

  The log profile likelihood of parents' component, note that we can
  report this likelihood when only considering direct effects in the
  model

- log_likelihood:

  Results of the final log-likelihood. This is calculated as the sum of
  the offspring's and parents' components

- vcov:

  Variance-covariance matrix of coefficients for direct genetic effects
  and gene–environment interaction terms (PGS×E)
