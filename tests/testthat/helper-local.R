local_project <- function(..., .env = parent.frame()) {
  skip_if_not_installed("withr")

  path <- tempfile()
  dir.create(path)

  demo_path <- system.file("demo-project", package = "here")
  demo_files <- dir(demo_path, full.names = TRUE)
  file.copy(demo_files, path, recursive = TRUE)

  local_here(path, .env = .env)

  withr::defer(unlink(path, recursive = TRUE), .env)
  path
}

local_here <- function(path, ..., .env = parent.frame()) {
  old_root <- .root_env
  do_refresh_here(path)
  withr::defer(.root_env$root <- old_root, envir = .env)
  invisible()
}
