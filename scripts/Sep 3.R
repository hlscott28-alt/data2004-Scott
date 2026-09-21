install.packages("tidyverse")
library(tidyverse)
getwd()
population_csv <- read_csv("data/raw/API_SP/API_SP.POP.TOTL_DS2_en_csv_v2_285942.csv",
                           skip = 4)

population_csv <- read_csv("data/raw/API_SP.POP>TOTL_DS2_en_csv_v2_285942.csv",
                           skip = 4)
glimpse(population_csv)

glimpse_csv |> 
  select(...71) |> 
  head()

population_csv |> 
  select(...71) |> 
  tail()

population_csv |> 
  select(...71) |> 
  unique()
  

is.na()
sum(is.na(population_csv$...71))

population_csv <- population_csv |> 
  select(-...71)

library(readxl)
population_xls

population_xls <- read_excel()

download.file(
  url = "https://api.worldbank.org/v2/country/all/indicator/SP.POP.TOTL?date=2020%3A2024&format=json&per_page=20000",
  destfile = "data/raw/population_json.json",
  mode = "wb"
)
library(jsonlite)
population_json_raw <- read_json("data/raw/population_json.json")
glimpse(population_json_raw)

population_obs <- population_json_raw[(2)]




