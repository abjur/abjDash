testthat::test_that("taking the mean works", {
  testthat::expect_equal(tira_media(c(1, 2, 3, 4, NA, 6)), 3.2)
  testthat::expect_equal(tira_media(c(1, 2, 3, 4, 6)), 3.2)
})
