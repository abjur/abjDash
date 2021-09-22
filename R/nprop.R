#' Ferramenta para calculo porcentagem
#' @name nprop
#' @description funcao que retorna no formato NN (PP)
#' @param x coluna
#' @param val categorias de teste
#'
#' @export
nprop <- function(x, val) {
  s <- sum(x %in% val)
  prop <- mean(x %in% val)
  stringr::str_glue("{s} ({pct(prop)})")
}
