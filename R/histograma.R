#' Histograma do tipo highcharter
#' @name histograma
#' @description funcao que cria grafico dinamico de histograma
#' @param valor valor
#'
#' @export
histograma <- function(valor) {
  highcharter::hchart(valor) %>%
    highcharter::hc_colors("#414487FF") %>%
    highcharter::hc_xAxis(plotLines = list(list(
      label = list(text = "Mediana"),
      color = "#FF0000",
      width = 2,
      value = stats::median(valor),
      zIndex = 999
    )))
}
