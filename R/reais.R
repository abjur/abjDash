#' Funcao de define reais
#' @name reais
#' @description funcao que cria ferramenta para definir reais
#' @param x numero
#'
#' @export
reais <- function(x) {
  scales::dollar(
    x,
    prefix = "R$ ",
    big.mark = ".",
    decimal.mark = ","
  )
}
