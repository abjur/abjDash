library(ggplot2)
library(testthat)
library(magrittr)

# Teste deve sair bem sucedido
test_that("silent when barras empilhadas succeeds", {
  base <- (diamonds)
  working.plot <- base %>% dplyr::count(cut) %>% barras_empilhadas("cut")
   expect_silent(print(working.plot))
} )
