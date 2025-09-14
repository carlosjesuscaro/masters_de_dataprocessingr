# Loading the data
load('Enron.Rdata')
ls()

employees <- as.data.frame(employeelist)
messages <- as.data.frame(message)
recipients <- as.data.frame(recipientinfo)
references <- as.data.frame(referenceinfo)

# employees.summary()

summary(employees)