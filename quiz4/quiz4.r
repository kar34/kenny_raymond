# Kenny Raymond
# INFO 370
# Quiz 4

#  1.  Determine the probability of having at least 3 girls in a family of 5 siblings.  
#      (a)  Simulate the result and provide figures.  
#      (b)  Provide a histogram of probabilities for all scenarios (at least 0, 1, 2, 3, 4 and 5 girls in a family of five siblings).

# number of experiments where we pull 5 people from the population
experiments <- c(10,100,1000,10000)

# multiple plots
par(mfrow = c(2, 2))

for (j in 1:4) {
  # number of experiments where we pull 5 people from the population
  n = experiments[j]
  
  # vector for storing successes
  success <- mat.or.vec(n,1)
  
  # total number of times we get at least 3 girls
  girlFreq = 0
  
  # pull five people from the population and see how many are girls
  for (i in 1:n) {
    # sample 5 people, checks to see if at least 3 are girls
    if (sum(rbinom(5,1,0.5)) >= 3) {
      girlFreq = girlFreq + 1
    } 
    success[i] = girlFreq/i
  }
  
  plot(success,ylim=c(0,1),type="h",xlab="number of trials",ylab="relative frequency of girls")
}  

# probability of at least 3 girls: 0.5
dbinom(5, size=5, prob=0.5) + dbinom(4, size=5, prob=0.5) + dbinom(3, size=5, prob=0.5) 

x <- c(0,1,2,3,4,5)
y <- vector()
runningProb <- 0
for (i in 0:5) {
  runningProb = runningProb + dbinom(i, size=5, prob=0.5)
  y <- c(y, (1 - runningProb) + dbinom(0, size=5, prob=0.5))
}

# histogram with probability of atleast x girls in sample of 5 siblings
plot(x,y,ylim=c(0,1),xlim=c(0,5),type="h",xlab="number of girls",ylab="probability")


## --------------------------------------------------------

#  2.  What is the probability of winning a lottery that requires you to pick 6 numbers from 1-49, inclusive?  
#      The 6 numbers are unique so you can't pick the same number twice.    
#      What is the probability of getting at least 3 of them right?  
#      (a)  Simulate the result and provide figures.  
#      (b)  Provide a histogram of successful numbers for all scenarios (at least 1, 2, 3, 4, 5, and 6 numbers correct).

# number of experiments where we pull draw 6 nums
experiments <- c(100,1000,10000,100000)

# multiple plots
par(mfrow = c(2, 2))

for (j in 1:4) {
  # number of experiments 
  n = experiments[j]
  
  # vector for storing successes
  success <- mat.or.vec(n,1)
  
  # total number of times we get at least 3 nums right
  rightFreq = 0
  
  # pull 6 nums and see how many are right
  for (i in 1:n) {
    randomSample <- rbinom(1,49,1/49)
    for (k in 1:5) {
      randomSample <- c(randomSample, rbinom(1,49-k,1/(49-k))) # ensures unique values
    }
    if ('12' %in% randomSample & '18' %in% randomSample & '21' %in% randomSample) {
      rightFreq = rightFreq + 1
    } 
    success[i] = rightFreq/i
  }  
  plot(success,type="l",xlab="number of trials",ylab="relative frequency of at least 3 matches")
}  

# probability of winning the lottery: 9.932116e-11
dbinom(1, size=1, prob=1/49) * dbinom(1, size=1, prob=1/48) * dbinom(1, size=1, prob=1/47) * dbinom(1, size=1, prob=1/46) * dbinom(1, size=1, prob=1/45) * dbinom(1, size=1, prob=1/44)

# same thing only less hard-coded
runningProb <- 1
for (i in 0:5) {
  runningProb = runningProb * dbinom(1, size=1, prob=1/(49-i))
}

numbers <- 49
choices <- 6
matches <- 3

# probability of at least 3 numbers matching ≈ 0.0176504
p = (factorial(choices)/(factorial(matches)*factorial(choices - matches))) * (factorial(numbers - choices)/(factorial(matches)*factorial(numbers - choices - matches))) / (factorial(numbers)/(factorial(choices)*factorial(numbers - choices)))

N = 49
K = 6
M = 6

#equation to determine p of at least M matches in K selections with numbers from 1 to N
(factorial(K)/(factorial(M)*factorial(K - M))) * (factorial(N - K)/(factorial(K - M)*factorial((N - K) - (K - M)))) *1 / (factorial(N)/(factorial(K)*factorial(N - K)))

x <- c(0,1,2,3,4,5, 6)
y <- vector()
for (i in 0:6) {
  # replace M with i
  y <- c(y, (factorial(K)/(factorial(i)*factorial(K - i))) * (factorial(N - K)/(factorial(K - i)*factorial((N - K) - (K - i)))) *1 / (factorial(N)/(factorial(K)*factorial(N - K))))
}

# histogram with probability of atleast x matches in a lottery where 6 nums from 1-49 inclusive are drawn
plot(x,y,ylim=c(0,1),xlim=c(0,6),type="h",xlab="number of matches",ylab="probability")
