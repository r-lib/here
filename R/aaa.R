# nocov start
format_root_section <- function() {
  paste(
    "\\section{Project root}{",
    "The project root is established with a call to `here::`[here::i_am()].",
    "Although not recommended, it can be changed by calling `here::i_am()` again.",
    "",
    "In the absence of such a call (e.g. for a new project),",
    "starting with the current working directory during package load time,",
    "the directory hierarchy is walked upwards ",
    "until a directory with at least one of the following conditions is found:",
    gsub('"([^"]+)"', "`\\1`", format_root_criteria_items()),
    "",
    "In either case, `here()` appends its arguments as path components ",
    "to the root directory.",
    "}",
    sep = "\n"
  )
}
# nocov end

format_root_criteria_items <- function(indent = 0) {
  format <- format(.root_env$root$crit)[-1L]
  format <- paste0(strrep(" ", indent), format)
  paste(format, collapse = "\n")
}
