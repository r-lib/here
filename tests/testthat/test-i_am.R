local_project()

test_that("i_am() sets the project root", {
  withr::local_dir(here())
  local_here(".")

  expect_message(
    here::i_am("prepare/penguins.R", "115147ca-fedd-42ca-8650-2cb3dad0aebc"),
    "starts at"
  )

  dr <- format_dr_here(show_reason = TRUE)
  dr <- gsub(here(), "<project root>", dr, fixed = TRUE)
  expect_snapshot(writeLines(dr))
})
