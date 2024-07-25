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
library(patchwork)
ggplot(df_movies, aes(x = budget)) +
  geom_histogram(bins = 50)

ggplot(df_movies, aes(x = budget)) +
  geom_histogram(binwidth = 5000000)


df_movies %>%
  filter(budget < 100000000) %>%
  ggplot(aes(x = budget)) +
    geom_histogram()


## plot histogram revenues for movies which cost less then 100 mil
df_movies %>%
  filter(budget < 100000000) %>%
  ggplot(aes(x = revenue)) + geom_histogram()

## plot histogram revenues for movies costing more than 100 mil
df_movies %>%
  filter(budget > 100000000) %>%
  ggplot(aes(x = revenue)) +
    geom_histogram()

df_movies %>%
  mutate(budget100 = budget > 100000000) %>%
  ggplot(aes(x = revenue, fill = budget100)) +
    geom_histogram(color = "black")

p1 <- df_movies %>%
  mutate(budget100 = budget > 100000000) %>%
  ggplot(aes(x = revenue, y = after_stat(density), fill = budget100)) +
    geom_histogram(color = "black")

p2 <- df_movies %>%
  mutate(budget100 = budget > 100000000) %>%
  ggplot(aes(x = revenue, y = after_stat(density), color = budget100)) +
    geom_freqpoly()

p3 <- df_movies %>%
  mutate(budget100 = budget > 100000000) %>%
  ggplot(aes(x = revenue, color = budget100)) +
    geom_density()

p1 + p2 + p3

## Scatter plots ----------

ggplot(df_movies, aes(x = budget, y = revenue)) +
  geom_point()

df_movies %>%
  mutate(long_movie = runtime > 150) %>%
  ggplot(aes(x = budget, y = revenue, color = long_movie)) +
    geom_point()


ggplot(df_movies, aes(x = budget, y = revenue)) +
  geom_point() +
  geom_smooth(method = "lm")

df_movies %>%
  mutate(long_movie = runtime > 150) %>%
  ggplot(aes(x = budget, y = revenue, color = long_movie)) +
    geom_point() +
    geom_smooth(method = "lm")

# Are the runtime and vote average related?
ggplot(df_movies, aes(runtime, vote_average)) +
  geom_point()

ggplot(df_movies, aes(vote_average)) +
  geom_histogram()

select(df_movies, vote_count, vote_average)

ggplot(df_movies, aes(vote_count)) +
  geom_histogram() +
  xlim(0, 1000)

## remove values that should nto be there before deciding
df_movies %>%
  filter(vote_count > 100) %>%
  ggplot(aes(x=runtime, y=vote_average)) +
    geom_point() +
    geom_smooth(method = "lm")

df_temp <- df_movies %>%
  filter(vote_count > 100)

summary(lm(vote_average ~ runtime, data = df_temp))

df_movies %>%
  filter(vote_count > 100) %>%
  ggplot(aes(x=runtime, y=vote_average)) +
    geom_point() +
    geom_smooth()

## Create a scatter plot of vote_average and runtime
# Color it by vote_count > 100
# Add regression line

# Create a budget revenue scatter plot
# color it by original language

# remove languanges that appear less than 10 times

