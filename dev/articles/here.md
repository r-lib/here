# here

The here package enables easy file referencing by using the top-level
directory of a file project to easily build file paths. This is in
contrast to using [`setwd()`](https://rdrr.io/r/base/getwd.html), which
is fragile and dependent on the way you order your files on your
computer. Read more about project-oriented workflows:

- What They Forgot to Teach You About R: [“Project-oriented
  workflow”](https://rstats.wtf/projects.html) chapter by Jenny Bryan
  and Jim Hester

- [“Project-oriented
  workflow”](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/)
  blog post by Jenny Bryan

- R for data science: [“Workflow:
  projects”](https://r4ds.had.co.nz/workflow-projects.html) chapter by
  Hadley Wickham

## Basic functionality

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

You can review the project on
[GitHub](https://github.com/r-lib/here/tree/main/inst/demo-project) and
also download a copy.

To start working on this project in RStudio, open the
`demo-project.Rproj` file. This ensures that the [working
directory](https://en.wikipedia.org/wiki/Working_directory) is set to
`/home/runner/work/_temp/Library/here/demo-project`, the project root.
Opening only the `.R` or the `.Rmd` file may be insufficient!

Other development environments may have a different notion of a project.
Either way, it is important that the working directory is set to the
project root or a subdirectory of that path. You can check with:

``` r
setwd(project_path)
```

``` r
getwd()
#> [1] "/home/runner/work/_temp/Library/here/demo-project"
```

(See
[`vignette("rmarkdown")`](https://here.r-lib.org/dev/articles/rmarkdown.md)
for an example where the working directory is set to a subdirectory on
start.)

### Declare the location of the current script

The intended use is to add a call to
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) at the
beginning of your script or in the first chunk of your rmarkdown
report.[¹](#fn1) This achieves the following:

- The location of the current script or report within the project is
  declared
- The project root is initialized, consistent with the location of the
  current script or report
- An informative message is emitted.[²](#fn2)

The first argument to
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) should be
the path to the current file, relative to the project root. The
`penguins.R` script uses:

``` r
here::i_am("prepare/penguins.R")
#> here() starts at /home/runner/work/_temp/Library/here/demo-project
```

[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) displays
the top-level directory of the current project. Because the project has
a `prepare/` directory in its root that contains `penguins.R`, it is
correctly inferred as the project root.

After [`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md),
insert [`library(here)`](https://here.r-lib.org/) to make the
[`here()`](https://here.r-lib.org/dev/reference/here.md) function
available:[³](#fn3)

``` r
library(here)
```

The top-level directory is also returned from the
[`here()`](https://here.r-lib.org/dev/reference/here.md) function:

``` r
here()
#> [1] "/home/runner/work/_temp/Library/here/demo-project"
```

One important distinction from the working directory is that this
remains stable even if the working directory is changed:

``` r
setwd("analysis")
getwd()
#> [1] "/home/runner/work/_temp/Library/here/demo-project/analysis"
here()
#> [1] "/home/runner/work/_temp/Library/here/demo-project"
setwd("..")
```

(I suggest to steer clear from ever changing the working directory. This
may not always be feasible, in particular if the working directory is
changed by code that you do not control.)

### Use project-relative paths

You can build a path relative to the top-level directory in order to
build the full path to a file:

``` r
here("data", "penguins.csv")
#> [1] "/home/runner/work/_temp/Library/here/demo-project/data/penguins.csv"
readr::read_csv(
  here("data", "penguins.csv"),
  col_types = list(.default = readr::col_guess()),
  n_max = 3
)
#> # A tibble: 3 × 8
#>   species island    bill_length_mm bill_depth_mm flipper_length_mm
#>   <chr>   <chr>              <dbl>         <dbl>             <dbl>
#> 1 Adelie  Torgersen           39.1          18.7               181
#> 2 Adelie  Torgersen           39.5          17.4               186
#> 3 Adelie  Torgersen           40.3          18                 195
#> # ℹ 3 more variables: body_mass_g <dbl>, sex <chr>, year <dbl>
```

This works regardless of where the associated source file lives inside
your project. With
[`here()`](https://here.r-lib.org/dev/reference/here.md), the path will
always be relative to the top-level project directory.

[`here()`](https://here.r-lib.org/dev/reference/here.md) works very
similarly to [`file.path()`](https://rdrr.io/r/base/file.path.html) or
[`fs::path()`](https://fs.r-lib.org/reference/path.html), you can pass
path components or entire subpaths:

``` r
here("data/penguins.csv")
#> [1] "/home/runner/work/_temp/Library/here/demo-project/data/penguins.csv"
```

As seen above, [`here()`](https://here.r-lib.org/dev/reference/here.md)
returns absolute paths (starting with `/`, `<drive letter>:\` or `\\`).
This makes it safe to pass these paths to other functions, even if the
working directory is changed along the way.

As of version 1.0.0, absolute paths passed to
[`here()`](https://here.r-lib.org/dev/reference/here.md) are returned
unchanged. This means that you can safely use both absolute and
project-relative paths in
[`here()`](https://here.r-lib.org/dev/reference/here.md).

``` r
data_path <- here("data")
here(data_path)
#> [1] "/home/runner/work/_temp/Library/here/demo-project/data"
here(data_path, "penguins.csv")
#> [1] "/home/runner/work/_temp/Library/here/demo-project/data/penguins.csv"
```

### Situation report

The [`dr_here()`](https://here.r-lib.org/dev/reference/dr_here.md)
function explains the reasoning behind choosing the project root:

``` r
dr_here()
#> here() starts at /home/runner/work/_temp/Library/here/demo-project.
#> - This directory contains a file 'prepare/penguins.R'
#> - Initial working directory: /home/runner/work/_temp/Library/here/demo-project
#> - Current working directory: /home/runner/work/_temp/Library/here/demo-project
```

The `show_reason` argument can be set to `FALSE` to reduce the output to
one line:

``` r
dr_here(show_reason = FALSE)
#> here() starts at /home/runner/work/_temp/Library/here/demo-project
```

### What if the working directory is wrong?

The declaration of the active file via
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) also
protects against accidentally running the script from a working
directory outside of your project. The example below calls
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) from the
temporary directory, which is clearly outside our project:

``` r
withr::with_dir(tempdir(), {
  print(getwd())
  here::i_am("prepare/penguins.R")
})
#> [1] "/tmp/RtmpgHrWFq"
#> Error:
#> ! Could not find associated project in working directory or any parent directory.
#> - Path in project: prepare/penguins.R
#> - Current working directory: /tmp/RtmpgHrWFq
#> Please open the project associated with this file and try again.
```

This can also happen when a file has been renamed or moved without
updating the
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) call. In
the future, a helper function will assist with installing and updating
suitably formatted
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) calls in
your scripts and reports.

## Extra safety

### Conflicts with other packages

Other packages also export a
[`here()`](https://here.r-lib.org/dev/reference/here.md) function.
Loading these packages after loading here masks our
[`here()`](https://here.r-lib.org/dev/reference/here.md) function:

``` r
library(plyr)
#> 
#> Attaching package: 'plyr'
#> The following object is masked from 'package:here':
#> 
#>     here
here()
#> Error in `here()`:
#> ! argument "f" is missing, with no default
```

One way to work around this problem is to use
[`here::here()`](https://here.r-lib.org/dev/reference/here.md):

``` r
here::here()
#> [1] "/home/runner/work/_temp/Library/here/demo-project"
```

The conflicted package offers an alternative: it detects that
[`here()`](https://here.r-lib.org/dev/reference/here.md) is exported
from more than one package and allows you to use neither until you
indicate a preference.

``` r
library(conflicted)
here()
#> Error:
#> ! [conflicted] here found in 2 packages.
#> Either pick the one you want with `::`:
#> • plyr::here
#> • here::here
#> Or declare a preference with `conflicts_prefer()`:
#> • `conflicts_prefer(plyr::here)`
#> • `conflicts_prefer(here::here)`

conflicted::conflict_prefer("here", "here")
#> [conflicted] Will prefer here::here over
#> any other package.
here()
#> [1] "/home/runner/work/_temp/Library/here/demo-project"
```

### Specify a unique identifier

To eliminate potential confusion,
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) accepts a
`uuid` argument. The idea is that each script and report calls
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) very
early (in the first 100 lines) with a universally unique identifier.
Even if a file location is reused across projects (e.g. two projects
contain a “prepare/data.R” file), the files can be identified correctly
if the `uuid` argument in the
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) call is
different.

If a `uuid` argument is passed to
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md):

- a project root that contains a file at the specified file path is
  searched
- the first 100 lines of that file are read
- for the correct file, the
  [`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) call
  that passes this very `uuid` is among those 100 lines, and will be
  matched
- for the wrong file, `uuid` is not found in the text

Use
[`uuid::UUIDgenerate()`](https://rdrr.io/pkg/uuid/man/UUIDgenerate.html)
to create universally unique identifiers:

``` r
uuid::UUIDgenerate()
#> [1] "b25dc80c-7dd3-4c31-9a3a-411da3e1af60"
```

Ensure that the `uuid` arguments are actually unique across your files!
In the future, a helper function will assist with installing and
updating suitably formatted
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) calls in
your scripts and reports.

## Beyond here

### Change project root

It is advisable to [start a fresh R
session](https://rstats.wtf/source-and-blank-slates) as often as
possible, especially before focusing on another project. There still may
be legitimate cases when it is desirable to reset the project root.

To start, let’s create a temporary project for demonstration:

``` r
temp_project_path <- tempfile()
dir.create(temp_project_path)
scripts_path <- file.path(temp_project_path, "scripts")
dir.create(scripts_path)
script_path <- file.path(scripts_path, "script.R")
writeLines(
  c(
    'here::i_am("scripts/script.R")',
    'print("Hello, world!")'
  ),
  script_path
)
fs::dir_tree(temp_project_path)
#> /tmp/RtmpgHrWFq/file293520e48438
#> └── scripts
#>     └── script.R
writeLines(readLines(script_path))
#> here::i_am("scripts/script.R")
#> print("Hello, world!")
```

The `script.R` file contains a call to
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) to
declare its location. Running it from the current working directory will
fail:

``` r
source(script_path, echo = TRUE)
#> 
#> > here::i_am("scripts/script.R")
#> Error:
#> ! Could not find associated project in working directory or any parent directory.
#> - Path in project: scripts/script.R
#> - Current working directory: /home/runner/work/_temp/Library/here/demo-project
#> Please open the project associated with this file and try again.
```

To reset the project root mid-session, change the working directory with
[`setwd()`](https://rdrr.io/r/base/getwd.html). Now, the subsequent call
to [`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) from
within `script.R` works:

``` r
setwd(temp_project_path)
```

``` r
source(script_path, echo = TRUE)
#> 
#> > here::i_am("scripts/script.R")
#> here() starts at /tmp/RtmpgHrWFq/file293520e48438
#> 
#> > print("Hello, world!")
#> [1] "Hello, world!"
```

To reiterate: a fresh session is almost always the better, cleaner,
safer, and more robust solution. Use this approach only as a last
resort.

### Under the hood: rprojroot

The here package has a very simple and restricted interface, by design.
The underlying logic is provided by the much more powerful rprojroot
package. If the default behavior of here does not suit your workflow for
one reason or another, the rprojroot package may be a better
alternative. It is also recommended to import rprojroot and not here
from other packages.

The following example shows how to find an RStudio project starting from
a directory:

``` r
library(rprojroot)
find_root(is_rstudio_project, file.path(project_path, "analysis"))
#> [1] "/home/runner/work/_temp/Library/here/demo-project"
```

Arbitrary criteria can be defined. See
[`vignette("rprojroot", package = "rprojroot")`](https://rprojroot.r-lib.org/articles/rprojroot.html)
for an introduction.

------------------------------------------------------------------------

1.  Prior to version 1.0.0, it was recommended to attach the here
    package via [`library(here)`](https://here.r-lib.org/). This still
    works, but is no longer the recommended approach.

2.  [`library(here)`](https://here.r-lib.org/) no longer emits an
    informative message if
    [`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) has
    been called before.

3.  [`library(here)`](https://here.r-lib.org/) emits a message that may
    be confusing if followed by the message from
    [`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md).
