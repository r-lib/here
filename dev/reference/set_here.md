# Add a marker file to a project

**\[superseded\]**

## Usage

``` r
set_here(path = ".", verbose = TRUE)
```

## Arguments

- path:

  `[character(1)]`  
  Directory where to create `.here` file, defaults to the current
  directory.

- verbose:

  `[logical(1)]`  
  Verbose output, defaults to `TRUE`.

## Details

`set_here()` creates an empty file named `.here`, by default in the
current directory. When here encounters such a file, it uses the
directory that contains this file as root. This is useful if none of the
default criteria apply. You need to restart the R session so that
[`here()`](https://here.r-lib.org/dev/reference/here.md) picks up the
newly created file.

## Life cycle

`set_here()` should no longer be necessary if all scripts and reports in
a project call [`i_am()`](https://here.r-lib.org/dev/reference/i_am.md),
which is now the recommended workflow for declaring the project root.
