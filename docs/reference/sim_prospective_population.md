# Simulation

Simulate case-parent trio data and environmental variables in the
population

## Usage

``` r
sim_prospective_population(
  n_fam = 1e+05,
  cor_e_prs = TRUE,
  cor_strat = 0.25,
  rho2 = 0.25,
  alpha_fam = -5.5,
  betaG_normPRS = 0.4,
  betaE_bin = 0.2,
  betaE_norm = -0.6,
  betaGE_normPRS_bin = 0.2,
  betaGE_normPRS_norm = -0.4,
  envir = TRUE
)
```

## Arguments

- n_fam:

  The total number of trios in the population, recommend values larger
  than 100000

- cor_e_prs:

  Whether there are correlations between PGS and E

- cor_strat:

  Level of stratification biases for PGS main effect

- rho2:

  Level of stratification biases for PGSxE interactions

- alpha_fam:

  Intercept term to control for population disease prevalence

- betaG_normPRS:

  True log RR for direct PGS main effect

- betaE_bin:

  True log RR for E1, a binary variable

- betaE_norm:

  True log RR for E2, a continuous variable

- betaGE_normPRS_bin:

  True log RR for PGSxE1

- betaGE_normPRS_norm:

  True log RR for PGSxE2

- envir:

  Whether there are environmental variables and PGSxE interactions in
  the true underlying disease model

## Value

A list of data from simulation

- D_sim:

  Disease indicator of the offspring

- E_sim:

  A data frame of simulated environmental variables

- pgs_fam:

  PGS values of trios
