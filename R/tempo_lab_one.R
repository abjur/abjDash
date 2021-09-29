#' Ferramenta para facilitar o calculo de tempos por ano
#' @name tempo_lab_one
#' @description funcao que ajuda calcular tempos
#' @param numeric_expression coluna
#'
#' @export
tempo_lab_one <- function(numeric_expression) {
  ano <- floor(numeric_expression)
  mes <- round((numeric_expression %% 1) * 12)
  ano_s <- dplyr::if_else(ano > 1, "s", "")
  if (mes == 12) {
    ano <- ano + 1
    ano_s <- dplyr::if_else(ano > 1, "s", "")
    stringr::str_glue("{ano} ano{ano_s}")
  } else if (mes == 0) {
    stringr::str_glue("{ano} ano{ano_s}")
  } else {
    mes_es <- dplyr::if_else(mes > 1, "eses", "\u00eas")
    if (ano > 0) {
      stringr::str_glue("{ano} ano{ano_s} e {mes} m{mes_es}")
    } else {
      stringr::str_glue("{mes} m{mes_es}")
    }

  }
}
