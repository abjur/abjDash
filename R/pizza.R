#' Graficos de setores do tipo highcharter
#' @name pizza
#' @description funcao que cria grafico dinamico
#' @param da base
#'
#' @export
pizza <- function(da) {
  v <- names(da)[1]
  cores <- viridis::viridis(nrow(da), begin = .2, end = .8)
  da %>%
    highcharter::hchart(
      "pie",
      highcharter::hcaes(!!rlang::sym(v), prop)
    ) %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = sprintf(
        "<b>{point.%s} <br> aparece em {point.lab} do total</b>",
        v
      )
    ) %>%
    highcharter::hc_colors(cores) %>%
    highcharter::hc_plotOptions(pie = list(
      allowPointSelect = TRUE,
      cursor = "pointer"
    ))

}
