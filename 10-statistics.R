library(dplyr)
library(ggplot2)

set.seed(52)
df_movies <- read.csv("data/movies_metadata.csv")
df_movies <- df_movies %>%
  sample_n(10000) %>%
  mutate(budget = as.numeric(budget)) %>%
  filter(budget > 0, revenue > 0, runtime > 0)

# Observing relationships -----


## Normal distribution --------
df_movies %>%
  ggplot(aes(x = revenue)) +
    geom_histogram()

qqnorm(df_movies$revenue)
qqline(df_movies$revenue)

df_movies %>%
  ggplot(aes(x = vote_average)) +
    geom_histogram()

qqnorm(df_movies$vote_average)
qqline(df_movies$vote_average)

## correlation ----------------
# What is the relationship between budget and a revenue
cor(df_movies$budget, df_movies$revenue)
cor.test(df_movies$budget, df_movies$revenue)
cor(df_movies$budget, df_movies$revenue, method = "spearman")

## Regression -----------------
lm_revenue_budget <- lm(revenue ~ budget, data = df_movies)
summary(lm_revenue_budget$coefficients)

plot(lm_revenue_budget)
performance::check_model(lm_revenue_budget)

lm_revenue_budget <- lm(revenue ~ budget + vote_average, data = df_movies)
summary(lm_revenue_budget)

df_movies$budget_2 <- df_movies$budget^2

lm_revenue_budget <- lm(revenue ~ budget + budget_2, data = df_movies)
summary(lm_revenue_budget)

# papaja::apa_print(lm_revenue_budget)$table

# Comparing means -----
df_movies$long <- df_movies$runtime > 150

## Two means comparisons
ggplot(df_movies, aes(x = long, y = vote_average)) +
  geom_boxplot() +
  geom_jitter(width = 0.25, alpha = 0.2)

qqnorm(df_movies$vote_average[df_movies$long])
qqline(df_movies$vote_average[df_movies$long])

df_movies %>%
  filter(vote_count > 4) %>%
  ggplot(aes(sample = vote_average)) +
    geom_qq() +
    facet_wrap(~long)

df_movies_filtered <- filter(df_movies, vote_count > 4)
t.test(vote_average ~ long, data = df_movies_filtered)
ggplot(df_movies_filtered, aes(x = long, y = vote_average)) +
  geom_boxplot()

## ANOVA ---------------------
common_language <- count(df_movies, original_language) %>%
  filter(n > 10) %>%
  pull(original_language)
df_movies_common <- filter(df_movies, original_language %in% common_language)

ggplot(df_movies_common, aes(x = original_language, y = vote_average)) +
  geom_boxplot() +
  geom_jitter(width = 0.25, alpha = 0.2)

aov_language <- aov(vote_average ~ original_language, data = df_movies_common)
summary(aov_language)
TukeyHSD(aov_language)

# Categorical testing --
chisq.test()
