#' Gráfico Kaplan-meier de modelo de sobrevivência (2 variáveis)
#' @name grafico_km2
#' @description Função que cria gráfico no modelo de sobrevivência Kaplan-meier
#' @param m modelo
#' @param lab label para cores
#'
#' @export
grafico_km2 <- function(m, lab) {
  m %>%
    broom::tidy() %>%
    dplyr::filter(!is.na(conf.high)) %>%
    dplyr::mutate(strata = stringr::str_remove(strata, "[^=]+=")) %>%
    ggplot2::ggplot(ggplot2::aes(
      x = time, y = estimate, colour = strata
    )) +
    ggplot2::geom_ribbon(
      ggplot2::aes(ymin = conf.low, ymax = conf.high, fill = strata),
      stat = "stepribbon", alpha = .3, colour = NA
    ) +
    ggplot2::geom_step(size = .5) +
    ggplot2::geom_hline(
      yintercept = .5,
      colour = "gray50",
      linetype = 2
    ) +
    ggplot2::scale_x_continuous(n.breaks = 15) +
    ggplot2::labs(
      x = "Tempo (dias)", y = "Sobreviv\u00eancia",
      fill = lab,
      colour = lab
    ) +
    ggplot2::scale_colour_viridis_d(begin = 0.2, end = 0.8) +
    ggplot2::scale_fill_viridis_d(begin = 0.2, end = 0.8) +
    ggplot2::scale_y_continuous(
      labels = scales::percent, breaks = 0:4*.25,
      limits = c(0,1)
    ) +
    ggplot2::theme_minimal(14) +
    ggplot2::theme(legend.position = "bottom")
}
