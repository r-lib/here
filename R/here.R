#' Find your files
#'
#' Uses a reasonable heuristics to find your project's files, based on the
#' current working directory when the package is loaded.
#' Use \code{\link[rprojroot]{has_file}} or the other functions in
#' the \pkg{rprojroot} package for more control.
#'
#' @param ... Path components below the project root, can be empty.
#' @export
#' @examples
#' here()
here <- function(...) {
  .root_env$f(...)
}

.root_env <- new.env(parent = emptyenv())

#' @import rprojroot
.onLoad <- function(libname, pkgname) {
  crit <- is_rstudio_project | is_r_package

  f <- crit$make_fix_file()
  packageStartupMessage("here() starts at ", f())
  .root_env$f <- f
}
