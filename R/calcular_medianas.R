#' Calcula as medianas com base nos dados, datas e quebra
#' @name calcular_medianas
#' @description Função que ajuda calcular medianas por quebra de tempo
#' @param da base de dados filtrada
#' @param data1 coluna de data da esquerda
#' @param data2 coluna de data da direita
#' @param quebra quebra de tempo
#'
#' @export
calcular_medianas <- function(da, data1, data2, quebra) {

  incos <- da %>%
    tibble::rowid_to_column() %>%
    dplyr::filter({{data1}} > {{data2}}) %>%
    dplyr::pull(rowid)

  if (length(incos) > 0) {
    warning(paste0(length(incos), " inconsistencias encontradas:\nc(",
                   paste0(incos, collapse = ", "), ")"))
  }

  da_tempos <- da %>%
    dplyr::mutate(um = 1) %>%
    dplyr::filter(!is.na({{data1}})) %>%
    dplyr::transmute(
      morreu = !is.na({{data2}}),
      data_final = dplyr::coalesce({{data2}}, data_referencia),
      tempo = as.numeric(data_final - {{data1}}),
      quebra = {{quebra}}
    )

  if (rlang::ensym(quebra) == "um") {
    modelo <- survival::survfit(survival::Surv(tempo, morreu) ~ 1, data = da_tempos)
    mediana <- broom::glance(modelo)$median
    res <- tibble::tibble(geral = "um", mediana = mediana)

  } else {
    modelo <- survival::survfit(survival::Surv(tempo, morreu) ~ quebra, data = da_tempos)
    res <- broom::tidy(modelo) %>%
      dplyr::group_by(strata) %>%
      dplyr::summarise(
        mediana = time[which.min(abs(estimate - .5))[1]],
        .groups = "drop"
      ) %>%
      dplyr::mutate(strata = stringr::str_remove(strata, "quebra=")) %>%
      dplyr::rename({{quebra}} := strata)
  }

  res

}

