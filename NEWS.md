<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# here 1.0.1.9030 (2025-05-04)

## Continuous integration

- Enhance permissions for workflow (#124).


# here 1.0.1.9029 (2025-04-30)

## Continuous integration

- Permissions, better tests for missing suggests, lints (#123).


# here 1.0.1.9028 (2025-04-28)

## Continuous integration

- Only fail covr builds if token is given (#122).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false` (#121).


# here 1.0.1.9027 (2025-04-26)

## Continuous integration

- Correct installation of xml2 (#120).


# here 1.0.1.9026 (2025-04-25)

## Chore

- Auto-update from GitHub Actions.

  Run: https://github.com/r-lib/here/actions/runs/14636203620

## Continuous integration

- Explain (#119).

- Add xml2 for covr, print testthat results (#118).

- Fix (#117).

- Sync (#116).


# here 1.0.1.9025 (2024-12-09)

## Continuous integration

- Avoid failure in fledge workflow if no changes (#114).


# here 1.0.1.9024 (2024-12-08)

## Continuous integration

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries (#113).


# here 1.0.1.9023 (2024-12-07)

## Continuous integration

- Use stable pak (#112).


# here 1.0.1.9022 (2024-11-10)

## Continuous integration

  - Latest changes (#111).


# here 1.0.1.9021 (2024-10-28)

## Continuous integration

  - Trigger run (#110).

  - Use pkgdown branch (#109).
    
      - ci: Use pkgdown branch
    
      - ci: Updates from duckdb
    
      - ci: Trigger run


# here 1.0.1.9020 (2024-09-15)

## Continuous integration

  - Install via R CMD INSTALL ., not pak (#108).
    
      - ci: Install via R CMD INSTALL ., not pak
    
      - ci: Bump version of upload-artifact action


# here 1.0.1.9019 (2024-08-31)

## Continuous integration

  - Install local package for pkgdown builds.

  - Improve support for protected branches with fledge.

  - Improve support for protected branches, without fledge.


# here 1.0.1.9018 (2024-08-17)

## Chore

- Auto-update from GitHub Actions.

  Run: https://github.com/r-lib/here/actions/runs/10425486329

## Continuous integration

- Sync with latest developments.


# here 1.0.1.9017 (2024-08-10)

## Continuous integration

- Use v2 instead of master.


# here 1.0.1.9016 (2024-08-06)

## Continuous integration

- Import from actions-sync, check carefully.


# here 1.0.1.9015 (2024-08-02)

## Chore

- Auto-update from GitHub Actions.

  Run: https://github.com/r-lib/here/actions/runs/10200110394

## Continuous integration

- Import from actions-sync, check carefully.


# here 1.0.1.9014 (2024-07-02)

- Internal changes only.


# here 1.0.1.9013 (2024-06-30)

## Chore

- Auto-update from GitHub Actions.

  Run: https://github.com/r-lib/here/actions/runs/9728440182


# here 1.0.1.9012 (2024-06-28)

## Chore

- Auto-update from GitHub Actions.

  Run: https://github.com/r-lib/here/actions/runs/9691616332


# here 1.0.1.9011 (2024-01-27)

## Chore

- Add Aviator configuration.

## Uncategorized

- Merge pull request #103 from jack-davison/patch-1.

  fix broken link in `here.Rmd` vignette


# here 1.0.1.9010 (2024-01-24)

- Internal changes only.


# here 1.0.1.9009 (2024-01-15)

- Internal changes only.


# here 1.0.1.9008 (2024-01-01)

## Documentation

- Fix link to "What they forgot" chapter (@Masterxilo, #101).


# here 1.0.1.9007 (2023-10-10)

- Internal changes only.


# here 1.0.1.9006 (2023-10-09)

- Internal changes only.


# here 1.0.1.9005 (2023-03-24)

- Internal changes only.


# here 1.0.1.9004 (2023-02-17)

- Internal changes only.


# here 1.0.1.9003 (2023-02-07)

## Chore

- Change maintainer e-mail.

## Documentation

- Fixed "heuristics" typo (@t-gummer, #91).


# here 1.0.1.9002 (2022-12-30)

- Internal changes only.


# here 1.0.1.9001 (2022-12-24)

- Merge cran-1.0.1.


# here 1.0.1.9000 (2020-12-13)

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
