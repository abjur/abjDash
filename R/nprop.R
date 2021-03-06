#' Ferramenta para cálculo porcentagem
#' @name nprop
#' @description Função que retorna no formato NN (PP)
#' @param coluna coluna
#' @param val categorias de teste
#'
#' @export
nprop <- function(coluna, val) {
  soma <- sum(coluna %in% val)
  prop <- mean(coluna %in% val)
  stringr::str_glue("{soma} ({pct(prop)})")
}
