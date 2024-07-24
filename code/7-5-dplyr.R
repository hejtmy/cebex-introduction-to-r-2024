library(dplyr)

# Life expectancy data form the data folder
# df_life <- read.table("data/Life Expectancy Data.csv", sep=",", header=TRUE)

df_life <- read.csv("data/Life Expectancy Data.csv")

## Getting the structure
str(df_life)
glimpse(df_life)

## Select ------

select(df_life, Country, Year, Status, Alcohol)
df_life[, c("Country", "Year", "Status", "Alcohol")]

head(select(df_life, -Country, -Year))
head(select(df_life, -c(Country, Year)))

head(select(df_life, Country:BMI))
head(select(df_life, Country:GDP))
head(select(df_life, -(Population:Schooling)))

head(select(df_life, starts_with("P")))

head(select(df_life, Country, starts_with("P"), -Polio, Alcohol:Measles))

## Filter -------
# select only the developing countries
df_life[df_life$Status == "Developing",]
filter(df_life, Status == "Developing")

df_life[df_life$Status == "Developing" & df_life$Year == 2015, ]

filter(df_life, Year == 2015, Status == "Developing")

# filter countries with BMI above 23 for year 2010
df_life[df_life$Year == 2010 & df_life$BMI > 23,] %>%
  filter(is.na(Year))

filter(df_life, Year == 2010, BMI > 23) %>%
  filter(is.na(Year))


# filter countries wity more than average adult mortality
nrow(filter(df_life, Adult.Mortality > mean(Adult.Mortality, na.rm = TRUE)))

mean(c(1,2,3,4,5))

mean(c(1,2,NA,4,5), na.rm = TRUE)
mean(c(NA, NA, NA, 1, NA), na.rm = TRUE)


## Mutate ------
df_life$BMI_scaled <- scale(df_life$BMI)
df_life$Life.expectancy_scale <- scale(df_life$Life.expectancy)

df_life <- mutate(df_life,
       BMI_scaled = scale(BMI),
       Sick_people = Polio + Diphtheria + HIV.AIDS + Hepatitis.B,
       Life.expectancy_scale = scale(Life.expectancy))

## Pipe --------
filter(df_life, Year == 2010) %>%
  select(Country, BMI)

select(filter(df_life, Year == 2010), Country, BMI)


head(select(mutate(df_life, BMI_scaled = scale(BMI)), Country, BMI_scaled), 5)

df_life %>%
  mutate(BMI_scaled = scale(BMI)) %>%
  select(Country, BMI_scaled) %>%
  head(5)

# Start with life
df_life %>%
# filter for year 2015
  filter(Year == 2015) %>%
# calculate scaled GDP
  mutate(GPD_scaled = scale(GDP)) %>%
# filter only countries with > 2 Z on scaled GDP
  filter(GPD_scaled > 2) %>%
# select only Country name and GDP
  select(Country, GDP) %>%
  arrange(-GDP)

## Arrange -----

## Summarise ---
# Create a summary table data
df_life %>%
  filter(Year == 2010) %>%
  summarise(avg_BMI = mean(BMI, na.rm = TRUE),
            sd_BMI = sd(BMI, na.rm = TRUE),
            avg_life_expectancy = mean(Life.expectancy, na.rm = TRUE),
            sd_life_expectancy = sd(Life.expectancy, na.rm = TRUE))

# Summarise to find the mean of multiple variables using across()
df_life %>%
  summarise(across(c(BMI, Life.expectancy, Polio), \(x) mean(x, na.rm = TRUE),
                   .names = "mean_{col}"))

## Count -------
table(df_life$Year, df_life$Status)

df_life %>%
  count(Year, Status)


df_life %>%
  count(Year, Status, obese = BMI > 28) %>%
  filter(obese)

## Group by ----
df_life %>%
  group_by(Year) %>%
  count(Status)

df_life %>%
  group_by(Year) %>%
  summarise(avg_BMI = mean(BMI, na.rm = TRUE),
            sd_BMI = sd(BMI, na.rm = TRUE),
            avg_life_expectancy = mean(Life.expectancy, na.rm = TRUE),
            sd_life_expectancy = sd(Life.expectancy, na.rm = TRUE))

# calculate averge GDP per country across all years
df_life %>%
  group_by(Country) %>%
  summarise(avg_GDP = mean(GDP, na.rm = TRUE)) %>%
  arrange(-avg_GDP)


