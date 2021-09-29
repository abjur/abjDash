#' teste para testthat tira media
#' @name tira_media
#' @description  funcoo que tira a media de um vetor
#' @param x vetor
#' @param rm_na (default true)
#'
#' @exportt
tira_media <- function(x, rm_na = TRUE) {
  purrr::reduce(x, sum, na.rm = rm_na)/conta_itens(x, rm_na)
}

#' teste para testthat contar media
#' @name conta_itens
#' @description  funcoo que tira a media de um vetor
#' @param x vetor
#' @param compact (default true)
#'
#' @exportt
conta_itens <- function(x, compact) {
  if (compact) { x <- purrr::discard(x, is.na) }
  length(x)
}
