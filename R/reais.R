#' Função de define reais
#' @name reais
#' @description Função que cria ferramenta para definir reais
#' @param numero vetor numérico para formatar
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
