# here 0.1.11.9003 (2020-11-15)

- `dr_here()` shows the initial and current working directory (#18).
- `set_here()` is superseded (#61).
- New `here::i_am()` offers a new recommended way to declare the project root. Instead of relying on special files or directories that indicate the project root, each script and report now can declare its own location relative to the project root (#27).


# here 0.1.11.9002 (2020-11-13)

- Add testthat tests (#57).


# here 0.1.11.9001 (2020-11-13)

- Extend "Getting started" vignette with a detailed description of the behavior and use cases (#55).
- New "rmarkdown" vignette (#55).
- Tweak message in `dr_here()` (#55).
- Use GitHub Actions (#52).


# here 0.1.11.9000 (2020-11-10)

- Re-license as MIT (#50).

- Update documentation to address conflict with `lubridate::here()` (#37, @nzgwynn).

- Improve readme and add getting started vignette (#44, @sharlagelfand).

- Added Jennifer Bryan as contributor (#32).


## here 0.1-11 (2018-02-01)

- Updated documentation and success message for `set_here()`, now suggests to restart the R session (#12).


## here 0.1-10 (2017-12-14)

- More explicit documentation for the `...` argument to `here()` (#7).


# here 0.1 (2017-01-25)

Initial CRAN release.

- Main function `here()`
    - Uses a fixed root that contains a `.here` file or can be either an RStudio project, an R package, a `remake` project, a Projectile project, or a VCS repository.
    - The root is established at package loading time, and shown with a message.
    - The current working directory is used as a fallback.
- The `set_here()` function creates a `.here` file so that a directory is recognized as root by `here()`.
- The `dr_here()` function explains the reasoning of `here()` for the current session.
