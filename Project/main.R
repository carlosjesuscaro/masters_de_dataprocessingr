# Loading libraries
###################
library(tidyverse)
library(dplyr)
library(ggplot2)


# Loading the data
##################
load('Enron.Rdata')
ls()

employees <- as.data.frame(employeelist)
messages <- as.data.frame(message)
recipients <- as.data.frame(recipientinfo)
references <- as.data.frame(referenceinfo)

# Exploring the data
#####################

# 1. Employees
summary(employees)
employees$folder
names(employees)
colnames(employees)
head(employees)

employees$eid %>% unique() 
head(employees$eid)

# Employee duplicate identification 
employees %>%
  group_by(eid) %>% 
  count() %>% 
  filter(n > 1)


# 2. Messages
head(messages)
messages %>% count()

# NUmber of e

# 3. Recipients
head(recipients)

