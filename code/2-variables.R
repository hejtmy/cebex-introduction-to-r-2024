library(ggplot2)
## COPY CODE
# COPY EXACTLY
5 * 5
5*5
5       *      5
5       *
  5
number = 5
# 5 *
number = 5
# head(mpg
#     {}
#[]

number = 5

## DRY principle
# DO NOT REPEAT YOURSELF



## Variables

## Numeric
number = 5
outlier_value = 10

number <- 5

## Variable naming

# 5thperson <- "Lukas"
fifthperson <- "Lukas"
# fifth person <- "Lukas"
person_five <- "Lukas"
# PLease John, can you fix this?
# person-five <- "Lukas"
person5 <- "Lukas"
person5 <- Lukas


# - * + / = % }«[] < >
# $ #

df_mpg <- ggplot2::mpg

# converting miles to kilometers per liter
df_mpg$cty_kpl <- df_mpg$cty * 0.425144

## Variable naming standards
# separate by _

dw <- 7
wy <- 52
yd <- 365

wy <- yd/dw

day_per_week <- 7
days_per_year <- 365
weeks_per_year <- days_per_year / day_per_week + day_per_week +
  days_per_year + days_per_year


name <- "LU*'asděščáěíěšýčěščáíěčáěščéř+ěáčý+ěéíášýč"

name <- "عبد الرحمن"

name <- "Lukáš"
load_variable <- "Lukáš"
name == load_variable

read.csv(enc)

## Numeric variables

# Create variable with a average body temperature in C (36 and a half degrees)
average_body_temperature_celsius <- 36.5
fever_body_temperature_celsius <- 38

# avg_body_temp_celsius <- 36.5

# Create a variable for converting Celsius to Fahrenheit
celsius_to_farenheit_multiplier <- 9/5
celsius_to_farenheit_addition <- 32

celsius_to_farenheit <- function(celsius) {
  new_temp <- celsius * 9/5 + 32
  return(new_temp)
}

celsius_to_farenheit(36.5)

# create variable body temperature in Fahrenheit
average_body_temperature_farenheit <- (average_body_temperature_celsius *
  celsius_to_farenheit_multiplier) + celsius_to_farenheit_addition
fever_body_temperature_farenheit <- (fever_body_temperature_celsius *
  celsius_to_farenheit_multiplier) + celsius_to_farenheit_addition

average_body_temperature_farenheit

## Character variables
name <- "Lukas"
name_2 <- 'Lukas'

# famous line I'll be back
famous_line <- "I'll be back"
# famous_line <- 'I'll be back' #error

# quote He is "really" cool!
famous_quote <- 'He is "really" cool'
famous_quote <- "He is \"really\" cool"

## numeric functions
round(average_body_temperature_farenheit)
round(1.5, digits = 3)
round(0.5)
round(1.5)
round(2.5)
round(3.5)

## Character functions
name <- "Lukas"
tolower(name)
toupper(name)

# Logical (boolean) - binary
# true, false

TRUE
FALSE
is_smoking <- FALSE

T
F

T == TRUE
3 == 3

TRUE <- "YES"
T <- "YES"
T == TRUE

## Comparing
# legal age is 18 (or 21)
legal_age <- 18
# ann age = 19
ann_age <- 18
# ann legal TRUE or FALSE
legal_age == ann_age
ann_age > legal_age
ann_age < legal_age
ann_age >= legal_age
ann_age <= legal_age

before_2000 <- mpg$year < 2000
before_2000

name <- "Lukas"
friend_name <- "Martin"

same_names <- name == friend_name
same_names

different_names <- name != friend_name
different_names

same_names <- "john"
same_names

## Negating results

!TRUE
!(3==3)
different_names <- !same_names
different_names

!("hello" == "hello")

## Missing values
name <- ""


## NA (not available)
NA
is.na(NA)
5 * NA
mean(1:10)
mean(c(1:10, NA))
mean(c(1:10, NA), na.rm = TRUE)
cor(c(1:11), c(1:2, rep(NA, 9)), use = "complete.obs")

# mpg$trans[1] <- NA
# head(mpg)
# mpg_without_na <- mpg[!is.na(mpg$trans), ]

## NULL (NULL result)
# Usually returned by functions whcih "crahs" but dont want to crash
NULL
is.null(NULL)
is.null(NA)
5 * NULL

## Lists


## Data type conversion
name <- "Lukas"
age <- 34.5
married <- TRUE

class()

###
# is.XYXY

# check if age is a "number"
is.numeric(age)

# if name is a character/string
is.character(name)
is.character(age)

is.numeric(mpg$year)
str(mpg)

### Integer
# Whole numbers

## Conversion

age <- "45"
is.numeric(age)
age/10

## Explicit conversion
# You know what you want nad you force the variable into that type
as.numeric(age)

as.numeric(NA)
missing_values <- c(".", "", "999", "missing")

# convert name to number
name <- "Lukas"
age <- 34
as.numeric(name)

# convert age to character
as.character(age)

# convert age to logical
as.logical(age)
as.logical(-1)
as.logical(0)

# convert name to logical
as.logical("hello")
as.logical("TRUE")
as.logical("true")
as.logical("T")
as.logical("yes")

## Implicit conversion
# Happens automatically when R knows how to fulfill your demand

5 + 5
5 + "hello"
5 + TRUE
5 + FALSE
5 + "5"

is_smoking <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
sum(is_smoking)
mean(is_smoking)

5 + as.numeric("5")


## List
#
name <- "Lukas"
behav_score <- 45
gender <- "male"
age <- 34
married <- TRUE

name2 <- "Anna"
behav_score2 <- 65
gender2 <- "female"
age2 <- 28
married2 <- FALSE

## Not good - creates a lot of variables

participant1 <- list(name = "Lukas", behav_score = 45,
                     gender = "male", age = 34, married = TRUE)

participant2 <- list(name = "Anna", behav_score = 65,
                     gender = "female", age = 28, married = FALSE)

participant1$behav_score

participant1[2]
class(participant1)

participant1[2] * 10
participant1[2]$behav_score
participant1[[2]]

participant1[["name"]]

# Create a list trial_1 - reaction time 240, money earned = 2, correct decision = TRUE
trial_1 <- list(reaction_time = 240, money = 2, decision = TRUE)
# Create a list trial_2 - reaction time 360, money earned = 1, correct decision = FALSE
trial_1 <- list(reaction_time = 360, money = 1, decision = FALSE)

## Adding fields
trial_1[["good_trial"]] <- TRUE
trial_1$was_helped <- FALSE

# create a new field money_per_second in both trials
trial_1$money_per_second <- trial_1$money/(trial_1$reaction_time/1000)

# REMOVING FIELDS -----
trial_1[["good_trial"]] <- NA
trial_1$was_helped <- NULL
