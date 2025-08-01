#'
#'
#' @title
#'   Get the relative path to a file
#'   
#' @description
#'   `from_here()` returns the path to a file or directory using `here()`, relative
#'   to a parent directory (by default, the project root).
# 
#' @param .path
#'   The path to the target file or directory.
#'   
#' @param .root
#'   The path to the parent directory. Defaults to project root (`here()`).
#'
#' @importFrom fs path_rel 
#'
#' @export
#'
#' @examples
#'   from_here("an_example.csv")
#'   \dontrun{
#'     myfilepath <- here("some", "path", "below", "your", "project", "root.txt")
#'     >> "parent/path/some/path/below/your/project/root.txt"
#'     myrelfilepath <- from_here(myfilepath)
#'     >> "some/path/below/your/project/root.txt"
#'     myrelfilepath <- from_here(myfilepath, here("some", "path")
#'     >> "below/your/project/root.txt"
#'   }


from_here <- function(.path, .root = here::here()) {
  
  # Using FS
  fs::path_rel(.path, start = .root)
  
  # Using FS logic to retain leading `/`
  #substr(.path, nchar(.root) + 1, nchar(.path))
}


