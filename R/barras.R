#' Graficos de barras do tipo highcharter
#' @name barras
#' @description funcao que cria grafico dinamico
#' @param da base
#' @param tipo tipo barras
#'
#' @export
barras <- function(da, tipo = "bar") {

  v <- names(da)[1]

  if (!tibble::has_name(da, "prop")) {
    da$prop <- with(da, n/sum(n))
  }

  da %>%
    dplyr::mutate(lab = scales::percent(prop)) %>%
    highcharter::hchart(
      tipo,
      highcharter::hcaes(!!rlang::sym(v), n, fillColor = 1)
    ) %>%
    highcharter::hc_colors("#414487FF") %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = "<b>Quantidade</b>: {point.n}<br><b>Propor\u00e7\u00e3o</b>: {point.lab}"
    )
}
