#' Calcula estatísticas de tempo
#' @name calcular_estatisticas
#' @description funcao que ajuda calcular medias e medianas por
#' intervalo
#' @param intervalo nome do intervalo
#' @param da base de dados
#'
#' @export
calcular_estatisticas <- function(intervalo, da) {
  da %>%
    dplyr::select(dplyr::all_of(intervalo)) %>%
    dplyr::mutate(tempo = as.numeric(.data[[intervalo[2]]] - .data[[intervalo[1]]])) %>%
    dplyr::summarise(
      n_na1 = sum(is.na(.data[[intervalo[1]]])),
      n_na2 = sum(is.na(.data[[intervalo[2]]])),
      n_complete = sum(!is.na(tempo) & tempo > 0),
      n_neg = sum(tempo < 0, na.rm = TRUE),
      n_zero = sum(tempo == 0, na.rm = TRUE),
      media = mean(tempo[tempo > 0], na.rm = TRUE),
      mediana = stats::median(tempo[tempo > 0], na.rm = TRUE),
      .groups = "drop"
    )
}
