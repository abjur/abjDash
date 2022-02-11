library(testthat)
library(magrittr)

# Teste deve sair bem sucedido
test_that("equal when calcular_estatisticas succeeds", {
  base <- abjDash::base_teste
  intervalo <-  c("data_decisao_deferimento", "data_decisao_deferimento")
  working.function <- calcular_estatisticas(intervalo, base)
  expect_equal(class(working.function), c("tbl_df", "tbl","data.frame"))
} )
