<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# here 1.0.2.9011 (2026-05-24)

## Continuous integration

- Update ccache-action reference.

- Bump action version.


# here 1.0.2.9010 (2026-05-16)

- Ci: Unify fledge.yaml across cynkratemplate and fledge (#86).


# here 1.0.2.9009 (2026-05-13)

## Chore

- Add ccache to `.gitignore` and `.Rbuildignore`.

## Continuous integration

- Create snapshot update PR against correct branch.

- Add reference to `/apply-patch` workflow in commit message.

- Clarify rationale for not deploying on schedule.

- Only run fledge on pushes to main.

- Tweak fledge workflow and ccache action.


# here 1.0.2.9008 (2026-05-06)

## Continuous integration

- Cosmetics.

- Bump action versions.

- Install clang-format-21.

- Align fledge workflow.

- Harmonize.


# here 1.0.2.9007 (2026-05-04)

## Chore

- Auto-update from GitHub Actions (#170).


# here 1.0.2.9006 (2026-03-12)

## Chore

- Auto-update from GitHub Actions (#167).


# here 1.0.2.9005 (2026-01-14)

## Continuous integration

- Fix comment (#165).

- Tweaks (#164).

- Test all R versions on branches that start with cran- (#163).


# here 1.0.2.9004 (2025-11-17)

## Continuous integration

- Install binaries from r-universe for dev workflow (#161).


# here 1.0.2.9003 (2025-11-12)

## Continuous integration

- Fix reviewdog and add commenting workflow (#158).


# here 1.0.2.9002 (2025-11-10)

## Continuous integration

- Use workflows for fledge (#156).


# here 1.0.2.9001 (2025-11-08)

## Continuous integration

- Sync (#154).


# here 1.0.2.9000 (2025-09-15)

## fledge

- CRAN release v1.0.2 (#149).


# here 1.0.2 (2025-09-14)

## Features

- Discover VS Code, Quarto and renv projects (#128, #130).

## Chore

- Change maintainer e-mail.

## Documentation

- Fix link to "What they forgot" chapter (@Masterxilo, #101).

- Fixed "heuristics" typo (@t-gummer, #91).


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
