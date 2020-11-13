test_that("set_here() creates file", {
  local_project()

  expect_message(set_here(path = here()), "[Cc]reated file")
  expect_true(file.exists(here(".here")))
  expect_message(set_here(path = here()), "already exists")
})
