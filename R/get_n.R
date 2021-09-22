#' Pegar a qtd de casos baseada no processo
#' @name get_n
#' @description funcao que ajuda pegar a quantidade de processos por
#' tempo
#' @param da dados
#' @param re_tempo seletor de tempos
#'
#' @export
get_n <- function(da, re_tempo) {
  da %>%
    dplyr::filter(stringr::str_detect(tempo, re_tempo)) %>%
    with(n_complete) %>%
    magrittr::divide_by(nrow(da) * 10)
}

