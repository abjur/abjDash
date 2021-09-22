#' Tempo em label
#' @name tempo_lab
#' @description funcao que retorna um vetor de tempos
#' @param x vetor de tempos em anos
#'
#' @export
tempo_lab <- function(x) {
  purrr::map_chr(x, tempo_lab_one)
}
