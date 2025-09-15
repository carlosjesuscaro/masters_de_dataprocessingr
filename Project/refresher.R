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
