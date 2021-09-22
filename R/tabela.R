#' Formata tabelas com caracteristicas parecidas
#' @name tabela
#' @description  funcoo que ajuda definir tabelas
#' @param da base
#' @param ... outros argumentos
#' @param .lump default 0
#' @param .nm numeros
#'
#' @export
tabela <- function(da, ..., .lump = 0, .nm = NULL) {
  if (.lump > 0) {
    da <- da %>%
      dplyr::mutate(dplyr::across(
        .cols = c(...),
        .fns = forcats::fct_lump_n,
        n = .lump,
        other_level = "Outros"
      ))
  }

}
