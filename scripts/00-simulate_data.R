#### Preamble ####
# Purpose: Simulates Number of Marriages Per Month in Toronto
# Author: Siddharth Gowda
# Date: 2024-Sep-19
# Contact: siddharth.gowda@mail.utoronto.ca
# License: MIT
# Pre-requisites: tidyverse installed
# Any other information needed? All data will be from 2000 and beyond


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]
set.seed(888)

#### Simulate data ####
# [...ADD CODE HERE...]

lambda <- 10 # average marriages per month
sample_size <- 100

marriage_data <- tibble(
  year = rep(2000:2023, each = 12),
  month_num = rep(1:12, times = 24),
  marriages = rpois(n = 24 * 12, lambda = 10)  # Using Poisson distribution for number of marriages
)

marriage_data <- marriage_data %>% group_by(month_num) %>% 
  summarise(marriages = sum(marriages))

marriage_data <- marriage_data %>%
  mutate(month = case_when(
    month_num == 1 ~ "SEP",
    month_num == 2 ~ "OCT",
    month_num == 3 ~ "NOV",
    month_num == 4 ~ "DEC",
    month_num == 5 ~ "JAN",
    month_num == 6 ~ "FEB",
    month_num == 7 ~ "MAR",
    month_num == 8 ~ "APR",
    month_num == 9 ~ "MAY",
    month_num == 10 ~ "JUN",
    month_num == 11 ~ "JUL",
    month_num == 12 ~ "AUG",
    TRUE ~ NA_character_  # Default for any unmatched value
  )) %>% select(month, marriages) %>% 
  mutate(is_summer_month = month %in% c("JUN", "JUL", "AUG"))
# first intermediate table
# year, month, number of marriages

write_csv(marriage_data, "scripts/simulated_marriage_data.csv") 




