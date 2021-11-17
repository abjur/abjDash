testthat::test_that("tempo_lab works as expected", {
  testthat::expect_equal(tempo_lab(c(258793, 4526)), c("258793 anos", "4526 anos"))
  testthat::expect_equal(tempo_lab(c(2555, 4, 58732)), c("2555 anos",  "4 anos", "58732 anos"))
})
