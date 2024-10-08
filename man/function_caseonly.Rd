% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/case-only.R
\name{function_caseonly}
\alias{function_caseonly}
\title{Case only analysis for PGSxE interactions}
\usage{
function_caseonly(prs_c, envir, mean_prs)
}
\arguments{
\item{envir}{The environmental variables of interest for interaction effect. A vector of length N for one environmental variable or a data frame/data matrix of NxP for P environmental variables are allowed.}

\item{mean_prs}{The mean PGS value from an external dataset (or could use the same dataset, i.e., mean(pgs_c) as input). This step only influence the PGS main effect result.}

\item{pgs_c}{The PGS values of the affected individuals. A vector of length N, no missing values are allowed}
}
\value{
Results of case-only analysis for PGSxE
\item{res}{Results of PGSxE interaction effects}
}
\description{
Polygenic PGSxE interactions using the case-only method in unrelated individuals with the disease/condition
}
