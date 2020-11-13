#' Declare location of current script or notebook
#'
#' Add a call to `here::i_am("<project-relative path>.<ext>")`
#' at the top of your R script or in the first chunk of your rmarkdown document.
#' This ensures that the project root is set up correctly:
#' subsequent calls to `here()` will refer to the implied project root.
#' If the current working directory is outside of the project
#' where the script or notebook is intended to run, it will fail
#' with a descriptive message.
#'
#' Relying on the project root determined with a project file,
#' the default for versions prior to 1.0.0,
#' only weakly protects against running a script from an arbitrary directory
#' outside the intended project.
#' The `i_am()` function offers a stronger way to define the project root:
#' it will ensure that the project root actually contains a file in that location,
#' optionally checking for file contents that uniquely identify the file
#' via the `nonce` argument.
#'
#' This function will fail if the script or report is moved within the project.
#' Update the `i_am()` call to reflect the new location.
#' If you use the `nonce` argument for extra safety, be sure to change it
#' when you save an existing script or report under a new name.
#'
#' @param path `[character(1)]`\cr
#'   The path to the current script or report, relative to the project root.
#'   Passing an absolute path raises an error.
#' @param contents `[character(1)]`\cr
#'   If not `NULL`, a regular expression that is matched
#'   against the first 100 lines of the file.
#'   For a string of letters and digits and perhaps dashes,
#'   `contents` will match the call to `i_am()` itself.
#'   Use [uuid::UUIDgenerate()] to create a unique string
#'   that can be used as argument to `contents`.
#'
#' @return This function is called for its side effects.
#' @export
#' @examples
#' \dontrun{
#' here::i_am("prepare/penguins.R")
#' here::i_am("analysis/report.Rmd", nonce = "f9e884084b84794d762a535f3facec85")
#' }
i_am <- function(path, contents = NULL) {
  criterion <- has_file(path, contents)
  tryCatch(
    root_fun <- criterion$make_fix_file(),
    error = function(e) {
      stop(
        "Could not find associated project in working directory or any parent directory.\n",
        "- Path in project: ", path, "\n",
        if (!is.null(contents)) {
          paste0("- File contents matching: ", contents, "\n")
        },
        "- Current working directory: ", getwd(), "\n",
        "Please open the project associated with this file and try again.",
        call. = FALSE
      )
    }
  )

  set_root_crit(criterion)
  set_fix_fun(root_fun)
  dr_here(show_reason = FALSE)
  invisible()
}
