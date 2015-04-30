#MM

data <- read.csv("mm.csv")

colors <- data$Color
nums <- data$Freq

barplot(nums, main="M&M Freq Distribution My Group", xlab="Colors", ylab="Frequency", 
        names.arg = c("Red", "Yellow", "Brown", "Green", "Blue", "Orange"))

data2 <- read.csv("mm.csv")

colors2 <- data$Color
nums2 <- data$Freq


# tests whether bags are the same
myGroup <- c(B = 15, Br = 8, G = 8, O = 16, R = 8, Y = 4)
chisq.test(myGroup)

otherGroup <- c(B = 14, Br = 4, G = 8, O = 15, R = 7, Y = 8)
probabilities <- c(0.24, 0.14, 0.16, 0.2, 0.12, 0.14)
chisq.test(myGroup)

#boxplot ec doesnt twerk
classMM <- read.csv("classmm.csv")
boxplot(classMM)


#HEIGHT --------------------------------------

heights <- read.csv("heights.csv")

a <- heights$AHeight
b <- heights$BHeight

#freq distribution
ahist <- hist(a, main="Group A Heights (in)", xlab="Inches", ylab="Frequency")
bhist <- hist(b, main="Group B Heights (in)", xlab="Inches", ylab="Frequency")

#probability distribution
aProb <- c(1/19, 2/19, 4/19, 6/19, 2/19, 4/19)
bProb <- c(0.0625, 0.125, 0.375, 0.375, 0, 0.0625)
barplot(aProb, main="Group A Height Probability Distribution", xlab="Inches", ylab="Probability")
barplot(bProb, main="Group B Height Probability Distribution", xlab="Inches", ylab="Probability")

# t-test, p value was 0.8641, so its not even close to a statistically significant
# relationship (meaning sitting by the window does not have a significant effect
# on height)
t.test(a,b,var.equal=FALSE)


# DICE

# of rolls
d = 100000

#role two dice 10 times
dice1 <- sample(6,d,replace=TRUE)
dice2 <- sample(6,d,replace=TRUE)
diceAdd <- dice1 + dice2

hist(diceAdd)


