## here 0.0-6 (2017-01-16)

- New `set_here()` function that creates a `.here` file and talks about it by default (#1).
- New `dr_here()`, describes why `here()` has settled for a particular path.
- Recognize projectile projects and VCS roots.
- Using working directory as fallback produces wrong results, reverted.


## here 0.0-5 (2016-10-29)

- `remake` projects are also recognized by default.
- Silently falling back to current working directory if no root found.


## here 0.0-4 (2016-10-29)

- `pkgdown`.


## here 0.0-3 (2016-07-19)

- Install `rprojroot` from GitHub.
- Show message only when attaching.


## here 0.0-2 (2016-07-19)

- Better argument documentation.
- README.


## here 0.0-1 (2016-07-19)

- A single function `here()`
- Uses a fixed root that can be either an RStudio project, or an R package
- The root is established at package loading time, and shown with a message
