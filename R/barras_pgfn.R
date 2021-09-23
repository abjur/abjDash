#' Graficos de barras do tipo highcharter
#' @name barras_pgfn
#' @description funcao que cria grafico dinamico de barras com proporção
#' @param da base
#' @param tipo barras
#' @param valor valor
#' @param corte intervalo (default é 0.01)
#'
#' @export
barras_pgfn <- function(da, tipo = "bar", valor, corte = 0.01) {

  v <- names(da)[1]
  if (valor == "n") {
    lab_y <- "N"
  } else {
    lab_y <- "Valor"
  }

  if (!tibble::has_name(da, "prop")) {
    da$prop <- with(da, n/sum(n))
  }

  da %>%
    dplyr::filter(prop > corte) %>%
    dplyr::mutate(
      lab = scales::percent(prop),
      lab_n = dplyr::case_when(
        valor == "n" ~ scales::number(n, big.mark = ".", decimal.mark = ","),
        TRUE ~ scales::dollar(n, big.mark = ".", decimal.mark = ",", prefix = "R$")
      )
    ) %>%
    highcharter::hchart(
      tipo,
      highcharter::hcaes(!!rlang::sym(v), n, fillColor = 1)
    ) %>%
    highcharter::hc_colors("#414487FF") %>%
    highcharter::hc_yAxis(title = list(text = lab_y)) %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = "<b>Valor</b>: {point.lab_n}<br><b>Propor\u00e7\u00e3o</b>: {point.lab}"
    ) %>%
    highcharter::hc_exporting(
      enabled = TRUE,
      filename = v
    )
}
