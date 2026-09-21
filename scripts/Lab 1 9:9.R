### 9/10 Review Day 2
library(tidyverse)

#Grain = What one row represents
#Granularity = The level of detail in observations
#Documentaion = Provides the missing details from a dataset

#Workflow Steps
# 1.Import
# 2.Inspect
# 3.Check Documentation
# 4.Declare grain
# 5.Calculate

#What is the total population of rge US in 2025 according to this file
#Which KY counties grew from 24' - 25'
#How many counties or county equvalent records are in this file

data <- read_csv(
  "data/raw/co-est2025-alldata.csv",
  locale = locale(encoding = "Latin1"),
  col_types = cols(.default = col_character())
)

glimpse(data)
names(data)

#Internet is a good way to found background info about data

#Data has to do with something abt population
#Estimate changes and components of that change

#SUMLEV describes state/ stat equipment

data_trimmed <- data |> 
  select(SUMLEV, REGION, DIVISION, STATE, COUNTY,STNAME,CTYNAME, POPESTIMATE2024, POPESTIMATE2025, NPOPCHG2025)
  
#Does every row appear to represent the same kind of geographic observation
### No. State - County
#Different rows?
### 040 = state , 050 = County
### SUMLEV tells us this

data_trimmed |> 
  slice_head(n = 10)

#Declare the Grain

#The grain represents a geographic location
#One row represents either a county or a state
#One row represents a mixed state-country grain.

data_trimmed_numeric <- data_trimmed |> 
  mutate(
    pop2025 = as.numeric(POPESTIMATE2025),
    pop2024 = as.numeric(POPESTIMATE2024),
    popchg2025 = as.numeric(NPOPCHG2025)
  )
data_trimmed_numeric |> 
  filter(STNAME == "KENTUCKY") |> 
  slice_head(n = 10)

data_trimmed_numeric |> 
  filter(SUMLEV == "040") |> 
  summarise(
    total_pop_2025 = sum(pop2025)
  )

data_trimmed_numeric |> 
  filter(SUMLEV == "040") |> 
  select(STNAME) |> 
  print(n = 51)

data_trimmed_numeric |> 
  summarise(
    total_pop_2025 = sum(pop2025)
  )

### 1. Answer 341784857

data_trimmed_numeric |> 
  filter(STNAME == "KENTUCKY", SUMLEV == "050") |> 
  filter(pop2025 > 0) |> 
  select(CTYNAME, popchg2025) |> 
  arrange(desc(popchg2025)) |> 
  print(n = 81)
  
data_trimmed_numeric |> 
  filter(SUMLEV == "050", STNAME == "KENTUCKY",popchg2025 > 0) |> 
  mutate(
    popchgvalid = pop2025 - pop2024) |> 
  select(CTYNAME, popchgvalid)
#The grain represents the county

data_trimmed_numeric |> 
  filter(SUMLEV == "050") |> 
  nrow()
#All county equivilents
