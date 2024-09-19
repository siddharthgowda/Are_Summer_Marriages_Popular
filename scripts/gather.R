#### Preamble ####
# Purpose: Get's Marriage Data from opendatatoronto and stores as csv
# Author: Siddharth Gowda
# Date: 2024-Sep-19
# Contact: siddharth.gowda@mail.utoronto.ca
# License: MIT
# Pre-requisites: tidyverse, opendatatoronto installed
# Any other information needed?

library(tidyverse)
library(opendatatoronto)

# Download data
package <- show_package("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")
package

# get all resources for this package
resources <- list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
raw_marriage_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
raw_marriage_data

write_csv(raw_marriage_data, "data/raw_data/raw_marriage_data.csv") 


         
