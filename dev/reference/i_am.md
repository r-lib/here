# Declare location of current script or report

Add a call to `here::i_am("<project-relative path>.<ext>")` at the top
of your R script or in the first chunk of your rmarkdown document. This
ensures that the project root is set up correctly: subsequent calls to
[`here()`](https://here.r-lib.org/dev/reference/here.md) will refer to
the implied project root. If the current working directory is outside of
the project where the script or report is intended to run, it will fail
with a descriptive message.

## Usage

``` r
i_am(path, ..., uuid = NULL)
```

## Arguments

- path:

  `[character(1)]`  
  The path to the current script or report, relative to the project
  root. Passing an absolute path raises an error.

- ...:

  Must be empty, reserved for future use.

- uuid:

  `[character(1)]`  
  **\[experimental\]**

  If not `NULL`, a unique string that is matched against the first 100
  lines of the file. Use
  [`uuid::UUIDgenerate()`](https://rdrr.io/pkg/uuid/man/UUIDgenerate.html)
  to create a unique string that can be used as a `uuid` argument.

## Value

This function is called for its side effects.

## Details

Relying on the project root determined with a project file, the default
for versions prior to 1.0.0, only weakly protects against running a
script from an arbitrary directory outside the intended project. The
`i_am()` function offers a stronger way to define the project root: it
will ensure that the project root actually contains a file in that
location, optionally checking for file contents that uniquely identify
the file via the `nonce` argument.

This function will fail if the script or report is moved within the
project. Update the `i_am()` call to reflect the new location. If you
use the `nonce` argument for extra safety, be sure to change it when you
save an existing script or report under a new name.

## Examples

``` r
if (FALSE) { # \dontrun{
here::i_am("prepare/penguins.R")
here::i_am("analysis/report.Rmd", uuid = "f9e884084b84794d762a535f3facec85")
} # }
```
