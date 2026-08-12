#' @export
use_here <- function() {
  # get the working directory
  # used here::: just to test
  wd <- .root_env$root$wd
  # get the R(md) files in the folder tree
  files <- list.files(wd, pattern = "\\.R(md)?$", ignore.case = TRUE, recursive = TRUE)
  # if it's an R package remove the files in the R/ directory
  # and the ones in the test directory
  is_pkg <- tryCatch(
    {
      is_r_package$make_fix_file()
      TRUE
    },
    error = function(...) FALSE
  )
  if (is_pkg) {
    files <- files[!grepl("^(R|tests|vignettes)", files)]
  }
  # get the files that were modified

  invisible(map_chr(files, prepend_i_am))
}

prepend_i_am <- function(x) {
  is_rmarkdown <- grepl("\\.Rmd$", x, ignore.case = TRUE)
  # read the lines
  lines <- readLines(x)
  # check if a here::i_am call is made
  has_i_am <- grepl("here::i_am\\(.+?\\)", lines)
  # generate the i_am call
  here_string <- sprintf('here::i_am("%s", uuid = "%s")', x, uuid::UUIDgenerate())
  if (any(has_i_am)) {
    # get the line of the call
    which(has_i_am)[1] -> line
    # if it's already in the first line return
    if (line == 1) {
      return()
    }
    # grab the here_string defined by the user might not contain a uuid
    here_string <- sub("(here::i_am\\(.+?\\) *;?)", "\\1", lines[line])
    # remove the call
    lines[line] <- sub(here_string, "", lines[line], fixed = TRUE)
  }
  if (is_rmarkdown) {
    # get the first code chunk
    add_here <- grep("``` *\\{ *r.+?\\}", lines, ignore.case = TRUE)[1]
    # if it's already on the first line bail
    if (any(has_i_am) && line == add_here + 1) {
      return()
    }
    # add it directly after the opening of the chunk
    lines <- c(lines[seq_len(add_here)], here_string, lines[-seq_len(add_here)])
  } else {
    # add it to the first line
    lines <- c(here_string, lines)
  }
  # write the modified lines
  writeLines(lines, con = x)
  x
}

