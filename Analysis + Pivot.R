library('tidyverse')
library("readxl")
library('tidyquant')
library('gt')


# Set environment

setwd('C:/Users/RDINCHA/Desktop')
getwd()

# Get and format the first 1663 file

my_data <- read_excel("1663_PART1.xlsx")
my_data <- filter(my_data, rowSums(is.na(my_data)) != ncol(my_data)) # Apply filter function
my_data <- unique(my_data)
my_data <- my_data[-c(61),]
 
# Get and format the second 1663 file

my_dato <- read_excel("1663_PART2.xlsx")
my_dato <- filter(my_dato, rowSums(is.na(my_dato)) != ncol(my_dato)) # Apply filter function
my_dato <- unique(my_dato)
my_dato <- my_dato[-c(61),]

# Append both tables

my_superdato <- rbind(my_data, my_dato)

# Take a look at the users

colnames(my_superdato)[20] <- 'User'
table(my_superdato[20])

# Group by user

super2 <- my_superdato %>%
  mutate(Status = case_when(
    substr(User,1,2) == 'C_'  ~ "FMCS",
    User == 'UC4BATCH'  ~ "Automatic",
    User == 'UC4BATCH2'  ~ "Automatic",
    User == 'XXMPOPNA'  ~ "Automatic_AMP",
    User == 'XXMPOPPRXY01'  ~ "Automatic_GOM"
  ))


super2$Status[is.na(super2$Status)] <- 'Manual'

# Take a look at the type of movements

table(super2$Status)

# Pivot table

pivot <- super2 %>%
                   pivot_table(
                                .rows = c(~ MOT),
                                .columns = c(~ Status),
                                .values = ~ COUNT(Status)
                               )

# Convert Pivot Table to Data Frame

pivot <- as.data.frame(pivot)

# Eliminate last row with NA's

pivot <- pivot[-c(10),]

# Replace NA's with zeroes

pivot[is.na(pivot)] <- 0

# Add last Total row
                                
pivot[10,] <- summarise_all(pivot, ~if(is.numeric(.)) sum(.) else "Total")

# Add last Total columns

pivot$Totals <- rep(c(rowSums(pivot[,2:6])))

# Add columns with relative percetages

pivot <- transform(pivot, Automatic_GOMp = Automatic_GOM / pivot[10,2])
pivot <- transform(pivot, Automaticp = Automatic / pivot[10,3])
pivot <- transform(pivot, Automatic_AMPp = Automatic_AMP / pivot[10,4])
pivot <- transform(pivot, FMCSp = FMCS / pivot[10,5])
pivot <- transform(pivot, Manualp = Manual/ pivot[10,6])

# Format pivot

graph <- pivot %>%
  gt()%>%
  fmt_percent(columns = vars(Automatic_GOMp, Automaticp, Automatic_AMPp,
                             FMCSp,Manualp))
# Display Pivot

graph

  
