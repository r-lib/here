
-   [Ode to the here package](#ode-to-the-here-package)
    -   [TL;DR](#tldr)
    -   [Admitting you have a problem](#admitting-you-have-a-problem)
    -   [Actual demonstration](#actual-demonstration)
    -   [The fine print](#the-fine-print)

<!-- README.md is generated from README.Rmd. Please edit that file -->
Ode to the here package
=======================

TL;DR
-----

Install [here](https://krlmlr.github.io/here/).

``` r
## install.packages(devtools)
devtools::install_github("krlmlr/here")
```

Use it.

``` r
library(here)
here("data", "file_i_want.csv")
```

This works, regardless of where the associated source file lives inside your project. These paths will also "just work" during interactive development, without incessant fiddling with the working directory of your IDE's R process.

`here::here()` works like `file.path()`, but where the path root is implicitly set to "the path to the top-level of my current project". See [The Fine Print](#the-fine-print) for the underlying heuristics. If they don't suit, use the more powerful package [rprojroot](https://krlmlr.github.io/rprojroot/) directly. Both [here](https://krlmlr.github.io/here/) and [rprojroot](https://krlmlr.github.io/rprojroot/) are written by [Kirill Müller](https://github.com/krlmlr) and rprojroot is already on CRAN.

Admitting you have a problem
----------------------------

> If the first line of your \#rstats script is `setwd("C:\Users\jenny\path\that\only\I\have")`, I will come into your lab and SET YOUR COMPUTER ON FIRE.

Mash-up of rage tweets by [@jennybc](https://twitter.com/JennyBryan/status/673240213313851393) and [@tpoi](https://twitter.com/tpoi/status/720340395901648897).

Do you:

-   Have `setwd()` in your scripts? PLEASE STOP DOING THAT.
    -   This makes your script very fragile, hard-wired to exactly one time and place. As soon as you rename or move directories, it breaks. Or maybe you get a new computer? Or maybe someone else needs to run your code? We show a very accessible way to go cold turkey and eliminate the `setwd()` gotcha from your code.
-   Fanny around with working directory alot? During development and/or at run time? YOU CAN STOP DOING THAT TOO.
    -   Classic problem presentation: Awkwardness around building paths and/or setting working directory in projects with subdirectories. Especially if you use R Markdown and knitr, which trips up alot of people with its default behavior of "working directory = directory where this file lives". We show a very accessible way to specify paths in your project's `.R` and `.Rmd` files, regardless of where they live.

Actual demonstration
--------------------

I will let this code run.

What does here think the top-level of current project is? The package displays this on load or, at any time, you can just call `here()`.

``` r
library(here)
#> here() starts at /home/muelleki/git/R/here_here
here()
#> [1] "/home/muelleki/git/R/here_here"
```

Build a path to something in a subdirectory and use it.

``` r
here("one", "two", "awesome.txt")
#> [1] "/home/muelleki/git/R/here_here/one/two/awesome.txt"
cat(readLines(here("one", "two", "awesome.txt")))
#> OMG this is so awesome!
```

Don't try this at home, folks! But let me set working directory to a subdirectory and prove to you that the same code as above, for getting the path to `awesome.txt`, still works.

``` r
setwd(here("one"))
getwd()
#> [1] "/home/muelleki/git/R/here_here/one"
cat(readLines(here("one", "two", "awesome.txt")))
#> OMG this is so awesome!
```

The fine print
--------------

`here::here()` figures out the top-level of your current project using some sane heuristics. It looks at working directory, checks a criterion and, if not satisfied, moves up to parent directory and checks again. Lather, rinse, repeat.

Here are the criteria. The order doesn't really matter because all of them are checked for each directory before moving up to the parent directory:

-   Is a file named `.here` present?
-   Is this an RStudio Project? Literally, can I find a file named something like `foo.Rproj`?
-   Is this an R package? Does it have a `DESCRIPTION` file?
-   Is this a [remake](https://github.com/richfitz/remake#readme) project? Does it have a file named `remake.yml`?
-   Is this a [projectile](http://projectile.readthedocs.io/en/latest/) project? Does it have a file named `.projectile`?
-   Is this a checkout from a version control system? Does it have a directory named `.git` or `.svn`? Currently, only Git and Subversion are supported.

If no criteria match, loading the package will fail. Use `here::set_here()` to create an empty `.here` file that will stop the search if none of the other criteria apply. `here::dr_here()` will attempt to explain why `here` decided the root location the way it did.
