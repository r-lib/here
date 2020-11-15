#' Find your files
#'
#' `here()` uses a reasonable heuristics to find your project's files, based on
#' the current working directory at the time when the package is loaded.
#' Use it as a drop-in replacement for [file.path()], it will always locate the
#' files relative to your project root.
#'
#' This package is intended for interactive use only.
#' Use [rprojroot::has_file()] or the other functions in
#' the \pkg{rprojroot} package for more control,
#' or for package development.
#'
#' If `here()` raises an error or otherwise behaves unexpectedly,
#' you may have attached \pkg{plyr} or another package
#' after \pkg{here}.
#' Correct this using
#' [the \pkg{conflicted} package](https://conflicted.r-lib.org/),
#' or use `here::here("data", "df.rda")`.
#'
#' @evalRd roxygen2:::markdown(format_root_section())
#'
#' @param ... `[character]`\cr
#'   Path components below the project root, can be empty.
#'   Each argument should be a string containing one or more
#'   path components separated by a forward slash `"/"`.
#' @export
#' @examples
#' here()
#' \dontrun{
#' here("some", "path", "below", "your", "project", "root.txt")
#' here("some/path/below/your/project/root.txt")
#' }
here <- function(...) {
  .root_env$root$f(...)
}

.root_env <- new.env(parent = emptyenv())

set_root_crit <- function(criterion) {
  .root_env$root$crit <- criterion
}

do_refresh_here <- function(path) {
  tryCatch(
    set_fix_fun(.root_env$root$crit$make_fix_file(path = path), i_am = FALSE),
    error = function(e) {
      set_fix_fun(from_wd$make_fix_file(path = path), i_am = FALSE)
    }
  )
}

set_fix_fun <- function(f, i_am) {
  force(f)
  force(i_am)
  .root_env$root$f <- f
  .root_env$root$wd <- getwd()
  .root_env$root$i_am <- i_am
}
