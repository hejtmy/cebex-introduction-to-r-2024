#

getwd()
setwd()

## Paths

# Absolute path
# read.csv("/Users/lukashejtmanek/Documents/Projects/Cebex/cebex-introduction-to-r-2024/data/Salary_Data_Based_country_and_race.csv")

# Realtive path
filepath_salary <- "data/Salary_Data_Based_country_and_race.csv"
read.csv(filepath_salary)

## Loading data files
read.table(filepath_salary)
df_salary <- read.table(filepath_salary, sep = ",", header = TRUE)

# Loading example-row.txt
readLines("data/loading-examples/example-row.txt", 10)
df_example <- read.table("data/loading-examples/example-row.txt", sep = ";",
                         header = TRUE)

# Load the  example-weird-header.txt
df_example <- read.table("data/loading-examples/example-weird-header.txt",
                         sep = ",", skip = 3, header = TRUE)

## example-dec.txt
df_example <- read.table("data/loading-examples/example-dec.txt", sep=";",
                         dec = ",", header = TRUE)

## example-error.txt

df_example <- read.table("data/loading-examples/example-error.txt", sep=",",
                         header = TRUE, fill = TRUE)
tail(df_example)
as.numeric(df_example$height)

## example-missing.txt
df_example <- read.table("data/loading-examples/example-missing.txt", sep=",",
                         header = TRUE)


is.na(as.numeric(df_example$height))
which(is.na(as.numeric(df_example$height)))

# Get the line in which is.na(as.numeric(df_example$height)) is true
df_example[is.na(as.numeric(df_example$height)), ]


df_example <- read.table("data/loading-examples/example-missing.txt", sep=",",
                         header = TRUE, na.strings = c("missing", ""))
