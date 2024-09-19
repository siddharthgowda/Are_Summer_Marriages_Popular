#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? simulate_data.R needs to ran first


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####

sim_marriage_data <- read_csv("scripts/simulated_marriage_data.csv") 


# no NA's

columns_with_na <- sim_marriage_data %>% filter(is.na(month) | is.na(marriages) 
                             | is.na(is_summer_month))

count(columns_with_na) == 0 # expect: true

# testing all months are valid months

month_abbrvs = c("SEP", "OCT", "NOV", "DEC", "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG")

columns_with_invalid_months <- sim_marriage_data %>% 
  filter(!(month %in% c(month_abbrvs)))

count(columns_with_invalid_months) == 0 # expect: true
         


