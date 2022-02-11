library(ggplot2)
library(testthat)
library(magrittr)

# Teste deve sair bem sucedido
test_that("silent when pizza succeeds", {
  base <- (diamonds)
  working.plot <- base %>% dplyr::count(cut) %>%
    dplyr::mutate(prop = n/sum(n), lab = pct(prop)) %>% pizza()
  expect_silent(print(working.plot))
} )

