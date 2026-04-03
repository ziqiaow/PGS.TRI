# Getting started with PGS.TRI

A Likelihood-Based Method for Risk Parameter Estimation under Polygenic
Models for Case-Parent Trios

### Required Data for the Analysis

The required data as input for this software are simple: PGS values for
mothers, fathers, and children are needed. If PGSxE interactions are to
be investigated, then a set of environmental variables for children are
required. Note that only the environmental variables for interactions
need to be prepared. By nature, our model is comparing within families
so any environmental variables or confounders will be corrected (so no
need to prepare data such as genetic principal components to include in
the model input, unless your task is to look into PGS x children’s
PCs!). In math, the main effect of environmental variables in the
likelihood are cancelled out in the numerator and denominator so it
“automatically” corrects for any environmental variable in the disease
model.

You can construct PGS for trios using pre-trained weights available on
previously reported sources using external data, such as
[PGScatalog](https://www.pgscatalog.org/), following steps described for
unrelated individuals using softwares such as PLINK/2.0. Examples such
as Autism Spectrum Disorders
[PGS000327](https://www.pgscatalog.org/score/PGS000327/), Orofacial
Clefts [PGS002266](https://www.pgscatalog.org/score/PGS002266/),
Educational Attainment
[PGS002012](https://www.pgscatalog.org/score/PGS002012/) can all be
obtained freely online.

### Example Analysis

#### Direct effect and gene-environment interaction estimation

We provide a simple example for running our proposed method using
simulated data. The R function of the proposed method is in
[PGS-TRI](https://ziqiaow.github.io/PGS.TRI/reference/PGS.TRI.html). The
R function to simulate data is available here
[simulation](https://ziqiaow.github.io/PGS.TRI/reference/sim_prospective_population.html).
We also provide the R function to run the polygenic TDT (pTDT) test
[pTDT](https://ziqiaow.github.io/PGS.TRI/reference/ptdt.html)
(originally proposed by Weiner et al, Nat Genet. 2017). For PGSxE
analysis, the case-only method is also implemented here
[case-only](https://ziqiaow.github.io/PGS.TRI/reference/function_caseonly.html)
(Allison et al, AJE 2019; Wang et al, AJE 2024).

First simulate 200000 families based on a population disease risk model
following a logistic regression with PGS main effect, two independent
environmental variables $E_{1}$ (binary) and $E_{2}$ (continuous), and
their interaction effect with PGS. Assume the marginal disease
prevalence is Pr(D=1)=0.01.

``` r
#example analysis
library(PGS.TRI)
set.seed(04262023)

#Generate 200000 families with offsprings disease prevalence to be 1%
dat = sim_prospective_population(n_fam=200000, #Number of families in the population
                               cor_e_prs=FALSE, #Assuming no correlation between PGS and E
                               cor_strat=0.25, #Random effect term to create population stratification bias in PGS
                               rho2=0.25, #Random effect term to create population stratification bias in PGSxE
                               alpha_fam=-5.5, #Intercept
                               betaG_normPRS=0.4, #Main effect of PGS
                               betaE_bin=0.2, #Main effect of E1
                               betaE_norm=0.2, #Main effect of E2
                               betaGE_normPRS_bin=0, #Interaction effect of PGSxE1
                               betaGE_normPRS_norm=0, #Interaction effect of PGSxE2
                               envir=TRUE) #Include environmental variables in the disease risk model
```

    ## Disease prevalence:  0.010645

View the simulated data.

``` r
head(dat$E_sim)
```

    ##      E_sim_bin E_sim_norm
    ## [1,]         1 -0.8068890
    ## [2,]         1 -0.3576089
    ## [3,]         1  0.3903469
    ## [4,]         1 -0.5997115
    ## [5,]         0 -0.2200456
    ## [6,]         0 -0.6782173

``` r
head(dat$pgs_fam)
```

    ##           pgs_c      pgs_m      pgs_f
    ## [1,] -4.8184288 -3.5779866 -5.0108904
    ## [2,]  0.2061615  0.4063380  0.6066281
    ## [3,]  1.5035239  1.3617260  0.8225709
    ## [4,] -0.1411008  0.1401712 -0.4475913
    ## [5,] -0.6775838 -1.0829348 -0.2166373
    ## [6,] -0.6639565 -0.3845802 -0.7305453

``` r
table(dat$D_sim)
```

    ## 
    ##      0      1 
    ## 197871   2129

Randomly select 1000 affected probands and their families

``` r
id = sample(which(dat$D_sim==1),size=1000,replace=F)
PRS_fam = dat$pgs_fam[id,]
envir = dat$E_sim[id,]
```

Fit our proposed method to the randomly selected 1000 trios

``` r
startTime <- Sys.time()
res_sim = PGS.TRI(pgs_offspring = PRS_fam[,1], 
                 pgs_mother = PRS_fam[,2], 
                 pgs_father = PRS_fam[,3],
                 GxE_int = TRUE, #If GxE_int is FALSE, then fit a model without interaction effect between PGSxE. "formula" and "E" will be ignored in the function.
                 formula = ~ factor(E_sim_bin)+E_sim_norm, #For categorical variables, remember to add factor().
                 E = envir,
                 parental_indirect = FALSE, #If indirect polygenic effect from parents are considered, set this to TRUE.
                 side = 2)
```

    ## The complete number of trios with non-missing environmental variables is 1000

``` r
endTime <- Sys.time()
```

Print the final results of the estimated direct PGS effect and PGSxE
interactions. “Estimate” refers to log relative risk (log RR).

``` r
res_sim$Coefficients_direct
```

    ##                             Estimate  Std.Error    Z.value       Pvalue
    ## PGS                       0.38144038 0.11200084  3.4056920 0.0006599659
    ## PGS x factor(E_sim_bin)1 -0.09540744 0.14213861 -0.6712282 0.5020751927
    ## PGS x E_sim_norm          0.06266046 0.06584785  0.9515947 0.3413025606

The original simulated data for PGS main effect was 0.4 and no
interaction effect with E.

Print the within-family variances and the average for 1000 families.

``` r
head(res_sim$var_fam)
```

    ## [1] 0.1145986 0.5482620 0.0384810 0.7079308 0.9436784 0.4002518

``` r
length(res_sim$var_fam)
```

    ## [1] 1000

``` r
sum(res_sim$var_fam)/length(res_sim$var_fam)
```

    ## [1] 0.4369649

Print running time of PGS.TRI() function of 1000 trios.

``` r
print(endTime - startTime)
```

    ## Time difference of 0.164273 secs

#### Indirect effect estimation and centering estimated indirect effect using a reference dataset

To analyze the asymmetric indirect parental effects, we show a simple
example using our tool to estimate $\delta$-IDE (difference of parental
indirect genetic effect. We first simulated data using existing tool
[snipar](https://snipar.readthedocs.io/en/latest/index.html) and
generated $100\, 000$ families across $1000$ independent SNPs. We
simulated a continuous phenotype influenced by direct genetic effects
and assortative mating. We simulated $20$ generations of assortative
mating and let the parental phenotype correlation to be $0.5$. PGS of
each individual is calculated using the simulated weights and SNPs from
snipar. To simulate children’s disease status, we used the model
including children’s PGS and parental indirect genetic effects, as well
as mid-parental phenotype residuals after regressing out the parental
PGS values as a family-level covariate to create an assortative mating
effect in children’s disease outcome:
$$\operatorname{logit}Pr\left( D_{iC}|PGS_{iC},PGS_{iM},PGS_{iF} \right) = \alpha_{i} + \beta_{G}PGS_{iC} + \beta_{M}PGS_{iM} + \beta_{F}PGS_{iF}.$$
Here, we let
$\alpha_{i} \sim N\left( \alpha + cor_{G} \times 0.5\left( residual_{iM} + residual_{iF} \right),1 \right)$
and set $\alpha$ so that the disease prevalence is fixed at around 0.01,
and let the values of $cor_{G} = 0.4$ to further incorporate assortative
mating effects. For this simulation example, we let
$\beta_{G} = 0.4,\beta_{M} = \beta_{F} = 0$. We randomly sampled $1000$
families with diseased children from the simulated data as an example
dataset here:

``` r
PRS_fam_select <- load_sim_dat()
startTime <- Sys.time()
res_snipar = PGS.TRI(pgs_offspring = PRS_fam_select[,1], pgs_mother = PRS_fam_select[,2], pgs_father = PRS_fam_select[,3], parental_indirect = T)
```

    ## The complete number of trios is 1000

``` r
endTime <- Sys.time()
```

Print the estimated direct and indirect effects:

``` r
res_snipar$Coefficients_direct
```

    ##      Estimate  Std.Error  Z.value       Pvalue
    ## PGS 0.3931264 0.06858119 5.732278 9.909063e-09

``` r
res_snipar$Coefficients_indirect
```

    ##                     Estimate  Std.Error    Z.value    Pvalue
    ## Indirect_Diff_MF -0.04566616 0.06636633 -0.6880923 0.4913947

Print running time of PGS.TRI() function of 1000 trios for direct and
indirect effect estimation

``` r
print(endTime - startTime)
```

    ## Time difference of 0.001046419 secs

If we suspect systematic allele frequency differences between females
and males (i.e., population-level mean PGS values differ by sex in the
parental population, for example, due to asymmetric selection), a
centering technique can be used for sensitivity analysis. We may use an
external dataset to obtain the difference in PGS between women and men
to center our estimate of $\delta$-IDE. In our manuscript of the autism
application, we used data from the UK Biobank unrelated EUR individuals
as a reference dataset to obtain external estimates of female-male
differences in PGS values for various traits for sensitivity analyses of
the EUR trios in the SPARK consortium. The PGS should be calculated
using the same procedure and PC-projected onto the same space as the PGS
values in the family-based study to ensure comparability. This mean sex
difference can then be incorporated into the PGS-TRI function to correct
for potential bias:

``` r
res_snipar_centered = PGS.TRI(pgs_offspring = PRS_fam_select[,1], pgs_mother = PRS_fam_select[,2], pgs_father = PRS_fam_select[,3], parental_indirect = T, parental_diff_ref = 0.001) #The parental_diff_ref is supplemented with a scalar value that is calculated from an independent large dataset of unrelated individuals with same ancestry background as the family-based study
```

    ## The complete number of trios is 1000

To print the direct, indirect, and the centered indirect effects. The
centering analysis does not impact the original analysis of direct and
indirect effect estimation.

``` r
res_snipar_centered$Coefficients_direct
```

    ##      Estimate  Std.Error  Z.value       Pvalue
    ## PGS 0.3931264 0.06858119 5.732278 9.909063e-09

``` r
res_snipar_centered$Coefficients_indirect
```

    ##                     Estimate  Std.Error    Z.value    Pvalue
    ## Indirect_Diff_MF -0.04566616 0.06636633 -0.6880923 0.4913947

``` r
res_snipar_centered$Coefficients_indirect_centered
```

    ##                              Estimate  Std.Error    Z.value    Pvalue
    ## Indirect_Diff_MF_centered -0.04786841 0.06636633 -0.7212754 0.4707401

## Questions

This software will be constantly updated, so please send your
questions/suggestions to <ziqiao.wang@virginia.edu> to help improve the
package.
