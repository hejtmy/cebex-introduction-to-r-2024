readLines("data/movies_metadata.csv", 5)

df_movies <- read.csv("data/movies_metadata.csv")
?sample_n
set.seed(52)
df_movies <- df_movies %>% sample_n(10000)
df_movies <- df_movies %>%
  mutate(budget = as.numeric(budget))

head(df_movies)
str(df_movies)

## Preprocessing
mean(df_movies$budget, na.rm = TRUE)

##
summary(df_movies$revenue)
summary(df_movies$budget)


## Remove movies that made 0 or cost 0
df_movies <- df_movies %>%
  filter(budget > 0, revenue > 0)

df_movies %>%
  arrange(-budget) %>%
  select(title, budget, revenue) %>%
  head()

## Histograms -----------
library(ggplot2)

hist(df_movies$revenue, breaks = 100)
hist(df_movies$budget)


## GGPLOT
ggplot(df_movies, aes(x = budget)) +
  geom_histogram(bins = 50)

ggplot(df_movies, aes(x = budget)) +
  geom_histogram(binwidth = 5000000)


df_movies %>%
  filter(budget < 100000000) %>%
  ggplot(aes(x = budget)) +
    geom_histogram()


## plot histogram revenues for movies which cost less then 100 mil

## plot histogram revenues for movies costing more than 100 mil


## Scatter plots


