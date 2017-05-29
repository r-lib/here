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
#' @evalRd roxygen2:::full_markdown(format_root_section())
#'
#' @param ... `[character]`\cr
#'   Path components below the project root, can be empty.
#' @export
#' @examples
#' here()
#' \dontrun{here("some/path/below/your/project/root.txt")}
here <- function(...) {
  .root_env$f(...)
}

#' @rdname here
#' @description `dr_here()` shows a message that by default also includes the
#'   reason why `here()` is set to a particular directory.  Use this function
#'   if `here()` gives unexpected results.
#' @param show_reason `[logical(1)]`\cr
#'   Include reason in output of `dr_here()`, defaults to `TRUE`.
#' @export
dr_here <- function(show_reason = TRUE) {
  message(format_dr_here(show_reason = show_reason))
}

format_dr_here <- function(show_reason) {
  paste0(
    "here() starts at ", .root_env$f(),
    if (show_reason) {
      paste0(", because ", format_reason())
    }
  )
}

format_reason <- function() {
  root <- .root_env$f()
  if (any(vapply(.root_env$crit$testfun, function(f) f(root), logical(1L)))) {
    paste0("it ", get_root_desc(.root_env$crit, .root_env$f()))
  } else {
    paste0("none of the following criteria apply for this directory or any of its parents:\n",
           format_root_criteria_items(), "\n",
           "Use set_here() to create a `.here` file")
  }
}

#' @rdname here
#' @description `set_here()` creates an empty file named `.here`, by default
#'   in the current directory.  When `here` encounters such a file, it uses the
#'   directory that contains this file as root.  This is useful if none of the
#'   default criteria apply.
#' @param path `[character(1)]`\cr
#'   Directory where to create `.here` file, defaults to the current directory.
#' @param verbose `[logical(1)]`\cr
#'   Verbose output, defaults to `TRUE`.
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
  tryCatch(
    .root_env$f <- .root_env$crit$make_fix_file(),
    error = function(e) {
      .root_env$f <- from_wd$make_fix_file()
    }
  )
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(format_dr_here(show_reason = FALSE))
}

format_root_section <- function() {
  paste(
    "\\section{Project root}{",
    "Starting with the current working directory during package load time, `here` will walk the directory hierarchy upwards until it finds a directory that satisfies at least one of the following conditions:",
    format_root_criteria_items(),
    "",
    "Once established, the root directory doesn't change during the active R session. `here()` then appends the arguments to the root directory.",
    "}",
    sep = "\n"
  )
}

format_root_criteria_items <- function() {
  paste(format(.root_env$crit)[-1L], collapse = "\n")
}
