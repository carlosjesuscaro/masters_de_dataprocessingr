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
