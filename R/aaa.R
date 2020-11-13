# nocov start
format_root_section <- function() {
  paste(
    "\\section{Project root}{",
    "Starting with the current working directory during package load time, `here` will walk the directory hierarchy upwards until it finds a directory that satisfies at least one of the following conditions:",
    format_root_criteria_items(),
    "",
    "Once established, the root directory doesn't change during the active R session. `here()` then appends the arguments to the root directory.",
    "}",
    sep = "\n"
  )
}
# nocov end

format_root_criteria_items <- function() {
  paste(format(.root_env$root$crit)[-1L], collapse = "\n")
}
