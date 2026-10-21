# Lab 2: is this file ready to analyze?

library(tidyverse)


# you're a junior analyst at a state library association. a colleague
# downloaded the 2024 Public Libraries Survey and wants to compare
# library systems on visits, circulation, and programs.

# your supervisor wants an audit before anyone analyzes anything.

# nothing today is new. you've done every piece of this already.


# grain and key

libraries <- read_csv(
  "data/raw/PLS_FY24_AE_pud24i.csv",
  locale = locale(encoding = "latin1"),
  show_col_types = FALSE
)

glimpse(libraries)
view(libraries)

# one row is one administrative entity or library system

# the download also has an "outlet" file. it has more rows.
# why would it? (the user's guide will tell you.)

# which column should identify a row?
#FSCKEY

# what did those tell you?
# what would it have meant if the count() came back with rows?

#It would mean library systems would share the same ID so it is not Unique. There would be duplicates


# let's focus on VISITS for now. what does this column mean?

# VISITS counts visits to the library in a year.
# before you run anything: what values would be impossible?
#Negative because you cant not(not) go to the library

libraries |>
  summarise(
    min_visits = min(VISITS, na.rm = TRUE),
    max_visits = max(VISITS, na.rm = TRUE)
  )

libraries |>
  filter(VISITS < 0) |>
  count(VISITS)

# how many different negative values? how many rows of each?
# 2, -3 has 5 rows and -1 has 69 rows

# is a negative number here bad data, missing data, or a code?
# can you tell from the data alone?
# Bad data because there are no NA values in the data.


# does R think any of these are missing?
# No because it is showing up all rows as false

is.na(libraries$VISITS) |>
  table()

# on tuesday, NA told us THAT something was missing but not WHY.
# what's different here?
#Here is is 


# go to the user's guide. for each negative value:
# what does it mean, in the guide's words? where did you find it?
# -1 means the library's visting count is missing
# -3 The library is closed

# do the two codes mean the same thing?

#No because someone not reporting their visit to the library is different than
#the library actually being closed


# every numeric column has a flag column. find the one for VISITS.



# what does the flag tell you? does it tell the two codes apart?
libraries |> 
  filter(VISITS < 0) |> 
  count(VISITS, F_VISITS)

#U_24 means that it is either closed or not recorded into the system


# make a clean version. VISITS stays exactly as it is.

libraries <- libraries |>
  mutate(visits_clean = if_else(VISITS %in% c(-1, -3), NA_real_, VISITS))

# why list the codes instead of writing VISITS < 0?
# Because both negative values represent something that is not just missing data

# both codes just turned into NA. what did we lose?
# where can we still find it?

#When the reasoning the library is closed, The original visits column


# did it do what we meant? three questions:
# same number of library systems?
nrow(libraries)
ncol(libraries)
# Yes there is the same number
# did every code become NA?
# No

# did anything else become NA?
# 74 rows did become NA

# does any of this matter?
#We are aware that 74 values are now NA and we can now compare it to different system



# why is the raw mean lower? what's in each denominator?
#It would be lower because it would include the now NA values. The denominator is the number of rows.


# your turn :)
# get in your group project groups

# do that process for each of the following:
# TOTATTEN - program attendance
libraries |> 
  filter(TOTATTEN < 0) |> 
  count(TOTATTEN, F_TOTATT)

libraries <- libraries |>
  mutate(visits_totatten = if_else(TOTATTEN %in% c(-1, -3), NA_real_, TOTATTEN))

# TOTPRO - number of programs
# TOTCIR - total circulation

# you're not solving a new problem. same steps, different variable.
# everything you need is in the VISITS section.

# what should it measure? what would be impossible?
#Measures total attendance


# range. any odd values? how many of each?


# what does the user's guide say they mean?
# ("we couldn't find it" is an answer. "we assumed" isn't.)


# what's the flag column? (the names get shortened. look for it.)


# clean version. keep the raw column.


# check it: same rows? every code became NA? nothing else did?

# mean before and after. big change or small?

# where are they? 

# recoding to NA fixes the number. does it finish the job?

# are the coded rows spread out, or do they bunch up?

# if someone compares circulation across states, what goes wrong?


# this is for you to answer
# is this file ready to analyze as is? 3-4 sentences.
