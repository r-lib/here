#' @import rprojroot
.onLoad <- function(libname, pkgname) {
  .root_env$crit <- is_here | is_rstudio_project | is_r_package | is_remake_project | is_projectile_project | is_vcs_root
  tryCatch(
    .root_env$f <- .root_env$crit$make_fix_file(),
    error = function(e) {
      .root_env$f <- from_wd$make_fix_file()
    }
  )
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(format_dr_here(show_reason = FALSE))
}
