
<!-- README.md is generated from README.Rmd. Please edit that file -->

# compicc

<!-- badges: start -->
<!-- badges: end -->

## Description

The goal of compicc is to help practicioners in fields such as psychology,
medicine and sports performance science to compare the reliability of two
raters (or systems, instruments or judges). This package includes two functions
that allow the user to compute the difference between the intraclass
correlation coefficient of measurements in two datasets. For example,
one may compare the reliability of measurements from two different raters
(or measurement instruments) or one rater at two different time points.

## Installation

You may install the released version of compicc from CRAN with:

``` r
install.packages("compicc")
```

The development version from [GitHub](https://github.com/) is available
with:

``` r
# install.packages("devtools")
devtools::install_github("rmulshine/compicc")
```

## Structure

This package includes two functions:

-   Confidence interval of difference of *dependent* intraclass
    correlation coefficients: `dep_ci()`
-   Confidence interval of difference of *independent* intraclass
    correlation coefficients: `indep_ci()`

The package includes example data to illustrate both functions. Details
are given in the vignette. The vignette also explains possible user errors,
typically due to incorrect formatting of the data, and reviews both
functions’ error messages.
