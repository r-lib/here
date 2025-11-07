# Find your files

`here()` uses reasonable heuristics to find your project's files, based
on the current working directory at the time when the package is loaded.
Use it as a drop-in replacement for
[`file.path()`](https://rdrr.io/r/base/file.path.html), it will always
locate the files relative to your project root.

## Usage

``` r
here(...)
```

## Arguments

- ...:

  `[character]`  
  Path components below the project root, can be empty. Each argument
  should be a string containing one or more path components separated by
  a forward slash `"/"`.

## Details

This package is intended for interactive use only. Use
[`rprojroot::has_file()`](https://rprojroot.r-lib.org/reference/root_criterion.html)
or the other functions in the rprojroot package for more control, or for
package development.

If `here()` raises an error or otherwise behaves unexpectedly, you may
have attached plyr or another package after here. Correct this using
[the conflicted package](https://conflicted.r-lib.org/), or use
`here::here("data", "df.rda")`.

## Project root

The project root is established with a call to
`here::`[`i_am()`](https://here.r-lib.org/dev/reference/i_am.md).
Although not recommended, it can be changed by calling
[`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md) again.

In the absence of such a call (e.g. for a new project), starting with
the current working directory during package load time, the directory
hierarchy is walked upwards until a directory with at least one of the
following conditions is found:

- contains a file `.here`

- contains a file matching `[.]Rproj$` with contents matching
  `^Version: ` in the first line

- contains a file `.vscode/settings.json`

- contains a file `_quarto.yml`

- contains a file `renv.lock` with contents matching `"Packages":\s*\{`

- contains a file `DESCRIPTION` with contents matching `^Package: `

- contains a file `remake.yml`

- contains a file `.projectile`

- contains a directory `.git`

- contains a file `.git` with contents matching `^gitdir: `

- contains a directory `.svn`

In either case, `here()` appends its arguments as path components to the
root directory.

## Examples

``` r
here()
#> [1] "/home/runner/work/here/here"
if (FALSE) { # \dontrun{
here("some", "path", "below", "your", "project", "root.txt")
here("some/path/below/your/project/root.txt")
} # }
```
