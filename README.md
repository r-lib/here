
<!-- README.md and index.md are generated from README.Rmd. Please edit that file. -->

# here

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![rcc](https://github.com/r-lib/here/workflows/rcc/badge.svg)](https://github.com/r-lib/here/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/here)](https://CRAN.R-project.org/package=here)
[![Codecov test
coverage](https://codecov.io/gh/r-lib/here/branch/main/graph/badge.svg)](https://codecov.io/gh/r-lib/here?branch=main)
<!-- badges: end -->

The goal of the here package is to enable easy file referencing in
[project-oriented workflows](https://rstats.wtf/projects.html). In
contrast to using `setwd()`, which is fragile and dependent on the way
you organize your files, here uses the top-level directory of a project
to easily build paths to files.

## Installation

Install the released version of here from CRAN:

``` r
install.packages("here")
```

## Usage

The here package creates paths relative to the top-level directory. The
package displays the top-level of the current project on load or any
time you call `here()`:

``` r
here::i_am("README.Rmd")
#> here() starts at /Users/kirill/git/R/r-lib/here
here()
#> [1] "/Users/kirill/git/R/r-lib/here"
```

You can build a path relative to the top-level directory in order to
read or write a file:

``` r
here("inst", "demo-project", "data", "penguins.csv")
#> [1] "/Users/kirill/git/R/r-lib/here/inst/demo-project/data/penguins.csv"
readr::write_csv(palmerpenguins::penguins, here("inst", "demo-project", "data", "penguins.csv"))
```

These relative paths work regardless of where the associated source file
lives inside your project, like analysis projects with data and reports
in different subdirectories. See the included [demo
project](https://github.com/r-lib/here/tree/main/inst/demo-project) for
an example.

![](https://raw.githubusercontent.com/allisonhorst/stats-illustrations/master/rstats-artwork/here.png)
*Illustration by [Allison Horst](https://github.com/allisonhorst)*

------------------------------------------------------------------------

## Code of Conduct

Please note that the here project is released with a [Contributor Code
of Conduct](https://here.r-lib.org/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.
