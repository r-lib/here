# nocov start
#' @import rprojroot
.onLoad <- function(libname, pkgname) {
  criteria <- getOption("here.criteria", default = default_criteria())
  set_root_crit(resolve_criteria(criteria))
  do_refresh_here(".")
}
# nocov end

.onAttach <- function(libname, pkgname) {
  if (!isTRUE(.root_env$root$i_am)) {
    packageStartupMessage(format_dr_here(show_reason = FALSE))
  }
}
