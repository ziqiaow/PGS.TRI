#' Load example dataset
#'
#' @return A data frame containing the simulated dataset generated using SNIPAR. Each row corresponds to a family, columns correspond to child, mother, and father PGS values
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
