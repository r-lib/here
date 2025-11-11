# Situation report

`dr_here()` shows a message that by default also includes the reason why
[`here()`](https://here.r-lib.org/dev/reference/here.md) is set to a
particular directory. Use this function if
[`here()`](https://here.r-lib.org/dev/reference/here.md) gives
unexpected results.

## Usage

``` r
dr_here(show_reason = TRUE)
```

## Arguments

- show_reason:

  `[logical(1)]`  
  Include reason in output of `dr_here()`, defaults to `TRUE`.

## Examples

``` r
dr_here()
#> here() starts at /home/runner/work/here/here.
#> - This directory contains a file matching '[.]Rproj$' with contents matching '^Version: ' in the first line
#> - Initial working directory: /home/runner/work/here/here
#> - Current working directory: /tmp/RtmpuphKpD/file2ea251b82e79/dev/reference
```
