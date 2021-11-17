testthat::test_that("pct works as expected", {
  testthat::expect_equal(pct(c(1, 2, 3, 4, 4, 6)), c("100,0%", "200,0%", "300,0%", "400,0%", "400,0%", "600,0%"))
  testthat::expect_equal(pct(c(2, 1, 3, 4, 6)),c("200,0%", "100,0%", "300,0%", "400,0%", "600,0%"))
})
