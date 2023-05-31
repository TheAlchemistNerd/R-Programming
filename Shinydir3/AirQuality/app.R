library(shiny)
library(datasets)
library(tidyr)
library(tibble)

# Delete missing values
aq.no.missing <- drop_na(airquality)

# for the drop down menus
options <- c("Ozone (parts per billion)" = "Ozone",
             "Solar (Langleys)" = "Solar.R",
             "Wind (MPH)" = "Wind",
             "Temperature (F)" = "Temp")
