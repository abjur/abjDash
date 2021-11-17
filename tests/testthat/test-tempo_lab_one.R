testthat::test_that("tempo_lab_one works as expected", {
  testthat::expect_equal(tempo_lab_one(258793), "258793 anos")
  testthat::expect_equal(tempo_lab_one(2555), "2555 anos")
})
