# nolint start
{
    if (!"DESCRIPTION" %in% dir()) {
        return(invisible(NULL))
    }
    if (file.exists("man")) {
        return(invisible(NULL))
    }
    if (grepl("/.*[.]Rcheck/00_pkg_src/.*$", normalizePath(getwd(),
        winslash = "/"))) {
        stop("Cannot run this function in R CMD check.")
    }
    message("*** autoroxy: creating documentation")
    if (!requireNamespace("roxygen2")) {
        warning("Cannot load roxygen2. Package documentation will be unavailable.",
            call. = FALSE)
        return(invisible(NULL))
    }
    if (!requireNamespace("devtools")) {
        warning("Cannot load devtools. Package documentation will be unavailable.",
            call. = FALSE)
        return(invisible(NULL))
    }
    dir.create("man")
    devtools::document(roclets = c("rd"))
}
# nolint end
