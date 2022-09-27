# Example 1: binomial for airline no shows
# Parameters
P = 0.09
N = 140

# Create a grid of k's
k_grid = seq(0, 30, by=1)

# Probability mass function of binomial
dbinom(k_grid, N, P)

barplot(dbinom(k_grid, N, P), names.arg = k_grid,
        xlab='Number of no shows',
        ylab='Probability')

# Left tail area
sum(dbinom(0:5, N, P))
sum(dbinom(12:140, N, P)) # this is the answer to our question on the slides!
1 - pbinom(11, size=N, prob=P) # using the cumulative distribution function instead

# Example 2: Poisson for soccer scores
x_grid = 0:7

dpois(x_grid, 1.6)

barplot(dpois(x_grid, 1.6), names.arg = x_grid,
        cex.names=1.1, las=1, ylim=c(0,0.35),
        xlab='Goals',
        ylab='Probability', main="UT: Poisson(1.6)")

barplot(dpois(x_grid, 1.3), names.arg = x_grid,
        cex.names=1.1, las=1, ylim=c(0,0.35),
        xlab='Goals',
        ylab='Probability', main="Texas Tech: Poisson(1.3)")


# Simulate lots of games according to these Poissons
NMC = 100000
UT = rpois(NMC, 1.6)
Tech = rpois(NMC, 1.3)

# Compile the results
xtabs(~UT + Tech)
results_table = xtabs(~UT + Tech)/NMC
results_table

# Monte Carlo estimates of probabilities
sum(UT > Tech)/NMC
sum(UT == Tech)/NMC
sum(UT < Tech)/NMC

# Compare with a calculation from the PMF assuming independence
dpois(1, 1.6) * dpois(1, 1.3) # UT 1 - 1 Texas Tech
dpois(2, 1.6) * dpois(0, 1.3) # UT 2 - 0 Texas Tech

# A cool figure for those who want to geek out with R graphics
my_cols = grey(seq(1, 0.5, length=15))
my_breaks = seq(0, 0.12, length=16)
image(0:5, 0:5, results_table[1:5,1:5],
      xlim=c(-0.5, 5.5), 
      ylim=c(-0.5, 5.5),
      col=my_cols, breaks=my_breaks,
      las=1, bty='n',
      main="Probability of outcomes for the \nUT vs. Texas Tech match",
      ylab='UT goals',
      xlab="Texas Tech goals")

abline(h=-0.5 + 0:6, lty='dotted')
abline(v=-0.5 + 0:6, lty='dotted')
for(i in 1:6) {
  for(j in 1:6) {
    text(i-1, j-1, results_table[i,j])
    if(i > j) {
      rect(i-1.5,j-1.5,i-0.5, j-0.5, border='blue', lwd=2) 
    }
  }
}

# Example 3: Functions for continuous variables
# normal random variables
hist(rnorm(1000,mean=0,sd=1),col='gray',freq = FALSE)
K = 3
pnorm(3,mean=0,sd=1) # cumulative density function, calculate P(x<=K) for one value of K

# show PDF and CDF next to each other
ii = seq(-3,3,length.out=1000)
plot(ii,pnorm(ii,mean=0,sd=1),type='l',xlab='')
par(mfrow=c(1,2))
hist(rnorm(10000,mean=0,sd=1),col='gray',freq = FALSE,xlab='',main='PDF of Normal')
plot(ii,pnorm(ii,mean=0,sd=1),type='l',xlab='',main='CDF of Normal')

# example of adding a line on top of a histogram
dev.off()
X = runif(1000)
hist(X)
hist_data <- hist(X)
counts = hist_data$counts
breaks = hist_data$breaks
breaks_new = breaks[-length(breaks)]  + (breaks[-1] - breaks[-length(breaks)])/2
lines(breaks_new,counts,lwd=3,lty=2,col='red')
abline(v=0.8,col=2,lwd=3)


