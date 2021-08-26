#' Helper para tratar milhares e milhões
#'
#' @param x coluna
#' @param ... outros argumentos (não utilizado)
#' @param dinheiro transformar em dinheiro? Por padrão sim
#'
#' @export
custom_lab <- function(x, ..., dinheiro = TRUE) {
  x <- x %>%
    (scales::label_number_si())() %>%
    stringr::str_replace_all("M", "MM") %>%
    stringr::str_replace_all("K", "M")
  if (dinheiro) paste("R$ ", x) else x
}
