#' Formata porcentagem
#' @name pct
#' @description Função que define porcentual
#' @param valor valor
#'
#' @export
pct <- function(valor) {
  scales::percent(valor, 0.1, decimal.mark = ",")
}
