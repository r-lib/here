<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# here 1.0.2 (2025-09-14)

## Features

- Discover VS Code, Quarto and renv projects (#128, #130).

## Chore

- Auto-update from GitHub Actions (#145).

- Auto-update from GitHub Actions.

  Run: https://github.com/r-lib/here/actions/runs/14636203620

  Run: https://github.com/r-lib/here/actions/runs/10425486329

  Run: https://github.com/r-lib/here/actions/runs/10200110394

  Run: https://github.com/r-lib/here/actions/runs/9728440182

  Run: https://github.com/r-lib/here/actions/runs/9691616332

- Add Aviator configuration.

- Change maintainer e-mail.

## Continuous integration

- Use reviewdog for external PRs (#147).

- Cleanup and fix macOS (#136).

- Format with air, check detritus, better handling of `extra-packages` (#133).

- Enhance permissions for workflow (#124).

- Permissions, better tests for missing suggests, lints (#123).

- Only fail covr builds if token is given (#122).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false` (#121).

- Correct installation of xml2 (#120).

- Explain (#119).

- Add xml2 for covr, print testthat results (#118).

- Fix (#117).

- Sync (#116).

- Avoid failure in fledge workflow if no changes (#114).

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries (#113).

- Use stable pak (#112).

- Latest changes (#111).

- Trigger run (#110).

- Use pkgdown branch (#109).

  - ci: Use pkgdown branch

  - ci: Updates from duckdb

  - ci: Trigger run

- Install via R CMD INSTALL ., not pak (#108).

  - ci: Install via R CMD INSTALL ., not pak

  - ci: Bump version of upload-artifact action

- Install local package for pkgdown builds.

- Improve support for protected branches with fledge.

- Improve support for protected branches, without fledge.

- Sync with latest developments.

- Use v2 instead of master.

- Import from actions-sync, check carefully.

## Documentation

- Fix link to "What they forgot" chapter (@Masterxilo, #101).

- Fixed "heuristics" typo (@t-gummer, #91).

## Uncategorized

- Merge branch 'docs'.

- Internal changes only.

- Merge pull request #103 from jack-davison/patch-1.

  fix broken link in `here.Rmd` vignette

- Merge cran-1.0.1.

- Adapt to testthat 3.0.1.


# here 1.0.1 (2020-12-13)

- Adapt to testthat 3.0.1.


# here 1.0.0 (2020-11-15)

## Features

- New `here::i_am()` offers a new recommended way to declare the project root. Instead of relying on special files or directories that indicate the project root, each script and report now can declare its own location relative to the project root (#27).
- `dr_here()` shows the initial and current working directory (#18, #55).

## Documentation

- Improve readme and add "Getting started" vignette (#44, @sharlagelfand). Extend "Getting started" vignette with a detailed description of the behavior and use cases (#55).
- Update `?here` to address conflict with `lubridate::here()` (#37, @nzgwynn).
- New "rmarkdown" vignette (#55).
- `set_here()` is superseded in favor of `here::i_am()` (#61).
- More explicit documentation for the `...` argument to `here()` (#7).

## Internal

- Add testthat tests (#57).
- Use GitHub Actions for checks (#52).
- Requires rprojroot >= 2.0.1.
- Re-license as MIT (#50).
- Added Jennifer Bryan as contributor (#32).


# here 0.1 (2017-01-25)

Initial CRAN release.

- Main function `here()`
    - Uses a fixed root that contains a `.here` file or can be either an RStudio project, an R package, a `remake` project, a Projectile project, or a VCS repository.
    - The root is established at package loading time, and shown with a message.
    - The current working directory is used as a fallback.
- The `set_here()` function creates a `.here` file so that a directory is recognized as root by `here()`.
- The `dr_here()` function explains the reasoning of `here()` for the current session.
