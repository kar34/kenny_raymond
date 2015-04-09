# imports dataset
Pollution <- read.csv("Pollution.csv")

# grabs the TEMP column and stores in a variable
temp <- Pollution$TEMP

# answer was 55.76341
mean(temp)

# answer was 52.23988
var(temp)

# grabs the WIND column and stores in a variable
wind <- Pollution$WIND

# applies the histogram function
hist(wind)
