# nocov start
#' @import rprojroot
.onLoad <- function(libname, pkgname) {
  set_root_crit(is_here | is_rstudio_project | is_r_package | is_remake_project | is_projectile_project | is_vcs_root)
  do_refresh_here(".")
}
# nocov end

.onAttach <- function(libname, pkgname) {
  if (!isTRUE(.root_env$root$i_am)) {
    packageStartupMessage(format_dr_here(show_reason = FALSE))
  }
}
