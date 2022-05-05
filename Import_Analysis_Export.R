library('tidyverse')
library("readxl")
library("writexl")

setwd('C:/Users/RDINCHA/Desktop/UIA/Mayo 2021')
getwd()

# Get and format the first 1663 file

my_data <- read_excel("3091.xlsx")
my_data <- filter(my_data, rowSums(is.na(my_data)) != ncol(my_data)) # Apply filter function
my_data <- unique(my_data)
my_data <- my_data[-c(61),]

# Get and format the second 1663 file

my_dato <- read_excel("3092.xlsx")
my_dato <- filter(my_dato, rowSums(is.na(my_dato)) != ncol(my_dato)) # Apply filter function
my_dato <- unique(my_dato)
my_dato <- my_dato[-c(61),]

# Append both tables

my_superdato <- rbind(my_data, my_dato)

# Generate file with 309/10

M309 <- subset(my_superdato, MvT == '309'| MvT == '310')
write_xlsx(M309, "C:\\Users\\RDINCHA\\Desktop\\UIA\\Febrero 2022\\022022-309-310.xlsx")

# Generate file with 101/2

M101 <- subset(my_superdato, MvT == '101'| MvT == '102')
write_xlsx(M101, "C:\\Users\\RDINCHA\\Desktop\\UIA\\Febrero 2022\\022022-101-102.xlsx")

# Generate file with 601/2

M601 <- subset(my_superdato, MvT == '601'| MvT == '602')
write_xlsx(M601, "C:\\Users\\RDINCHA\\Desktop\\UIA\\Febrero 2022\\022022-601-602.xlsx")

# Generate file with rest of movements

Mrest <- subset(my_superdato, MvT != '601'& MvT != '602'
                & MvT != '101' & MvT != '102'
                & MvT != '309' & MvT != '310')
write_xlsx(Mrest, "C:\\Users\\RDINCHA\\Desktop\\UIA\\Febrero 2022\\022022-Mvts.xlsx")
