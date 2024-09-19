#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Siddharth Gowda
# Date: 2024-Sep-19
# Contact: siddharth.gowda@mail.utoronto.ca
# License: MIT
# Pre-requisites: tidyverse installed
# Any other information needed?

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_marriage_data <- read_csv("./data/raw_data/raw_marriage_data.csv")
head(raw_marriage_data)

clean_marriage_data <- raw_marriage_data %>% 
  janitor::clean_names() %>% 
  separate(time_period, into = c("year", "month"), sep = "-") %>%
  filter(year %in% c(2000:2023)) %>% 
  select(month, id)

head(clean_marriage_data)

clean_marriage_data <- clean_marriage_data %>% 
  mutate(month = case_when(
    month == "01" ~ "SEP",
    month == "02" ~ "OCT",
    month == "03" ~ "NOV",
    month == "04" ~ "DEC",
    month == "05" ~ "JAN",
    month == "06" ~ "FEB",
    month == "07" ~ "MAR",
    month == "08" ~ "APR",
    month == "09" ~ "MAY",
    month == "10" ~ "JUN",
    month == "11" ~ "JUL",
    month == "12" ~ "AUG",
    TRUE ~ NA_character_  # Default for any unmatched value
  )) %>% filter(!is.na(month) | !is.na(id)) %>% 
  group_by(month) %>% 
  summarise(marriages = n()) %>% 
  mutate(is_summer_month = month %in% c("JUN", "JUL", "AUG"))

#### Save data ####
write_csv(clean_marriage_data, "data/analysis_data/raw_marriage_data.csv")
