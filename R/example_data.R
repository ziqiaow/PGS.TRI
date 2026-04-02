#' Load example dataset
#'
#' @return A 1000 × 3 data frame containing simulated polygenic scores (PGS). Each row represents a family and columns represent PGS values for the child, mother, and father, respectively. The PGS is calculated using 1000 independent SNPs and weights generated created by SNIPAR. Specifically, the example dataset is randomly selected case-parent trios of the 20th generation of 100000 families across 1000 independent SNPs, incorporating assortative mating with the parental phenotype correlation at 0.5.
#' @export
#' @examples
#' PRS_fam_select <- load_sim_dat()
#' head(PRS_fam_select)
load_sim_dat <- function() {
  file_path <- system.file("extdata", "testdat_snipar.txt",
                           package = "PGS.TRI")
  if (file_path == "") {
    stop("Example data file not found")
  }
  read.table(file_path, header = TRUE, stringsAsFactors = FALSE)
}
