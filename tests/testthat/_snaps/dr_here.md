# format_dr_here(show_reason = TRUE)

    Code
      writeLines(dr)
    Output
      here() starts at <project root>.
      - This directory contains a file matching "[.]Rproj$" with contents matching "^Version: " in the first line
      - Initial working directory: <working directory>
      - Current working directory: <working directory>

# format_dr_here(show_reason = FALSE)

    Code
      writeLines(dr)
    Output
      here() starts at <project root>

# format_dr_here() without root

    Code
      writeLines(dr)
    Output
      here() starts at <project root>.
      - This directory and its parents do not satisfy any of the following criteria:
        - contains a file ".here"
        - contains a file matching "[.]Rproj$" with contents matching "^Version: " in the first line
        - contains a file "DESCRIPTION" with contents matching "^Package: "
        - contains a file "remake.yml"
        - contains a file ".projectile"
        - contains a directory ".git"
        - contains a file ".git" with contents matching "^gitdir: "
        - contains a directory ".svn"
      ! Call `here::i_am()` in your scripts and reports, or use `set_here()` to create a `.here` file
      - Initial working directory: <working directory>
      - Current working directory: <working directory>

