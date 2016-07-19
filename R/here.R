#' Find your files
#'
#' Uses a reasonable heuristics to find your project's files, based on the
#' current working directory when the package is loaded.
#'
#' @param ... Path components below the project root, can be empty.
#' @export
here <- function(...) {
  .root_env$f(...)
}

.root_env <- new.env(parent = emptyenv())

#' @import rprojroot
.onLoad <- function(libname, pkgname) {
  crit <- is_rstudio_project | is_r_package

  f <- crit$make_fix_file()
  message("here() starts at ", f())
  .root_env$f <- f
}
