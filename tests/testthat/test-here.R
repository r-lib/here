local_project()

test_that("here() finds files", {
  expect_true(file.exists(here("analysis/report.Rmd")))
})
