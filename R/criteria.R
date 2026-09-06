#' Customize root-finding criteria
#'
#' `use_criteria()` allows customizing which root-finding criteria are used
#' by [here()] to determine the project root.
#' This is useful when the default set of criteria detects a false positive,
#' e.g. a nested Quarto project or RStudio project that should not be
#' treated as the project root.
#'
#' @param criteria `[root_criterion]` or `[character]`\cr
#'   Either a [rprojroot::root_criterion] object,
#'   or a character vector of criterion names.
#'   Supported names include `"is_here"` and all names in
#'   [rprojroot::criteria], such as
#'   `"is_rstudio_project"`, `"is_r_package"`,
#'   `"is_quarto_project"`, `"is_vcs_root"`, etc.
#'   Use [default_criteria()] to retrieve the default criteria.
#'
#' @details
#' By default, the [here()] package uses a set of criteria
#' that covers the most common project types.
#' Use `use_criteria()` to change the criteria after loading the package.
#'
#' To configure the criteria before the package is loaded,
#' set the `"here.criteria"` option to a character vector
#' or a [rprojroot::root_criterion] object.
#'
#' @seealso [default_criteria()], [here()], [dr_here()]
#' @return This function is called for its side effects.
#' @export
#' @examples
#' \dontrun{
#' # Use only VCS-related and .here file criteria
#' use_criteria(c("is_here", "is_vcs_root"))
#'
#' # Exclude Quarto detection from the defaults
#' use_criteria(setdiff(default_criteria(), "is_quarto_project"))
#'
#' # Pass a root_criterion object directly
#' use_criteria(rprojroot::is_rstudio_project | rprojroot::is_vcs_root)
#'
#' # Reset to defaults
#' use_criteria(default_criteria())
#'
#' # Set via option (before loading the package)
#' options(here.criteria = c("is_here", "is_rstudio_project", "is_vcs_root"))
#' }
use_criteria <- function(criteria) {
  crit <- resolve_criteria(criteria)
  set_root_crit(crit)
  do_refresh_here(".")
  dr_here(show_reason = FALSE)
  invisible()
}

#' Default root-finding criteria
#'
#' `default_criteria()` returns the names of the root-finding criteria
#' used by default.
#' The returned value can be customized by removing elements
#' and passing the result to [use_criteria()].
#'
#' @return A character vector of criterion names.
#' @seealso [use_criteria()], [here()], [dr_here()]
#' @export
#' @examples
#' default_criteria()
#' setdiff(default_criteria(), "is_quarto_project")
default_criteria <- function() {
  .default_criteria_names
}

.default_criteria_names <- c(
  "is_here",
  "is_rstudio_project",
  "is_vscode_project",
  "is_quarto_project",
  "is_renv_project",
  "is_r_package",
  "is_remake_project",
  "is_projectile_project",
  "is_vcs_root"
)

resolve_criteria <- function(criteria) {
  if (is_root_criterion(criteria)) {
    return(criteria)
  }

  if (is.character(criteria)) {
    if (length(criteria) == 0) {
      stop("At least one criterion must be provided.", call. = FALSE)
    }
    return(names_to_criterion(criteria))
  }

  stop(
    "`criteria` must be a character vector of criterion names or a `root_criterion` object.",
    call. = FALSE
  )
}

names_to_criterion <- function(names) {
  crits <- lapply(names, get_criterion_by_name)
  Reduce(`|`, crits)
}

get_criterion_by_name <- function(name) {
  if (identical(name, "is_here")) {
    return(is_here)
  }

  all_criteria <- rprojroot::criteria
  if (name %in% names(all_criteria)) {
    return(all_criteria[[name]])
  }

  stop(
    "Unknown criterion: \"", name, "\".\n",
    "Available criteria: ",
    paste0("\"", c("is_here", names(all_criteria)), "\"", collapse = ", "),
    call. = FALSE
  )
}
