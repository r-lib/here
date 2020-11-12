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

#' @rdname here
#' @description
#'   `set_here()` creates an empty file named `.here`, by default
#'   in the current directory.  When `here` encounters such a file, it uses the
#'   directory that contains this file as root.  This is useful if none of the
#'   default criteria apply.  You need to restart the R session so that `here()`
#'   picks up the newly created file.
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
      message(
        "Created file .here in ", path, " . ",
        'Please start a new R session in the new project directory.'
      )
    }
  }

  invisible(file_path)
}
