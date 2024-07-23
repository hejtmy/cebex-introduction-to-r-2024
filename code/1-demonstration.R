library(ggplot2)
library(dplyr)

df_mpg <- ggplot2::mpg

View(df_mpg)
head(df_mpg)
str(df_mpg)

summary(df_mpg)

?mpg
?head

## plot cty
ggplot(df_mpg, aes(manufacturer, cty)) + geom_boxplot()

ggplot(df_mpg, aes(cty)) +
  geom_histogram(binwidth = 4)

ggplot(df_mpg, aes(as.character(year), cty)) +
  geom_boxplot()

## ANOVA
summary(aov(cty ~ manufacturer, data = df_mpg))
summary(aov(cty ~ trans, data = df_mpg))
summary(aov(cty ~ year, data = df_mpg))

## Preprocessing

df_mpg$cty * 0.425144
df_mpg$cty_kpl <- df_mpg$cty * 0.425144

head(df_mpg)
