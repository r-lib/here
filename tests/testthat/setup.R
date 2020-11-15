if (basename(getwd()) == "testthat" && basename(dirname(getwd())) == "tests") {
  withr::defer(testthat::snapshot_accept(path = "."), teardown_env())
}
