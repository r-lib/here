#' Find your files
#'
#' `here()` uses a reasonable heuristics to find your project's files, based on
#' the current working directory when the package is loaded.
#' Intended for interactive use only.
#' Use [rprojroot::has_file()] or the other functions in
#' the \pkg{rprojroot} package for more control,
#' or for package development.
#'
#' @param ... \code{[character]}\cr
#'   Path components below the project root, can be empty.
#' @export
#' @examples
#' here()
here <- function(...) {
  .root_env$f(...)
}

#' @rdname here
#' @description `dr_here()` shows a message that by default also includes the
#'   reason why `here()` is set to a particular directory.  Use this function
#'   if `here()` gives unexpected results.
#' @param show_reason Include reason in output of `dr_here()`, defaults to
#'   `TRUE`.
#' @export
dr_here <- function(show_reason = TRUE) {
  message(format_dr_here(show_reason = show_reason))
}

format_dr_here <- function(show_reason) {
  root <- .root_env$f()
  paste0(
    "here() starts at ", root,
    if (show_reason) {
      paste0(", because it ", get_root_desc(.root_env$crit, root))
    }
  )
}

#' @rdname here
#' @description `set_here()` creates an empty file named `.here`, by default
#'   in the current directory.  When `here` encounters such a file, it uses the
#'   directory that contains this file as root.  This is useful if none of the
#'   default criteria apply.
#' @export
set_here <- function(path = ".", verbose = TRUE) {
  path <- normalizePath(path)
  file_path <- file.path(path, ".here")

  if (file.exists(file_path)) {
    if (verbose) {
      message("File .here already exists in ", path)
    }
  } else {
    writeLines(character(), file_path)
    if (verbose) {
      message("Created file .here in ", path)
    }
  }

  invisible(file_path)
}

is_here <- has_file(".here")

.root_env <- new.env(parent = emptyenv())

#' @import rprojroot
.onLoad <- function(libname, pkgname) {
  .root_env$crit <- is_here | is_rstudio_project | is_r_package | is_remake_project | is_projectile_project | is_vcs_root
  .root_env$f <- .root_env$crit$make_fix_file()
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(format_dr_here(show_reason = FALSE))
}
