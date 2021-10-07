testthat::test_that("reais works as expected", {
  testthat::expect_equal(reais(c(1, 2, 3, 4, 4, 6)), c("R$ 1", "R$ 2", "R$ 3", "R$ 4", "R$ 4", "R$ 6"))
  testthat::expect_equal(reais(c(1, 2, 3, 4, 6)),c("R$ 1", "R$ 2", "R$ 3", "R$ 4", "R$ 6"))
})
