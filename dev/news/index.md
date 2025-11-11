# Changelog

## here 1.0.2.9002 (2025-11-10)

### Continuous integration

- Use workflows for fledge
  ([\#156](https://github.com/r-lib/here/issues/156)).

## here 1.0.2.9001 (2025-11-08)

### Continuous integration

- Sync ([\#154](https://github.com/r-lib/here/issues/154)).

## here 1.0.2.9000 (2025-09-15)

### fledge

- CRAN release v1.0.2
  ([\#149](https://github.com/r-lib/here/issues/149)).

## here 1.0.2 (2025-09-14)

CRAN release: 2025-09-15

### Features

- Discover VS Code, Quarto and renv projects
  ([\#128](https://github.com/r-lib/here/issues/128),
  [\#130](https://github.com/r-lib/here/issues/130)).

### Chore

- Change maintainer e-mail.

### Documentation

- Fix link to “What they forgot” chapter
  ([@Masterxilo](https://github.com/Masterxilo),
  [\#101](https://github.com/r-lib/here/issues/101)).

- Fixed “heuristics” typo ([@t-gummer](https://github.com/t-gummer),
  [\#91](https://github.com/r-lib/here/issues/91)).

## here 1.0.1 (2020-12-13)

CRAN release: 2020-12-13

- Adapt to testthat 3.0.1.

## here 1.0.0 (2020-11-15)

CRAN release: 2020-11-15

### Features

- New [`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md)
  offers a new recommended way to declare the project root. Instead of
  relying on special files or directories that indicate the project
  root, each script and report now can declare its own location relative
  to the project root ([\#27](https://github.com/r-lib/here/issues/27)).
- [`dr_here()`](https://here.r-lib.org/dev/reference/dr_here.md) shows
  the initial and current working directory
  ([\#18](https://github.com/r-lib/here/issues/18),
  [\#55](https://github.com/r-lib/here/issues/55)).

### Documentation

- Improve readme and add “Getting started” vignette
  ([\#44](https://github.com/r-lib/here/issues/44),
  [@sharlagelfand](https://github.com/sharlagelfand)). Extend “Getting
  started” vignette with a detailed description of the behavior and use
  cases ([\#55](https://github.com/r-lib/here/issues/55)).
- Update [`?here`](https://here.r-lib.org/dev/reference/here.md) to
  address conflict with `lubridate::here()`
  ([\#37](https://github.com/r-lib/here/issues/37),
  [@nzgwynn](https://github.com/nzgwynn)).
- New “rmarkdown” vignette
  ([\#55](https://github.com/r-lib/here/issues/55)).
- [`set_here()`](https://here.r-lib.org/dev/reference/set_here.md) is
  superseded in favor of
  [`here::i_am()`](https://here.r-lib.org/dev/reference/i_am.md)
  ([\#61](https://github.com/r-lib/here/issues/61)).
- More explicit documentation for the `...` argument to
  [`here()`](https://here.r-lib.org/dev/reference/here.md)
  ([\#7](https://github.com/r-lib/here/issues/7)).

### Internal

- Add testthat tests ([\#57](https://github.com/r-lib/here/issues/57)).
- Use GitHub Actions for checks
  ([\#52](https://github.com/r-lib/here/issues/52)).
- Requires rprojroot \>= 2.0.1.
- Re-license as MIT ([\#50](https://github.com/r-lib/here/issues/50)).
- Added Jennifer Bryan as contributor
  ([\#32](https://github.com/r-lib/here/issues/32)).

## here 0.1 (2017-01-25)

CRAN release: 2017-05-28

Initial CRAN release.

- Main function [`here()`](https://here.r-lib.org/dev/reference/here.md)
  - Uses a fixed root that contains a `.here` file or can be either an
    RStudio project, an R package, a `remake` project, a Projectile
    project, or a VCS repository.
  - The root is established at package loading time, and shown with a
    message.
  - The current working directory is used as a fallback.
- The [`set_here()`](https://here.r-lib.org/dev/reference/set_here.md)
  function creates a `.here` file so that a directory is recognized as
  root by [`here()`](https://here.r-lib.org/dev/reference/here.md).
- The [`dr_here()`](https://here.r-lib.org/dev/reference/dr_here.md)
  function explains the reasoning of
  [`here()`](https://here.r-lib.org/dev/reference/here.md) for the
  current session.
