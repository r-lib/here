local_project()

test_that("there() finds files", {
  expect_true(
    all(
      file.exists(there(analysis, report.Rmd)),
      file.exists(there(`analysis/report.Rmd`)),
      file.exists(there("analysis/report.Rmd"))
    )
  )
})
