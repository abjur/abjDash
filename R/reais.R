#' Funcao de define reais
#' @name reais
#' @description funcao que cria ferramenta para definir reais
#' @param numero vetor numerico para formatar
#'
#' @export
reais <- function(numero) {
  scales::dollar(
    numero,
    prefix = "R$ ",
    big.mark = ".",
    decimal.mark = ","
  )
}
