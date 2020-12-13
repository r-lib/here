local_project()

test_that("i_am() sets the project root", {
  # To reset later on
  local_here(here())
  withr::local_dir(here())

  expect_message(
    here::i_am("prepare/penguins.R", uuid = "115147ca-fedd-42ca-8650-2cb3dad0aebc"),
    "starts at"
  )

  dr <- format_dr_here(show_reason = TRUE)
  dr <- gsub(here(), "<project root>", dr, fixed = TRUE)
  expect_snapshot(writeLines(dr))
})

test_that("i_am() fails with useful message", {
  # To reset later on
  local_here(here())
  withr::local_dir(tempdir())

  expect_snapshot_with_error(
    here::i_am("prepare/penguins.R", uuid = "115147ca-fedd-42ca-8650-2cb3dad0aebc")
  )
})
