# Kenny Raymond
# INFO 370
# Lab 6

# probability of a success
probs <- .5 
nOfTrials <- c(10,100,1000,10000)
nofGraphs <- 4

# plotting
par(mfrow = c(2,2))

for (i in 1:nofGraphs) {
  number <- nOfTrials[i] 
  tails = 0
  success <- mat.or.vec(number,1)
  
  #tossing
  for (okkk in 1:number) {
    if(rbinom(1, 1, probs) == 1) {
      tails = (tails + 1); 
    }
    success[okkk] = (tails/okkk)
  }
  
  plot(success,ylim=c(0,1),type="l")
}











