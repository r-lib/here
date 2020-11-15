#' Situation report
#'
#' `dr_here()` shows a message that by default also includes the
#' reason why `here()` is set to a particular directory.
#' Use this function if `here()` gives unexpected results.
#' @param show_reason `[logical(1)]`\cr
#'   Include reason in output of `dr_here()`, defaults to `TRUE`.
#' @export
#' @examples
#' dr_here()
dr_here <- function(show_reason = TRUE) {
  message(format_dr_here(show_reason = show_reason))
}

format_dr_here <- function(show_reason) {
  paste0(
    "here() starts at ", here(),
    if (show_reason) {
      paste0(
        ".",
        "\n- This directory ", format_reason(),
        "\n- Initial working directory: ", .root_env$root$wd,
        "\n- Current working directory: ", getwd(),
        NULL
      )
    }
  )
}

format_reason <- function() {
  root <- .root_env$root$f()
  if (any(vapply(.root_env$root$crit$testfun, function(f) f(root), logical(1L)))) {
    get_root_desc(.root_env$root$crit, .root_env$root$f())
  } else {
    paste0(
      "and its parents do not satisfy any of the following criteria:\n",
      format_root_criteria_items(indent = 2), "\n",
      "! Call `here::i_am()` in your scripts and reports, or use `set_here()` to create a `.here` file"
    )
  }
}
