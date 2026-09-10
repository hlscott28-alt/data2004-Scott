install.packages("tidyverse")
library(tidyverse)
chocolate <- read.csv("data/raw/chocolate.csv")

glimpse(chocolate)

chocolate |>
  select(ref, company_manufacturer, company_location, rating, cocoa_percent)

chocolate |>
  filter(company_location == "U.S.A", 
         rating >= 3.5)

chocolate |> 
  filter(company_location = "U.S.A" | rating >= 3.5")
 


chocolate |> 
  filter(rating >= 3.5, 
    review_date == 2021,
    company_loctation %in% c("U.S.A","Vietnam"))
    
chocolate |>
select(rating) |> 
arrange(desc(rating)) |>
slice_head(n = 10)

mean(chocolate$cocoa_percent)

glimpse(chocolate)

chocolate |>
mutate(
cocoa_num = as.numeric(cocoa_percent)) |>
select(cocoa_num)

chocolate |> 
select(cocoa_percent)|> 
mutate(
cocoa_nu m = parse_number(cocoa_percent)
)

mean_cocoa num


glimpse(chocolate)

group_by(company_location) |>
summarise(
n = n()
avg_rating, ra.rm + TRUE),
avg_cocoa + mean(cocoa_num. na.rm = TRUE)) |>
slice_head(n = 10)
)

chocolate |>
group_by(rating) |>
summarise(
n_missing = sum(is.na)
)

ggplot(chocolate, )


