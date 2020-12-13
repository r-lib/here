expect_snapshot_with_error <- function(code) {
  code <- rlang::enexpr(code)

  if (packageVersion("testthat") > "3.0.0") {
    rlang::eval_tidy(rlang::quo(expect_snapshot(!!code, error = TRUE)))
  } else {
    rlang::eval_tidy(rlang::quo(expect_snapshot(!!code)))
  }
}
