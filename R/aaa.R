# nocov start
format_root_section <- function() {
  paste(
    "\\section{Project root}{",
    "The project root is established with a call to [here::i_am()].",
    "Although not recommended, it can be changed by calling `here::i_am()` again.",
    "",
    "In the absence of such a call (e.g. for a new project),",
    "starting with the current working directory during package load time,",
    "the directory hierarchy is walked upwards ",
    "until a directory with at least one of the following conditions is found:",
    format_root_criteria_items(backtick = TRUE),
    "",
    "In either case, `here()` appends its arguments as path components ",
    "to the root directory.",
    "}",
    sep = "\n"
  )
}
# nocov end

format_root_criteria_items <- function(backtick = FALSE) {
  format <- format(.root_env$root$crit)[-1L]
  if (backtick) {
    format <- gsub('"([^"]+)"', "`\\1`", format)
  }
  paste(format, collapse = "\n")
}
