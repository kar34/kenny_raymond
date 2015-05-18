# Kenny Raymond
# INFO 370
# Prob Set 2

# QUESTION 1 --------
# I am looking to see if there is a statistical difference in student/faculty ratios between public and private schools
# source: http://mathforum.org/workshops/sum96/data.collections/datalibrary/data.set6.html
private <- read.csv("private.csv")
public <- read.csv("public.csv")

ratioPrivate <- private$Student.faculty.Ratio
ratioPublic <- public$Student.Faculty.Ratio

mean(ratioPrivate, na.rm=TRUE) # 9.97
mean(ratioPublic, na.rm=TRUE) # 16.59

median(ratioPrivate, na.rm=TRUE) # 10
median(ratioPublic, na.rm=TRUE) # 17

max(tabulate(match(ratioPrivate, unique(ratioPrivate)))) # private mode: 24
max(tabulate(match(ratioPublic, unique(ratioPublic)))) # public mode: 18

var(ratioPrivate, na.rm=TRUE) # 5.68596
var(ratioPublic, na.rm=TRUE) # 7.981717

sd(ratioPrivate, na.rm=TRUE) # 2.384525
sd(ratioPublic, na.rm=TRUE) # 2.825193

quantile(ratioPrivate, c(.25,.75), na.rm=TRUE) # IQR: 9-11
quantile(ratioPublic, c(.25,.75), na.rm=TRUE) # IQR: 14-19

mean(ratioPrivate, na.rm=TRUE) / sd(ratioPrivate, na.rm=TRUE) # coefficient of variation: 4.181126
mean(ratioPublic, na.rm=TRUE) / sd(ratioPublic, na.rm=TRUE) # coefficient of variation: 5.872165

t.test(ratioPrivate, ratioPublic)$p.value

# because the p-value is smaller that .01 (using a .01 level of significance), I can conclude private/public schools have
# a statistical effect on student to faculty ratio.

# QUESTION 2 --------

points <- c(90,95,89,71,73,96,87,95,107,89,96,80,97,95,102,97,93,101,82,83,74,91,83,98,95,111,99,120,93,84)

# a: 92.2 points
mean <- mean(points)

# b: no, likely close, but not exactly equal because while a sample can give you an indication of a population parameter, it won't tell you the exact value

# c: ≈ 1.977
standard_error <- sd(points) / sqrt(length(points))

# d: the standar error tells you the average likely error a sample mean will be from the population mean
#    this is helpful when determining confidence intervals and when making inferences about a population
#    based on a sample

# e: 95% confident population mean is between 88.33 and 96.07

margin_of_error <- (1.96 * sd(points)) / sqrt(length(points))
upper_bound <- mean + margin_of_error
lower_bound <- mean - margin_of_error

# f: There is a 95% chance that the population mean is between 88.33 and 96.07 points per game.

# QUESTION 3 --------

male <- c(220.1,218.6,229.6,228.8,222.0,224.1,226.5)
female <- c(223.4,221.5,230.2,224.3,223.8,230.8)

# for this question, we want to conduct a 2 tailed, unpaired t-test, assuming unequal variances
t.test(male,female)

# during this test, the p value came out to 0.54. using a confidence interval of 95%, we would need 
# a p value of under 0.05 in order to say there is a difference between the means. so for this test, 
# we fail to reject the null hypothesis, meaning that the means do not have a statistical difference.
# furthermore, you can say being a male or female does not have a statistically significant effect on
# cholesterol levels

# QUESTION 4 --------

# a: no, the interpretation is incorrect because with a p value of 0.04 and significance level of 0.05, 
#    you reject the null hypothesis, which states there is no effect. with these results, you conclude
#    that the new treatment had a statistically significant effect on recorvery rate

# b: yes, this interpretation is correct because as stated in the previous question, you've shown that 
#    the new treatment had a statistically significant effect on recorvery rate

# c: no this conclusion is incorrect. the probability of a type one error (saying the null hypothesis is 
#    rejected when it should be failed to reject) is the same of alpha (the significance level), which is
#    0.05, so the probability of committing a type 1 error is 0.05, not 0.04

# d: this conclusion is incorrect because a type II error occurs when you fail to reject the null when 
#    it is indeed false. even if you failed to reject the the null you cannot calculate the probability of 
#    a type II error without the population mean, which we do not know

# e: this conclusion is correct because a p value of 0.04 is larger than the level of significance of 0.01.
#    if the p value is higher than the level of significance you have to fail to reject the null

# QUESTION 5 --------

bloodA <- c(248, 236, 269, 254, 249, 251, 260, 245, 239, 255)
bloodB <- c(380, 391, 377, 392, 398, 374)
adjustedBloodA <- bloodA * 1.5

wilcox.test(adjustedBloodA,bloodB)

# p value is 0.1471, so we reject the null hypothesis and conclude that 
# the red blood cells of person B are not 1.5 times the volume of person A