## Numbers
# sequence of temperatures of - 10 to 40 C by 0.25
temperatures <- seq(-10, 40, by = 0.25)

# statistical functions
mean(temperatures)
median()
range()
var()
sd()
summary(temperatures)

# Randomization functions
set.seed(100)
sample(temperatures)
sample(temperatures, 5)
participants_ids <- seq(1, 50)
control_subjects <- sample(participants_ids,
                           length(participants_ids)/2)


## Roulette randomization
set.seed(200)
numbers <- seq(0, 36)
red_black_colors <- rep(c("black", "red"), 18)
colors <- c("green", red_black_colors)

# Randomly select a number and return its color 5 times
pulled_number <- sample(numbers, 1)
index <- (numbers == pulled_number)
colors[index]

colors[numbers %in% sample(numbers, 10)] # short same version



