#' Find your files
#'
#' Uses a reasonable heuristics to find your project's files, based on the
#' current working directory when the package is loaded.
#' Use [rprojroot::has_file()] or the other functions in
#' the \pkg{rprojroot} package for more control.
#'
#' @param ... \code{[character]}\cr
#'   Path components below the project root, can be empty.
#' @export
#' @examples
#' here()
here <- function(...) {
  .root_env$f(...)
}

.root_env <- new.env(parent = emptyenv())

#' @import rprojroot
.onLoad <- function(libname, pkgname) {
  .root_env$crit <- is_rstudio_project | is_r_package | is_remake_project
  .root_env$f <- .root_env$crit$make_fix_file()
}

.onAttach <- function(libname, pkgname) {
  root <- .root_env$f()
  packageStartupMessage("here() starts at ", root)
}
