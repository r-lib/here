library(here)

readr::write_csv(palmerpenguins::penguins, here("data/penguins.csv"))
