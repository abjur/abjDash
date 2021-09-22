#' Formata porcentagem
#' @name pct
#' @description  funcoo que define porcentual
#' @param x valor
#'
#' @export
pct <- function(x) {
  scales::percent(x, 0.1, decimal.mark = ",")
}
