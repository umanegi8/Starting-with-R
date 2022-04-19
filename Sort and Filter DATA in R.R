install.packages("tidyverse")             #installing Packages
library(tidyverse)

install.packages("dplyr")             #installing Packages
library(dplyr)

data("ToothGrowth")
View(ToothGrowth)
str(ToothGrowth)
summary(ToothGrowth)

#filter data where dose = 0.5
tg_dose_filter <- filter(ToothGrowth, dose == 0.5)  #filter(dataset, col = condition)

#arranging filtered data according to length
arrange(tg_dose_filter, len)                         #arrange(dataset, column)

#using nested function to do fiilter and sort in the same command
sort_data <- arrange(filter(ToothGrowth, supp == "VC"), len)
View(supp_filter)


#Using PIPE to sort and filter
sort_using_pipe <- ToothGrowth %>%
  filter(dose == 1) %>%
  arrange(len)

sort_using_pipe


#using PIPE in depth

#using pipe data to find the mean length group by supp with dose = 1
using_pipe <- ToothGrowth %>%
  filter(dose == 1) %>%
  group_by(supp) %>%
  summarize(mean_len = mean(len, na.rm = T), .group = "drop")
using_pipe
  