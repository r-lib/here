#' Unquoted file referencing
#'
#' `there()` is a wrapper for [here::here()] that allows you to reference files
#' relative to the project directory, without needing to quote each argument.
#'
#' @param ... `[character]`\cr
#'   Path components below the project root, can be empty.
#'   Each argument should be a string containing one or more
#'   path components separated by a forward slash `"/"`.
#' @export
#' @examples
#' \dontrun{
#' # Special characters are allowed, but they must be quoted.
#'
#' ## Do this:
#' there(my, project, file1.txt)
#' there("my/project/file1.txt")
#' there(`my/project/file1.txt`)
#' ## Don't do this:
#' there(my/project/file1.txt)
#'
#' ## Do this:
#' there(my, project, "file-2.txt")
#' there(my, project, `file-2.txt`)
#' ## Don't do this:
#' there(my, project, file-2.txt)
#' }
there <- function(...) {
  tmp1 <- tryCatch(
    rlang::ensyms(...),
    error = function(e) NULL
  )
  if (is.null(tmp1)) {
    stop("Error: Characters such as '/', '-' and '~' are allowed,
         but they must be quoted. See `?here::there` for examples.")
  } else {
    return(
      rlang::exec(
        .fn = here::here,
        !!!lapply(
          X = tmp1,
          FUN = rlang::as_string
        )
      )
    )
  }
}
