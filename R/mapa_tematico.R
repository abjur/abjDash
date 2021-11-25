#' Mapas temáticos com reais e proporção
#' @name mapa_tematico
#' @description Função que cria mapa dinâmico
#' @param data base
#'
#' @export
mapa_tematico <- function(data) {
  v <- names(data)[1]
  da_lab <- data %>%
    dplyr::mutate(
      prop = n/sum(n),
      lab = stringr::str_glue("{reais(n)} ({pct(prop)})")
    )

  highcharter::hcmap(
    "countries/br/br-all",
    data = da_lab,
    value = "prop",
    joinBy = c("hc-a2", "uf"),
    borderColor = "#FAFAFA",
    dataLabels = list(enabled = TRUE, format = "{point.uf}"),
    borderWidth = 0.1,
    tooltip = list(
      pointFormat = "{point.name}: {point.lab}"
    ),
    download_map_data = TRUE
  ) %>%
    highcharter::hc_colorAxis(
      type = "logarithmic"
    ) %>%
    highcharter::hc_exporting(
      enabled = TRUE,
      filename = v
    )
}
