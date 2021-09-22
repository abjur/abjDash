#' Ferramenta para facilitar o calculo de tempos por ano
#' @name tempo_lab_one
#' @description funcao ajuda calcular tempos
#' @param x coluna
#'
#' @export
tempo_lab_one <- function(x) {
  ano <- floor(x)
  mes <- round((x %% 1) * 12)
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
