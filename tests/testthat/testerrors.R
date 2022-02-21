library(compicc)

d1_trial1 <- c(33, 33, 35, 32)
d1_trial2 <- c(43, 41, 42, 41)
d1_trial3 <- c(36, 36, 38, 37)
d1_trial4 <- c(30, 31, 30, 29)
d1_trial5 <- c(45, 45, 46, 45)
data1 <- data.frame(d1_trial1, d1_trial2, d1_trial3, d1_trial4, d1_trial5)

d2_trial1 <- c(33, 33, 35, 32)
d2_trial2 <- c(43, 41, 42, 41)
d2_trial3 <- c(36, 36, 38, 37)
d2_trial4 <- c(30, 31, 30, 29)
d2_trial5 <- c(45, 45, 46, 45)
d2_trial5_na <- c(45, 45, 46, NA)
d2_trial6 <- c(32, 21, 45, 32)
data2 <- data.frame(d2_trial1, d2_trial2, d2_trial3, d2_trial4, d2_trial5)
data2_trial6 <- data.frame(d2_trial1, d2_trial2, d2_trial3, d2_trial4, d2_trial5, d2_trial6)
data2_na <- data.frame(d2_trial1, d2_trial2, d2_trial3, d2_trial4, d2_trial5_na)

d3_trial1 <- c(34, 33, 35)
d3_trial2 <- c(42, 42, 41)
d3_trial3 <- c(34, 36, 36)
d3_trial4 <- c(28, 29, 28)
d3_trial5 <- c(44, 46, 43)
data3 <- data.frame(d3_trial1, d3_trial2, d3_trial3, d3_trial4, d3_trial5)


testthat::test_that("dep_ci with unacceptable data", {
  testthat::expect_error(dep_ci(data1, data3))
  testthat::expect_error(dep_ci(data1, data2_trial6))
  testthat::expect_error(dep_ci(data1, data2_na))
})

testthat::test_that("indep_ci with unacceptable data", {
  testthat::expect_error(indep_ci(data1, data2_trial6))
  testthat::expect_error(indep_ci(data1, data2_na))
})


