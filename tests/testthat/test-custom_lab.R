library(ggplot2)
library(testthat)
library(magrittr)
test_that("silent when custom_lab succeeds", {
base <- obsRJRS::da_processo_tidy

working.plot <- base %>%
  dplyr::filter(ativos > 0, passivos > 0,
                passivos < 1e9, ativos > 1e6) %>%
  ggplot2::ggplot(ggplot2::aes(x = ativos, y = passivos)) +
  ggplot2::geom_point() +
  ggplot2::geom_abline(slope = 1, intercept = 0) +
  ggplot2::scale_x_log10(labels = abjDash::custom_lab) +
  ggplot2::scale_y_log10(labels = abjDash::custom_lab)

expect_silent(print(working.plot))

} )
