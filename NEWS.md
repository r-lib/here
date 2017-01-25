# here 0.1 (2017-01-25)

Initial CRAN release.

- Main function `here()`
    - Uses a fixed root that contains a `.here` file or can be either an RStudio project, an R package, a `remake` project, a Projectile project, or a VCS repository.
    - The root is established at package loading time, and shown with a message.
    - The current working directory is used as a fallback.
- The `set_here()` function creates a `.here` file so that a directory is recognized as root by `here()`.
- The `dr_here()` function explains the reasoning of `here()` for the current session.
