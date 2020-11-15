local_project()

test_that("dr_here() shows message", {
  expect_message(dr_here(), "starts at")
})

test_that("format_dr_here(show_reason = TRUE)", {
  dr <- format_dr_here(show_reason = TRUE)
  dr <- gsub(here(), "<project root>", dr, fixed = TRUE)
  dr <- gsub(getwd(), "<working directory>", dr, fixed = TRUE)
  expect_snapshot(writeLines(dr))
})

test_that("format_dr_here(show_reason = FALSE)", {
  dr <- format_dr_here(show_reason = FALSE)
  dr <- gsub(here(), "<project root>", dr, fixed = TRUE)
  expect_snapshot(writeLines(dr))
})

test_that("format_dr_here() without root", {
  local_here(tempdir())

  dr <- format_dr_here(show_reason = TRUE)
  dr <- gsub(here(), "<project root>", dr, fixed = TRUE)
  dr <- gsub(getwd(), "<working directory>", dr, fixed = TRUE)
  expect_snapshot(writeLines(dr))
})
