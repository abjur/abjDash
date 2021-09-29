#' Grafico Kaplan-meier de modelo de sobrevivencia
#' @name grafico_km
#' @description funcao que cria grafico no modelo de sobrevivencia Kaplan-meier
#' @param m modelo
#'
#' @export
grafico_km <- function(m) {
  cols <- viridis::viridis(2, begin = 0.2, end = 0.8)
  suppressWarnings({
    m %>%
      broom::tidy() %>%
      dplyr::filter(!is.na(conf.high)) %>%
      ggplot2::ggplot(ggplot2::aes(x = time, y = estimate)) +
      ggplot2::geom_ribbon(
        ggplot2::aes(ymin = conf.low, ymax = conf.high),
        stat = "stepribbon",
        fill = cols[2], alpha = .3
      ) +
      ggplot2::geom_step(colour = cols[1], size = .5) +
      ggplot2::geom_hline(
        yintercept = .5,
        colour = "gray50",
        linetype = 2
      ) +
      ggplot2::scale_x_continuous(n.breaks = 15) +
      ggplot2::labs(x = "Tempo (dias)", y = "Sobreviv\u00eancia") +
      ggplot2::scale_y_continuous(
        labels = scales::percent,
        breaks = 0:4*.25,
        limits = c(0,1)
      ) +
      ggplot2::theme_minimal(14)
  })
}
