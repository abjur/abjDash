#' Histograma do tipo highcharter
#' @name histograma
#' @description funcao que cria grafico dinamico
#' @param v valores
#'
#' @export
histograma <- function(v) {
  highcharter::hchart(v) %>%
    highcharter::hc_colors("#414487FF") %>%
    highcharter::hc_xAxis(plotLines = list(list(
      label = list(text = "Mediana"),
      color = "#FF0000",
      width = 2,
      value = stats::median(v),
      zIndex = 999
    )))
}
