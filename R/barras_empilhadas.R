#' Gráfico de colunas do tipo highcharter por grupo
#' @name barras_empilhadas
#' @description Funcão que cria gráfico dinâmico de colunas por grupo
#' @param base base que gera o gráfico
#' @param grupo grupo de informações
#' @param tipo column
#'
#' @export
barras_empilhadas <- function(base, grupo, tipo = "column") {

  v <- names(base)[1]

  if (!tibble::has_name(base, "prop")) {
    base <- base %>%
      dplyr::group_by(!!rlang::sym(v)) %>%
      dplyr::mutate(prop = n/sum(n)) %>%
      dplyr::ungroup()
  }

  base %>%
    dplyr::mutate(lab = scales::percent(prop)) %>%
    highcharter::hchart(
      tipo,
      highcharter::hcaes(!!rlang::sym(v), n, group = !!rlang::sym(grupo)),
      stacking = "normal"
    ) %>%
    highcharter::hc_colors(colors = c("#414487FF", "#2F6C8EFF", "#21908CFF", "#2FB47CFF", "#7AD151FF")) %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = "<b>Quantidade</b>: {point.n}<br><b>Propor\u00e7\u00e3o</b>: {point.lab}"
    )
}
