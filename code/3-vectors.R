# Vector
# All vector member must be of the same class

numbers <- c(1, 2, 3, 4)
numbers_bad <- c(1, "2", "3", 4)
numbers_bad_2 <- c(1, 2, 3, TRUE)
numbers_bad_3 <- c(1, 2, "3", TRUE)

# Everything is a vector
number <- 1
length(number)
length(numbers)
name <- "Lukas"
class(name)
class(numbers_bad)

# Other ways
c() # combine all into 1
1:10
# from 5:100
5:100
# 100 to 55
100:55

## These : are discouraged
?seq
seq_len(96) + 4
seq_along(numbers_bad_2)

# seq_along(x) == seq_len(length(x))
?seq
seq(35, 45, by = 2)
seq(1, 10, by = 20)

# Create a list of potential temperatures from -5 degrees C, to 40 C
# by increments of 0.1
temperatures <- seq(-5, 40, by = 0.1)
temperatures
# same list but it goes from the highest to the lowest
temperatures <- seq(40, -5, by = -0.1)
temperatures

# Characters vectors

# 4 favorite cities plus Prague (somewhere in the middle)
cities <- c("Paris", "Prague", "London", "New York", "Brno")

## repeat
# Create a list of 3 "safe" and 2 "unsafe" characters
c("safe", "safe", "safe", "unsafe", "unsafe")
rep(1, 3)
rep("1", 3)
c(rep("safe", 3), rep("unsafe", 2))

## Lets create a roulette
# Create a variable numbers with roulette numbers 0 to 36
numbers <- 0:36
numbers <- seq(0, 36)
numbers <- seq_len(37) - 1
# create variable colors with "green" and thn "black", "red" repeated
red_black_colors <- c("black", "red")
red_black_colors <- rep(c("black", "red"), 18)
red_black_colors

colors <- c("green", red_black_colors)
colors

df_roulette <- data.frame(colors = colors, numbers = numbers)

## Vector access
length(cities)

## Numeric based indexing/access
cities <- c("Paris", "Prague", "London", "New York", "Brno")
city_safe <-  c(rep("safe", 3), rep("unsafe", 2))

cities[1]
cities[2]
cities[3]
cities[4]
cities[5]

cities[length(cities)]
df_roulette[nrow(df_roulette),]

## Get the first and last element
c(cities[1], cities[length(cities)])

cities[c(1, 5)]
cities[c(1, length(cities))]

## How to get the index?
cities == "London"
which(cities == "London")
which(cities != "London")

i_london <- which(cities == "London")
cities[i_london]

## Is Prague safe?
df_cities <- data.frame(cities, city_safe)
i_prague <- which(cities == "Prague")
city_safe[i_prague]

##
df_cities[which(df_cities$cities == "Prague"), ]
df_cities[which(df_cities$cities != "Prague"), ]

## Which color is 17 in roulette?
i_17 <- which(numbers == 17)
colors[i_17]

## output colors for numbers 15, 14, and 0
colors[c(which(numbers == 15),
         which(numbers == 14),
         which(numbers == 0))]

# `%in%`
colors[which(numbers %in% c(15, 14, 0))]

# Logical indexing
colors[numbers %in% c(15, 14, 0)]

numbers
numbers %in% c(15, 14, 0)

cities == "Prague"
city_safe[cities == "Prague"]

# reassignment of values
# Prague is now considered unsafe
cities == "Prague"
city_safe[cities == "Prague"]
city_safe[cities == "Prague"] <- "UNSAFE NOW!!!!"
city_safe

## Make a city safe
city_safe[cities == "Paris"] <- "safe"

## Change color of value 15 to "not working"
colors[numbers == 15] <- "not working "
