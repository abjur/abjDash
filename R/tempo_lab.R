#' Tempo em label
#' @name tempo_lab
#' @description funcao que retorna um vetor de tempos
#' @param vetor vetor de tempos em anos
#'
#' @export
tempo_lab <- function(vetor) {
  purrr::map_chr(vetor, tempo_lab_one)
}
