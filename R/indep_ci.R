#' Confidence Interval for the difference between two independent ICCs
#'
#' Confidence Interval for the difference between two independent ICCs
#'
#' Used when a different set of subjects are tested in each dataframe. The wide format for the dataframe means that the subjects constitute the rows, and the multiple trials per subject constitute the columns of the dataframe.
#'
#' @param data1 A dataframe in wide format
#' @param data2 A dataframe in wide format
#' @param conf_level The confidence level of the confidence interval; defaults to 0.95 (95%).
#'
#' @return A list with 3 elements:
#'
#' ICC of data1 (\code{$icc_1})
#'
#' ICC of data2 (\code{$icc_2})
#'
#' Confidence interval for the difference between the ICC of data1 and the ICC of data2 (\code{$confidenceIntervalDifference})
#'
#' The confidence interval is a 1x2 dataframe with calls \code{$lowerBound} and \code{$upperBound} for the bounds of the interval
#'
#' @examples subject1_test1 <- c(46, 42, 43)
#' subject2_test1 <- c(34, 35, 34)
#' subject3_test1 <- c(51, 48, 54)
#' rater1Data <- data.frame(subject1_test1, subject2_test1, subject3_test1)
#'
#' subject4_test2 <- c(26, 25, 28)
#' subject5_test2 <- c(43, 45, 45)
#' subject6_test2 <- c(30, 31, 31)
#' rater2Data <- data.frame(subject4_test2, subject5_test2, subject6_test2)
#'
#' indep_ci(rater1Data, rater2Data)
#' indep_ci(rater1Data, rater2Data, conf_level = 0.90)
#'
#' @export

indep_ci <- function(data1, data2, conf_level = 0.95) {
  if(ncol(data1) != ncol(data2)) {stop("number of columns in data1 must equal that of data2")}
  if(any(is.na(data1)) == TRUE) {stop("cannot have NA values in dataframe")}
  if(any(is.na(data2)) == TRUE) {stop("cannot have NA values in dataframe")}

  icc_1 <- irr::icc(data1, model = "twoway", type = "agreement", unit = "single", conf.level = conf_level)
  icc_2 <- irr::icc(data2, model = "twoway", type = "agreement", unit = "single", conf.level = conf_level)

  icc_1_lower <- icc_1$lbound
  icc_1_upper <- icc_1$ubound
  icc_1_p <- icc_1$value

  icc_2_lower <- icc_2$lbound
  icc_2_upper <- icc_2$ubound
  icc_2_p <- icc_2$value

  lowerBound <- icc_1_p - icc_2_p - sqrt(((icc_1_p-icc_1_lower)**2) + ((icc_2_upper-icc_2_p)**2))
  upperBound <- icc_1_p - icc_2_p + sqrt(((icc_1_upper-icc_1_p)**2) + ((icc_2_p-icc_2_lower)**2))

  CI_df <- data.frame(lowerBound, upperBound)

  CI_list <- list(icc_1$value, icc_2$value, CI_df)
  names(CI_list) <- c("data1ICC", "data2ICC", "confidenceIntervalDifference")

  return(CI_list)
}

