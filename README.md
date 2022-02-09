
<!-- README.md is generated from README.Rmd. Please edit that file -->

# compicc

<!-- badges: start -->
<!-- badges: end -->

## Description

The goal of compicc is to help practicioners in the fields of medicine,
psychology and sports science to efficiently compare the reliability of
two systems, measurers or judges. This package includes two functions
that allow the user to compute the difference between the intraclass
correlation coefficient of two datasets of measurements. This can be
used to compare two different systems, one system at two different time
points, or many other applications.

## Installation

You can install the development version of compicc like so:

``` r
install.packages("compicc")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rmulshine/compicc")
```

## Structure

This package includes two functions:

-   Confidence interval of difference of *dependent* intraclass
    correlation coefficients: **dep\_ci()**
-   Confidence interval of difference of *independent* intraclass
    correlation coefficients: **indep\_ci()**

The package includes example data that can be run on both functions.

The package’s vignette further describes both functions and shows how
they can be used with the package’s included data. The vignette also
explains possible user errors, typically due to incorrect formatting of
the data, and reviews both functions’ specialized error messages.
