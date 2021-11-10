#' Graficos de barras do tipo highcharter
#' @name barras_prop
#' @description funcao que cria grafico dinamico de barras com proporcao
#' @param base base que gera o grafico
#'
#' @export
barras_prop <- function(base) {

  v1 <- names(base[1])
  v2 <- names(base[2])
  base %>%
    dplyr::mutate(lab = scales::percent(prop)) %>%
    highcharter::hchart(
      "column",
      highcharter::hcaes(!!rlang::sym(v1), prop*100, group = !!rlang::sym(v2))
    ) %>%
    highcharter::hc_colors(colors = viridis::viridis(2, 1, .2, .8)) %>%
    highcharter::hc_yAxis(
      title = list(text = "Propor\u00e7\u00e3o"),
      labels = list(format = "{value}%")
    ) %>%
    highcharter::hc_xAxis(
      title = list(text = stringr::str_to_title(v1))
    ) %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = "<b>Quantidade</b>: {point.n}<br><b>Propor\u00e7\u00e3o</b>: {point.lab}"
    ) %>%
    highcharter::hc_exporting(
      enabled = TRUE,
      filename = paste(v1, v2, sep = "_")
    )


}
