library(ggplot2)
library(testthat)
library(magrittr)

# Teste deve sair bem sucedido
test_that("silent when histograma succeeds", {
  base <- (diamonds)
  working.plot <- base %>% dplyr::filter(cut == "Good") %>%
    with(z) %>%
    histograma()
  expect_silent(print(working.plot))
} )

