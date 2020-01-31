
<!-- README.md is generated from README.Rmd. Please edit that file -->

# here

<!-- badges: start -->

[![Travis-CI Build
Status](https://travis-ci.org/r-lib/here.svg?branch=master)](https://travis-ci.org/r-lib/here)
[![CRAN
status](https://www.r-pkg.org/badges/version/here)](https://CRAN.R-project.org/package=here)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- badges: end -->

The goal of the here package is to enable easy file referencing. In
contrast to using `setwd()`, which is fragile and dependent on the way
you organize your files, here uses the top-level directory of a project
to easily build paths to files.

## Installation

Install the released version of here from CRAN:

``` r
install.packages("here")
```

Or install the development version from GitHub with:

``` r
devtools::install_github("r-lib/here")
```

## Usage

The here package creates paths relative to the top-level directory. The
package displays the top-level of the current project on load or any
time you call `here()`:

``` r
library(here)
#> here() starts at /Users/sharla/github/tidy-dev-day-2020/here
here()
#> [1] "/Users/sharla/github/tidy-dev-day-2020/here"
```

You can build a path relative to the top-level directory in order to
read or write a file:

``` r
here("files", "data", "iris.csv")
```

``` r
write.csv(iris, here("files", "data", "iris.csv"))
```

These relative paths work regardless of where the associated source file
lives inside your project, like analysis projects with data and reports
in different
subdirectories.

![](https://raw.githubusercontent.com/allisonhorst/stats-illustrations/master/rstats-artwork/here.png)
*Illustration by [Allison Horst](https://github.com/allisonhorst)*
