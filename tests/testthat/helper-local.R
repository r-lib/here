local_project <- function(..., .env = parent.frame()) {
  path <- tempfile()
  dir.create(path)

  file.copy(
    dir(system.file("demo-project", package = "here"), full.names = TRUE),
    path,
    recursive = TRUE
  )

  local_here(path, .env = .env)

  withr::defer(unlink(path, recursive = TRUE), .env)
  path
}

local_here <- function(path, ..., .env = parent.frame()) {
  old_here <- here()
  do_refresh_here(path)
  withr::defer(do_refresh_here(old_here), .env)
  invisible()
}
