<!-- README.md is generated from README.Rmd. Please edit that file -->

# here

<!-- badges: start -->

[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable) [![rcc](https://github.com/r-lib/here/workflows/rcc/badge.svg)](https://github.com/r-lib/here/actions) [![CRAN status](https://www.r-pkg.org/badges/version/here)](https://CRAN.R-project.org/package=here) [![Codecov test coverage](https://codecov.io/gh/r-lib/here/branch/master/graph/badge.svg)](https://codecov.io/gh/r-lib/here?branch=master)

<!-- badges: end -->

The goal of the here package is to enable easy file referencing in [project-oriented workflows](https://rstats.wtf/project-oriented-workflow.html). In contrast to using [`setwd()`](https://rdrr.io/r/base/getwd.html), which is fragile and dependent on the way you organize your files, here uses the top-level directory of a project to easily build paths to files.

## Installation

Install the released version of here from CRAN:

<pre class='chroma'>
<span class='nf'><a href='https://rdrr.io/r/utils/install.packages.html'>install.packages</a></span><span class='o'>(</span><span class='s'>"here"</span><span class='o'>)</span></pre>

## Usage

The here package creates paths relative to the top-level directory. The package displays the top-level of the current project on load or any time you call `here()`:

<pre class='chroma'>
<span class='nf'>here</span><span class='nf'>::</span><span class='nf'><a href='https://here.r-lib.org//reference/i_am.html'>i_am</a></span><span class='o'>(</span><span class='s'>"README.Rmd"</span><span class='o'>)</span>
<span class='c'>#&gt; here() starts at /home/kirill/git/R/here</span>
<span class='nf'>here</span><span class='o'>(</span><span class='o'>)</span>
<span class='c'>#&gt; [1] "/home/kirill/git/R/here"</span></pre>

You can build a path relative to the top-level directory in order to read or write a file:

<pre class='chroma'>
<span class='nf'>here</span><span class='o'>(</span><span class='s'>"inst"</span>, <span class='s'>"demo-project"</span>, <span class='s'>"data"</span>, <span class='s'>"penguins.csv"</span><span class='o'>)</span>
<span class='c'>#&gt; [1] "/home/kirill/git/R/here/inst/demo-project/data/penguins.csv"</span>
<span class='nf'>readr</span><span class='nf'>::</span><span class='nf'><a href='https://readr.tidyverse.org/reference/write_delim.html'>write_csv</a></span><span class='o'>(</span><span class='nf'>palmerpenguins</span><span class='nf'>::</span><span class='nv'><a href='https://allisonhorst.github.io/palmerpenguins/reference/penguins.html'>penguins</a></span>, <span class='nf'>here</span><span class='o'>(</span><span class='s'>"inst"</span>, <span class='s'>"demo-project"</span>, <span class='s'>"data"</span>, <span class='s'>"penguins.csv"</span><span class='o'>)</span><span class='o'>)</span></pre>

These relative paths work regardless of where the associated source file lives inside your project, like analysis projects with data and reports in different subdirectories. See the included [demo project](https://github.com/r-lib/here/tree/master/inst/demo-project) for an example.

![](https://raw.githubusercontent.com/allisonhorst/stats-illustrations/master/rstats-artwork/here.png) *Illustration by [Allison Horst](https://github.com/allisonhorst)*

------------------------------------------------------------------------

## Code of Conduct

Please note that the here project is released with a [Contributor Code of Conduct](https://here.r-lib.org/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
