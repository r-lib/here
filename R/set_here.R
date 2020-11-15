#' Add a marker file to a project
#'
#' `r lifecycle::badge("superseded")`
#'
#' `set_here()` creates an empty file named `.here`, by default
#' in the current directory.
#' When here encounters such a file, it uses the
#' directory that contains this file as root.
#' This is useful if none of the default criteria apply.
#' You need to restart the R session so that `here()`
#' picks up the newly created file.
#'
#' @section Life cycle:
#' `set_here()` should no longer be necessary
#' if all scripts and reports in a project call [here::i_am()],
#' which is now the recommended workflow for declaring the project root.
#'
#' @keywords internal
#'
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
        "Please start a new R session in the new project directory."
      )
    }
  }

  invisible(file_path)
}

is_here <- has_file(".here")
