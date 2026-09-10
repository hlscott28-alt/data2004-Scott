### Hayden Scott Data Analysis Notes
### Setting up base things that I need
install.packages("tidyverse")
library(tidyverse)

### 9/9 Notes ### Chapter 5 Data Tidying

### There are three interrelated rules that make a dataset tidy:

#Each variable is a column; each column is a variable.
#Each observation is a row; each row is an observation.
#Each value is a cell; each cell is a single value.

#Get familiar with the Pivot_Longer and the Pivot_Wider functions

billboard |> 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank"
  )
#Values_drop_na drops any na values
billboard |> 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  )
#Turn the Weeks into numbers
billboard |> 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  ) |> 
  mutate(
    week = parse_number(week)
  )
  

  