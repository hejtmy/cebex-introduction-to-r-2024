# Data frames
df_iris <- iris
class(df_iris)

str(df_iris)

## Accessing columns
df_iris$Species
df_iris[["Species"]]
df_iris[[5]]

## Accessing by position
# df_iris[row, column]

df_iris[, 5]
df_iris[, "Species"]

# create a new data frame with only columns of Species and Sepal.Length
df_iris[c("Petal.Length", "Species")]
df_iris[c(1, 5)]

df_iris[, c("Petal.Length", "Species")]
df_iris[, c(1, 5)]

## US arrests
df_arrests <- USArrests
str(df_arrests)
colnames(df_arrests)
head(df_arrests, n = 3)
head(df_arrests, 3)
tail(df_arrests, 2)

?head

# what is the average murder per 100k citizens across all states
mean(df_arrests$Murder)
mean(df_arrests[["Murder"]])
mean(df_arrests[, "Murder"])

## selecting rows
df_arrests[5, ]

df_arrests[c(5, 10), ]
df_arrests[seq(2, 50, 2), ]

# select only states with UrbanPop below 50
df_arrests$UrbanPop < 50
df_arrests[df_arrests$UrbanPop < 50, ]

df_arrests["California", ]

colnames(df_arrests)
rownames(df_arrests)

## Get a Urban population and Murder rates for California and New York
df_arrests[c("California", "New York"), c("Murder", "UrbanPop")]

## Get a median state Murder rates and select those states where it is higher
median_murder <- median(df_arrests$Murder)
rownames(df_arrests[df_arrests$Murder > median_murder, ])

df_arrests[df_arrests$Murder > median_murder, "UrbanPop"]
df_arrests[df_arrests$Murder > median_murder, ]$UrbanPop
df_arrests[df_arrests$Murder > median_murder, ][["UrbanPop"]]

## Get the outlier states (Top 10 percent and Bottom 10 percent) in Assault
quantile(df_arrests$Assault, probs = 0.5)
median(df_arrests$Assault)

quantile(df_arrests$Assault, probs = c(0.1, 0.9))
quantile(df_arrests$Assault, 0.1)
quantile(df_arrests$Assault, 0.9)

df_arrests[df_arrests$Assault <= quantile(df_arrests$Assault, 0.1), ]
df_arrests[df_arrests$Assault >= quantile(df_arrests$Assault, 0.9), ]

bottom_10 <- quantile(df_arrests$Assault, 0.1)
top_10 <- quantile(df_arrests$Assault, 0.9)

df_arrests[df_arrests$Assault > bottom_10 &
             df_arrests$Assault < top_10, ]

## find out the average Urban population of the top 10 states in Assault
## bottom 10 states in Assault

?order
order(df_arrests$Assault)
df_arrests$Assault

df_arrests_sorted <- df_arrests[order(-df_arrests$Assault), ]
mean(head(df_arrests_sorted, 10))
df_top <- head(df_arrests_sorted, 10)
df_bottom <- tail(df_arrests_sorted, 10)
mean(df_top$UrbanPop)

head(df_arrests_sorted, 10)$UrbanPop
head(df_arrests_sorted, 10)[["UrbanPop"]]
df_arrests_sorted[seq(10), "UrbanPop"]

mean(head(df_arrests_sorted, 10)$UrbanPop)

top_bottom_10 <- rbind(df_top, df_bottom)
mean(top_bottom_10$UrbanPop)

## Do you think, there is more Murder happening in
# cities or in the countryside?
mean(df_arrests[df_arrests$UrbanPop > median(df_arrests$UrbanPop), "Murder"])
mean(df_arrests[df_arrests$UrbanPop < median(df_arrests$UrbanPop), "Murder"])

## Mutations
# Remove the column RAPE from the data
df_arrests$Rape <- NULL

# Remove your favorite fake state (like Delaware) from the dataset
# 'You cannot easilly remove rows, but you can not include them'
# df_arrests["Delaware",] <- NULL # NOT WORKING, crashes
rownames(df_arrests) == "Delaware"
df_arrests[rownames(df_arrests) == "Delaware", ]
df_arrests[rownames(df_arrests) != "Delaware", ]

# Create a new column city_state which is TRUE for states with
# more than 75 percent Urban population and FALSE for the others
df_arrests$city_state <- NULL
df_arrests$city_state <- FALSE
df_arrests$city_state[df_arrests$UrbanPop >= quantile(df_arrests$UrbanPop, 0.75)] <- TRUE
df_arrests$city_state <- (df_arrests$UrbanPop >= quantile(df_arrests$UrbanPop, 0.75))

# Create a column call us_state and set it to TRUE
df_arrests$us_state <- TRUE

# US state column in Ohio is false
df_arrests[rownames(df_arrests) == "Ohio", "us_state"] <- FALSE
df_arrests[rownames(df_arrests) == "Ohio", ]$us_state <- FALSE

## Scale function
a <- scale(df_arrests$UrbanPop)
sd(df_arrests$UrbanPop)

# create a column scaled_assault which has z scores for assault
df_arrests$scaled_assault <- scale(df_arrests$Assault)

# create a new column call assault_outlier which is true if the value is more than
# 2 standard deviations away from the mean (z > 1.5, z < -1.5)
df_arrests$assault_outlier <- df_arrests$scaled_assault > 1.5 | df_arrests$scaled_assault < -1.5
df_arrests$assault_outlier <- abs(df_arrests$scaled_assault) > 1.5

table(df_arrests$assault_outlier)
df_arrests$assault_outlier
df_arrests[df_arrests$assault_outlier == TRUE, ]
df_arrests[df_arrests$assault_outlier, ]

## Pessos incomes

df_pesos <- data.frame(income = sample(seq(10000, 100000, by = 5), 100, replace = TRUE),
                       weights = sample(seq(100), 100, replace = TRUE))
head(df_pesos)
df_pesos$weighted_income <- df_pesos$income * df_pesos$weights/100
