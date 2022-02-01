library(irr)

# INDEPENDENT CASE, WIDE FORMAT
indep_ci <- function(data1, data2) {
  if(ncol(data1) != ncol(data2)) {stop("number of columns in data1 must equal that of data2")}
  if(any(is.na(data1)) == TRUE) {stop("cannot have NA values in dataframe")}
  if(any(is.na(data2)) == TRUE) {stop("cannot have NA values in dataframe")}

  icc_1 <- icc(data1, model = "twoway", type = "agreement", unit = "single")
  icc_2 <- icc(data2, model = "twoway", type = "agreement", unit = "single")

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
  names(CI_list) <- c("data1ICC", "data2ICC", "confidenceInterval")

  return(CI_list)
}

