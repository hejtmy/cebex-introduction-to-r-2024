# 1. Create a vector of years between 1924 to 2020
     years <- seq(1924, 2020)

# 2. Create a vector of Chinese zodiac for each year,
#    beginning with rat, repeating 10 times (120 years).
     zodiac_signs <- c("Rat", "Ox", "Tiger", "Rabbit", "Dragon", "Snake",
                       "Horse", "Goat", "Monkey", "Rooster", "Dog", "Pig")
     zodiac_signs <- rep(zodiac_signs, 10)

# 3. Shorten the zodiac vector so it is only of the same length as
#    the years vector. (Select only certain values)
     zodiac_signs <- zodiac_signs[seq(1,97)]
     zodiac_signs <- zodiac_signs[1:length(years)]
     zodiac_signs <- zodiac_signs[seq_len(length(years))]
     zodiac_signs <- zodiac_signs[seq_along(years)]
     zodiac_signs <- zodiac_signs[seq(1, years)]

# 4. What years are “horse” years?
     years[zodiac_signs == "Horse"]

# 5. What sign was year 1987?
     zodiac_signs[years == 1987]

# 6. What is the sum of years for the “rooster”?
     length(years[zodiac_signs == "Rooster"])
     sum(years[zodiac_signs == "Rooster"])

# 7. What is the median year for the “dragon”
     median(years[zodiac_signs == "dragon"])

# 8. What is the 3rd_year of a goat?
    goat_years <- years[zodiac_signs == "Goat"]
    goat_years[3]

    years[zodiac_signs == "Goat"][3]
