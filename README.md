
<!-- README.md is generated from README.Rmd. Please edit that file -->
here [![Travis-CI Build Status](https://travis-ci.org/r-lib/here.svg?branch=master)](https://travis-ci.org/r-lib/here)
========================================================================================================================

A simple interface to [`rprojroot`](https://github.com/r-lib/rprojroot).

Motivation
----------

The logic to find a project root based on certain criteria is packaged in the `rprojroot` package. Many projects might not need the full power, and the complexity that comes with it. Meet `here`:

``` r
library(here)
#> here() starts at /home/travis/build/r-lib/here
here()
#> [1] "/home/travis/build/r-lib/here"
here("DESCRIPTION")
#> [1] "/home/travis/build/r-lib/here/DESCRIPTION"
here("R", "here.R")
#> [1] "/home/travis/build/r-lib/here/R/here.R"
```

Installation
------------

Install from CRAN via

``` r
install.packages("here")
```

Install from GitHub via

``` r
devtools::install_github("r-lib/here")
```
