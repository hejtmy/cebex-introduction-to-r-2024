# Des function

summary()

# For categorical variables
table()
count()

## Load the Life expectancy
df_life <- read.csv("data/Life Expectancy Data.csv")

# Load the necessary packages first
library(dplyr)

## Examine the file using head, summary, glimpse functions
head(df_life)
summary(df_life)
df_life %>% count(Country)
table(df_life$Country)
unique(df_life$Country)
length(unique(df_life$Country))

## Calculate averge and median Life.expectancy per each country
df_life %>%
  group_by(Country) %>%
  summarise(mean = mean(Life.expectancy, na.rm = TRUE),
            median = median(Life.expectancy, na.rm = TRUE))

## Calculate average and median of GDP for each country for only years after >=2011
df_life %>%
  filter(Year >= 2011) %>%
  group_by(Country) %>%
  summarise(mean = mean(GDP, na.rm = TRUE),
            median = median(GDP, na.rm = TRUE))


## count how many times each country appears in the list from years >=2011
df_life %>%
  filter(Year >= 2011) %>%
  count(Country) %>%
  filter(n == 5)

# filter those which appear 5 times
df_good_countries <- df_life %>%
  filter(Year >= 2011) %>%
  count(Country) %>%
  filter(n == 5)

# select those countries names and save them into variable "good_countries"
good_countries <- df_good_countries$Country

good_countries <- df_life %>%
  filter(Year >= 2011) %>%
  count(Country) %>%
  filter(n == 5) %>%
  pull(Country)

good_countries == df_life$Country
head(df_life$Country, 10)
head(good_countries, 10)

df_life$Country %in% good_countries

## Create a dataframe df_life_good with only data from years 2011+ and
# the good countries
df_life_good <- df_life %>%
  filter(Year >= 2011, Country %in% good_countries) %>%
  # from this table, select all columns except the ones with diseases and
  # save into df_life_good
  select()

# Descriptives ---------
# Using df_life_good, calculate average, and sd and median for Total expenditure,
# Life expectancy and BMI for each country

