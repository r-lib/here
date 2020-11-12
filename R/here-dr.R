format_dr_here <- function(show_reason) {
  paste0(
    "here() starts at ", .root_env$f(),
    if (show_reason) {
      paste0(".\nThis directory ", format_reason())
    }
  )
}

format_reason <- function() {
  root <- .root_env$f()
  if (any(vapply(.root_env$crit$testfun, function(f) f(root), logical(1L)))) {
    paste0("it ", get_root_desc(.root_env$crit, .root_env$f()))
  } else {
    paste0(
      "and its parents do not satisfy any of the following criteria:\n",
      format_root_criteria_items(), "\n",
      "Use set_here() to create a `.here` file"
    )
  }
}
