# Loading thhe libraries
library(dplyr)
library(ggplot2)

# Loading the data
data(mtcars)

base <- mtcars
colnames(base)
head(base)
rownames(base)

base %>% filter(carb == 1, gear > 3) %>% nrow()

ggplot(base, aes(x=gear, y=disp, size = hp)) + geom_point()

colnames(employees$eid)

check_duplicates <- function(df, col_id) {
  rep <- df %>% 
    group_by({{ col_id }}) %>%
    count() %>%
    filter(n > 1) %>%
    nrow()
  return(rep)
}

a <- check_duplicates(employees, eid)
print(a)

aa <- employees %>%
  group_by(eid) %>%
  count() %>%
  filter(n > 1) %>%
  nrow()

print(aa)

c <- 4
print(c)

colnames(messages)
colnames(references)
colnames(recipients)
colnames(employees)

head(recipients)

recipients$rtype %>% unique() 

employees %>% summarise(n_distinct(status))
employees$status %>% unique() 
typeof(messages$date)
head(messages$date)
describe(messages)

head(references$reference)[1]

employees$status %>% unique()

aa <- messages %>%
  mutate (
    tmp_date = as_date(date, origin = "1970-01-01"),
    year = year(tmp_date),
    date
  )
head(aa)

aa %>%
  group_by(year) %>%
  count()
  
max(aa$year)
min(aa$year)
max(aa$date)
min(aa$date)


ggplot(aa, aes(x=year))

length(messages$date)

messages %>%
  filter(date >= as.Date("1999-01-01") & date <= as.Date('2002-12-31')) %>%
  nrow()

length(messages$date)

month(messages$date[1])
format(messages$date[1], "%Y-%m")


colnames(messages)
colnames(employees)
colnames(recipients)

messages$sender[1:5]

messages[1, c("mid", "message_id")]
head(messages$message_id)

employee_lookup <- employees %>%
  pivot_longer(
    cols = starts_with("Email"), 
    names_to = "email_type",     
    values_to = "email_address"
  ) %>%
  select(eid, email_address) %>%
  drop_na()

length(employee_lookup)
head(employee_lookup)

recipients$rvalue[1]


qq <- messages %>%
  left_join(employee_lookup, by = c('sender' = 'email_address')) %>%

colnames(qq)

colnames(messages)

messages %>%
  left_join(employee_lookup, by = c("sender" = "email_address")) %>%
    rename('sender_id' = eid, 'sender_status' = status)

colnames(messages)

complete$year %>% unique()

complete %>%
  filter(year == 2001) %>%
  group_by(sender_status) %>%
  count()

complete %>%
  group_by(year, sender_status) %>%
  count()

employees %>% select(status) %>% unique()
class(employees$status)

employees %>%
  mutate(status = as.character(status)) %>%
  mutate(status = na_if(status, "N/A")) %>%
  mutate(status = replace_na(status, "NA")) %>%
  select(status) %>% unique()

colnames(recipients)
colnames(complete)
head(complete)

messages %>%
  filter(is.na(sender))

employees %>%
  filter(is.na(status)) %>%
  count()

################################################################################

# 1. Filtering top senders / receivers. Input: sender, receiver, year and top_x
# 2. Filtering by role: Input role, sender, receiver, year
# 3. an analysis of the temporal dynamic of the messages, in relationship with the public events
# (see on the web information about the Enron scandal),
# 4. Quantifying number of emails containing key words. Input: key_word


# 1
complete %>%
  filter(year == 2001) %>%
  count(sender, sort=TRUE) %>%
  slice_head(n=3)


colnames(messages)
colnames(complete)


library(stringr)

complete %>% 
  filter(str_detect(subject, "lawsuit")) %>%
  select(date, sender, rtype, rvalue, subject) %>%
  slice_head(n = 10)
