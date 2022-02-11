library(testthat)
library(magrittr)

# Teste deve sair bem sucedido
test_that("equal when calcular_medianas succeeds", {
  base <- abjDash::base_teste
  working.function <- base %>%
    dplyr::filter(!is.na(n_processo)) %>% dplyr::mutate(data_referencia = data_aprovacao) %>%
    calcular_medianas(data_decisao_deferimento, data_aprovacao, capital)
  expect_equal(class(working.function), c("tbl_df", "tbl","data.frame"))
} )
