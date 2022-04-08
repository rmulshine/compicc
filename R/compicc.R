#' @title compicc
#'
#' @description A package for computing the confidence interval for the
#'   difference between two datasets' intraclass correlation coefficients
#'   (ICCs). It contains functions to compute the confidence interval for
#'   dependent (\code{dep_ci}) and independent (\code{indep_ci}) data.
#'
#'   If the two dataset being compared consist of the same subjects, the
#'   dependent function \code{dep_ci} should be used. If a different set of
#'   subjects were tested in each dataset, the independent function
#'   \code{indep_ci} should be used.
#'
#'   The package includes 4 dataframes. The dataframes dep_ex_df1 and
#'   dep_ex_df2 can be used as examples with the function (\code{dep_ci()}),
#'   while the dataframes indep_ex_df1 and indep_ex_df2 can be used as examples
#'   with the function (\code{indep_ci()}).
#'
#' @docType package
#' @name compicc
NULL
