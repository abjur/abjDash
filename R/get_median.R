#' Pegar a mediana baseada no processo
#' @name get_median
#' @description funcao que ajuda pegar a mediana de processos por
#' tempo
#' @param da dados
#' @param re_tempo seletor de tempos
#'
#' @export
get_median <- function(da, re_tempo) {
  da %>%
    dplyr::filter(stringr::str_detect(tempo, re_tempo)) %>%
    dplyr::mutate(lab = sprintf("%s (%s)", round(mediana), n_complete)) %>%
    with(lab)
}
