install.packages("lubridate")

# install ggplot2
# install dplyr

library(ggplot2)
library(dplyr)

packageVersion("ggplot2")
packageVersion("dplyr")

## Searching for package information
library(ggplot2)
library(patchwork)

p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))

p1 + p2

p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
p4 <- ggplot(mtcars) + geom_bar(aes(carb))

(p1 | p2 | p3) /
  p4
