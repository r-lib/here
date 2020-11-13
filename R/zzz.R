#' @import rprojroot
.onLoad <- function(libname, pkgname) {
  .root_env$crit <- is_here | is_rstudio_project | is_r_package | is_remake_project | is_projectile_project | is_vcs_root
  do_refresh_here(".")
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(format_dr_here(show_reason = FALSE))
}
