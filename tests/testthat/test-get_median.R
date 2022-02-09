library(testthat)
library(magrittr)

# Teste deve sair bem sucedido
test_that("equal when calcular_estatisticas succeeds", {
  base <- abjDash::base_teste
  intervalo <-  list( tempo1 = c("data_decisao_deferimento", "data_aprovacao"),
                      tempo2 = c("data_aprovacao", "data_decisao_deferimento"))
working.function <-  intervalo %>%
  purrr::map_dfr(calcular_estatisticas, base, .id = "tempo")
  working.function2 <- stringr::str_extract(
    get_median(working.function, "data_aprovacao"), "[0-9]+"
  )

  expect_equal(class(working.function2), "character")
} )
