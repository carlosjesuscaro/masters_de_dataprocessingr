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
