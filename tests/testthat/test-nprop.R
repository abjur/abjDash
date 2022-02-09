testthat::test_that("just n_prop works as expected", {
  base <- (mtcars)

  testthat::expect_equal(nprop(mtcars$cyl, 4), "11 (34,4%)")
  testthat::expect_equal(nprop(mtcars$cyl, 6), "7 (21,9%)")
})
