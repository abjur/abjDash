#' Graficos de barras do tipo highcharter por grupo
#' @name barras_empilhadas
#' @description funcao que cria grafico dinamico
#' @param da base
#' @param grupo grupo de informacaoes
#' @param tipo column
#'
#' @export
barras_empilhadas <- function(da, grupo, tipo = "column") {

  v <- names(da)[1]

  if (!tibble::has_name(da, "prop")) {
    da <- da %>%
      dplyr::group_by(!!rlang::sym(v)) %>%
      dplyr::mutate(prop = n/sum(n)) %>%
      dplyr::ungroup()
  }

  da %>%
    dplyr::mutate(lab = scales::percent(prop)) %>%
    highcharter::hchart(
      tipo,
      highcharter::hcaes(!!rlang::sym(v), n, group = !!rlang::sym(grupo)),
      stacking = "normal"
    ) %>%
    highcharter::hc_colors(c("#414487FF", "#2F6C8EFF", "#21908CFF", "#2FB47CFF", "#7AD151FF")) %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = "<b>Quantidade</b>: {point.n}<br><b>Propor\u00e7\u00e3o</b>: {point.lab}"
    )
}
