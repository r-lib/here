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
