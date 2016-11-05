after_success <- list(
  step(task_hello_world),
  step(task_run_covr)
)

deploy <- list(
  step(task_build_pkgdown, on_branch = "production", on_env = "BUILD_PKGDOWN"),
  step(task_test_ssh),
  step(task_push_deploy, path = "docs", branch = "gh-pages", on_branch = "production", on_env = "BUILD_PKGDOWN")
)
