local_project <- function(.env = parent.frame()) {
  path <- tempfile()
  dir.create(path)
  file.copy(
    dir(system.file("demo-project", package = "here"), full.names = TRUE),
    path,
    recursive = TRUE
  )

  do_refresh_here(path)

  withr::defer(do_refresh_here("."), .env)
  withr::defer(unlink(path, recursive = TRUE), .env)
  path
}
