test_that("default_criteria() returns expected names", {
  dc <- default_criteria()
  expect_type(dc, "character")
  expect_true(length(dc) > 0)
  expect_true("is_here" %in% dc)
  expect_true("is_rstudio_project" %in% dc)
  expect_true("is_quarto_project" %in% dc)
  expect_true("is_vcs_root" %in% dc)
})

test_that("resolve_criteria() works with character vector", {
  crit <- resolve_criteria(c("is_here", "is_vcs_root"))
  expect_true(is_root_criterion(crit))
})

test_that("resolve_criteria() works with root_criterion object", {
  crit <- resolve_criteria(is_rstudio_project | is_vcs_root)
  expect_true(is_root_criterion(crit))
})

test_that("resolve_criteria() errors on empty character", {
  expect_error(resolve_criteria(character(0)), "At least one criterion")
})

test_that("resolve_criteria() errors on unknown name", {
  expect_error(resolve_criteria("not_a_real_criterion"), "Unknown criterion")
})

test_that("resolve_criteria() errors on invalid type", {
  expect_error(resolve_criteria(42), "character vector")
})

test_that("use_criteria() works with character vector", {
  local_project()
  local_here(here())

  expect_message(
    use_criteria(c("is_here", "is_rstudio_project", "is_vcs_root")),
    "starts at"
  )
})

test_that("use_criteria() works with root_criterion object", {
  local_project()
  local_here(here())

  expect_message(
    use_criteria(is_rstudio_project | is_vcs_root),
    "starts at"
  )
})

test_that("use_criteria() excludes quarto correctly", {
  skip_if_not_installed("withr")

  # Create a temp dir with both .git and a nested quarto project
  tmpdir <- tempfile("here_test")
  dir.create(tmpdir)
  dir.create(file.path(tmpdir, ".git"))
  website_dir <- file.path(tmpdir, "website")
  dir.create(website_dir)
  writeLines("project:", file.path(website_dir, "_quarto.yml"))
  withr::defer(unlink(tmpdir, recursive = TRUE))

  # With default criteria, from website dir, root should be website/
  crit_default <- resolve_criteria(default_criteria())
  withr::with_dir(website_dir, {
    root_default <- crit_default$find_file(path = ".")
    expect_equal(normalizePath(root_default), normalizePath(website_dir))
  })

  # Without quarto, from website dir, root should be parent
  crit_no_quarto <- resolve_criteria(setdiff(default_criteria(), "is_quarto_project"))
  withr::with_dir(website_dir, {
    root_no_quarto <- crit_no_quarto$find_file(path = ".")
    expect_equal(normalizePath(root_no_quarto), normalizePath(tmpdir))
  })
})
