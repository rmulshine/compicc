library(irr)

# DEPENDENT CASE, WIDE FORMAT----------------------------------------------------------------------------
dep_ci <- function(data1, data2) {
  if(ncol(data1) != ncol(data2)) {stop("number of columns in data1 must equal that of data2")}
  if(nrow(data1) != nrow(data2)) {stop("number of rows in data1 must equal that of data2")}
  if(any(is.na(data1 & data2)) == TRUE) {stop("cannot have NA values in dataframe")}

  icc_1 <- icc(data1, model = "twoway", type = "agreement", unit = "single")
  icc_2 <- icc(data2, model = "twoway", type = "agreement", unit = "single")

  icc_1_lower <- icc_1$lbound
  icc_1_upper <- icc_1$ubound
  icc_1_p <- icc_1$value

  icc_2_lower <- icc_2$lbound
  icc_2_upper <- icc_2$ubound
  icc_2_p <- icc_2$value

  vals_1 <- NULL
  for (i in 1:nrow(data1)) {
    for (j in 1:ncol(data1)) {
      for (k in 1:5) {
        vals_1 <- c(vals_1, as.numeric(data1[i,j]))
      }
    }
  }

  vals_2 <- NULL
  for (i in 1:nrow(data2)) {
    for (j in 1:5) {
      for (k in 1:ncol(data2)) {
        vals_2 <- c(vals_2, as.numeric(data2[i, k]))
      }
    }
  }

  p12 <- cor(vals_1, vals_2, method = "pearson")

  k_1 <- ncol(data1)
  k_2 <- ncol(data2)

  corr_numerator <- sqrt(k_1*k_2*(k_1-1)*(k_2-2))*(p12**2)
  corr_denominator <- ((1+((k_1-1)*icc_1_p))*(1+((k_2-1)*icc_2_p)))
  corr <- corr_numerator/corr_denominator

  CI_lower_corr_mult <- 2*corr*(icc_1_p-icc_1_lower)*(icc_2_upper-icc_2_p)
  lowerBound <- icc_1_p - icc_2_p - sqrt(((icc_1_p-icc_1_lower)**2) - CI_lower_corr_mult + ((icc_2_upper-icc_2_p)**2))

  CI_upper_corr_mult <- 2*corr*(icc_1_upper-icc_1_p)*(icc_2_p-icc_2_lower)
  upperBound <- icc_1_p - icc_2_p + sqrt(((icc_1_upper-icc_1_p)**2) - CI_upper_corr_mult + ((icc_2_p-icc_2_lower)**2))
  CI_df <- data.frame(lowerBound, upperBound)

  CI_list <- list(icc_1$value, icc_2$value, CI_df)
  names(CI_list) <- c("data1ICC", "data2ICC", "confidenceInterval")

  return(CI_list)
}

