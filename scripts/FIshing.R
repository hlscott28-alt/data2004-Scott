library(tidyverse)
library(readxl)

fishing <- read_excel("data/raw/commercial.xlsx", sheet = "Erie")
glimpse(fishing)

#Grain - One row represents something about fish in any given region in a given year
      # One row represents a region year of weight of rounded pound of fish caught

fishing |> 
  ggplot(aes(x = Year, y = `Grand Total`)) +
  geom_line()

nrow(fishing)

fishing_long <- fishing |> 
  pivot_longer(
    names_to = "region",
    values_to = "values",
    cols = c("Michigan (MI)", "New York (NY)", "Ohio (OH)", "Pennsylvania (PA)", "U.S. Total", "Canada (ONT)", "Grand Total")
  )
glimpse(fishing_long)

fishing_long |> 
  distinct(region)

fishing_long |> 
  filter(Year == 1885, Species == "Lake Whitefish") |> 
  select(region, values)

133 + 30 + 1249 + 2120 + 3532 + 186 + 3718

fishing_long |> 
filter(!region %in% c("U.S. Total", "Grand Total")) |> 
  summarise(total = sum(values, na.rm = TRUE))


fishing_long |> 
  filter(!region %in% c("U.S. Total", "Grand Total")) |>
  mutate(species = fct_lump_n(Species, 6)) +
  ggplot(aes(x = Year, y = values, color = Species)) +
  geom_line()

fishing_long |> 
  select(Year, Species, region, values) |> 
  pivot_wider(names_from = region, values_from = values) |> 
  print(width = Inf)

#OYO

fishing_Ont <- read_excel("data/raw/commercial.xlsx", sheet = "Ontario")
glimpse(fishing_Ont)

#Grain - The grain shows the the amont of fish caught out of Lake Ontario per year

nrow(fishing_Ont)

Fish_Ont_long <- fishing_Ont |> 
  pivot_longer(
    names_to = "region",
    values_to = "Values",
    cols = 
  )
  