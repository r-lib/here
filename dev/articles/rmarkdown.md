# Using here with rmarkdown

The here package enables easy file referencing by using the top-level
directory of a file project to easily build file paths. This article
demonstrates the case where the working directory is set to a
subdirectory of the project root, for instance when rendering an R
Markdown document that lives in a subdirectory. See
[`vignette("here")`](https://here.r-lib.org/dev/articles/here.md) for a
more general introduction.

## rmarkdown starts in a subdirectory

For demonstration, this article uses a data analysis project that lives
in `/home/runner/work/_temp/Library/here/demo-project` on my machine.
This is the *project root*. The path will most likely be different on
your machine, the here package helps deal with this situation.

The project has the following structure:

    #> /home/runner/work/_temp/Library/here/demo-project
    #> ├── analysis
    #> │   └── report.Rmd
    #> ├── data
    #> │   └── penguins.csv
    #> ├── demo-project.Rproj
    #> └── prepare
    #>     └── penguins.R

When `report.Rmd` is rendered, the working directory is internally set
to `<project root>/analysis` by rmarkdown:

``` r
setwd(file.path(project_path, "analysis"))
```

``` r
getwd()
#> [1] "/home/runner/work/_temp/Library/here/demo-project/analysis"
```

However, `penguins.csv` still lives in the `data/` subdirectory. The
report requires the `penguins.csv` file to work.

## here always uses project-relative paths

To render `report.Rmd`, you would have to ensure the path to
`penguins.csv` is relative to the `analysis/` directory - i.e.,
`../data/penguins.csv`. The chunks would knit properly, but could not be
run in the console since the working directory in the console *isn’t*
`analysis/`.

The here package circumvents this issue by always referring to the
project root:

``` r
here::i_am("analysis/report.Rmd")
#> here() starts at /home/runner/work/_temp/Library/here/demo-project
```

All files accessed by `report.Rmd` should be referred to using
[`here()`](https://here.r-lib.org/dev/reference/here.md):

``` r
library(here)
here("data", "penguins.csv")
#> [1] "/home/runner/work/_temp/Library/here/demo-project/data/penguins.csv"
here("data/penguins.csv")
#> [1] "/home/runner/work/_temp/Library/here/demo-project/data/penguins.csv"
```

This ensures that `penguins.csv` can be read both when the report is
knit and when the code is run interactively in the console.
