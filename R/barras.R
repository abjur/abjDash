#' Graficos de barras do tipo highcharter
#' @name barras
#' @description funcao que cria grafico dinamico
#' @param base base
#' @param tipo tipo barras
#'
#' @export
barras <- function(base, tipo = "bar") {

  v <- names(base)[1]

  if (!tibble::has_name(base, "prop")) {
    base$prop <- with(base, n/sum(n))
  }

  base %>%
    dplyr::mutate(lab = scales::percent(prop)) %>%
    highcharter::hchart(
      tipo,
      highcharter::hcaes(!!rlang::sym(v), n, fillColor = 1)
    ) %>%
    highcharter::hc_colors(colors = "#414487FF") %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = "<b>Quantidade</b>: {point.n}<br><b>Propor\u00e7\u00e3o</b>: {point.lab}"
    )
}
