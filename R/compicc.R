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
#'   The package includes 4 dataframes. The dataframes dep_df1 and
#'   dep_df2 can be used as examples with the function (\code{dep_ci()}),
#'   while the dataframes indep_df1 and indep_df2 can be used as examples
#'   with the function (\code{indep_ci()}).
#'
#'   The method to calculate the confidence interval was first proposed by
#'   Ramasundarahettige et al. (2009).
#'
#' @docType package
#' @name compicc
NULL
