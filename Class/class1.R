# Basic examples

# Concatenation
c(1:4)
# Sequence
seq(from = 1, to = 100, by = 2)
# Repeating
rep(1:3,3)
rep(1:3, c(2,3,4))
# vector can be created with numeric, booleans, strings but a vector msust contain only one data type
# same rule apply for matrices

# Matrices
matrix(c(1,2,3,4,5,6), nrow=2)
# by default, it builds the matrix by column
matrix(c(1,2,3,4,5,6), nrow=2, byrow=TRUE)
# Concatenation by row and columns
cbind(1:3, 4:6, 8:10)
rbind(1:3, 4:6, 8:10)

# Dataframes
# Mainly used in data science, more than matrices
data.frame(varf1 = rnorm(3), var2 = runif(3), var3=c('M', 'M', 'F'))
# It is possible to combine different dfata types in a data frame unlike matrices
# It is also possible to have names to the columsns and rows
# It is possible to convert a datafram to a  matrix but therer will be data conversion to fit
# everything into a single data type

# All functions return the values as lists

# ?? provides a function name based on key words
# ? provides the documentation of a function
??clustering

# Slicing
x <- rnorm(10)
x
x[1:3]
x[2]


my_list <- list(
  first_name = "Carlos",
  last_name = "Smith",
  age = 30
)
# Access the 'age' element using the $ operator
print(my_list[["age"]])

