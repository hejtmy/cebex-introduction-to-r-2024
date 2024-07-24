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

## Do you think, there is more Murder happening in
# cities or in the countryside?


## Mutations
# Remove the column RAPE from the data

# Remove your favorite fake state (like Delaware) from the dataset

# Create a new colum city_state which is TRUE for states with
# more than 75 percent Urban population
