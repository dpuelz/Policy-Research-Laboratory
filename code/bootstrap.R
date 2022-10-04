## Bootstrapping example

library(mosaic)

creatinine = read.csv("../data/creatinine.csv", header=TRUE)
head(creatinine)

### Bootstrapping the sample mean

# Look at the mean creatinine clearance rate
mean(creatinine$creatclear)

# OK, 125.25 +/- what?
# Bootstrap to get a standard error
boot1 = do(10000)*{
  mean(resample(creatinine)$creatclear)
}

hist(boot1$result, 30)
sd(boot1$result)

# Interpetation: our sample mean is probably off from the true population mean by about 0.95 units

# confidence interval: a range of plausible values for the population parameter, in light of the sample estimate
confint(boot1, level=0.95)


#### Bootstrapping the OLS estimator
plot(creatclear~age, data=creatinine,
     pch=19, col='grey', bty='n',
     ylab="creatinine score", xlab="Age")

lm1 = lm(creatclear~age, data=creatinine)
abline(lm1, lwd=2, col='blue')
coef(lm1)

# Bootstrap
boot1 = do(10000)*lm(creatclear~age, data=resample(creatinine))
head(boot1)

hist(boot1$Intercept)
hist(boot1$age)

# bootstrapped standard errors
sd(boot1$Intercept)
sd(boot1$age)
summary(lm1)

# confidence intervals
confint(boot1)


# Going back to power demand
# What about an additional variable?
KHOU_squared = load_combined$KHOU^2
load_combined$KHOU_squared = KHOU_squared
numboot = 200
lm2 = do(numboot)*(lm(COAST ~ KHOU + KHOU_squared, data=resample(load_combined)))

plot(load_combined$KHOU,load_combined$COAST,col=rgb(0,0,0,alpha=0.1),pch=19,cex=0.8)
x = load_combined$KHOU
xmin = floor(min(x))
xmax = floor(max(x))
xnew = seq(xmin,xmax,length.out=500)
quadfit = array(NA,c(numboot,length(xnew)))
for(ii in 1:numboot){
  quadfit[ii,] = lm2$Intercept[ii] + lm2$KHOU[ii]*xnew +   lm2$KHOU_squared[ii]*xnew^2
  lines(xnew,quadfit[ii,],col=rgb(1,0,0,alpha=0.3),lwd=1)
}

# smaller sample
load_combined_small = sample(load_combined,500)
KHOU_squared = load_combined_small$KHOU^2
load_combined_small$KHOU_squared = KHOU_squared
numboot = 200
lm2 = do(numboot)*(lm(COAST ~ KHOU + KHOU_squared, data=resample(load_combined_small)))

plot(load_combined_small$KHOU,load_combined_small$COAST,col=rgb(0,0,0,alpha=0.1),pch=19,cex=0.8)
x = load_combined_small$KHOU
xmin = floor(min(x))
xmax = floor(max(x))
xnew = seq(xmin,xmax,length.out=500)
quadfit = array(NA,c(numboot,length(xnew)))
for(ii in 1:numboot){
  quadfit[ii,] = lm2$Intercept[ii] + lm2$KHOU[ii]*xnew +   lm2$KHOU_squared[ii]*xnew^2
  lines(xnew,quadfit[ii,],col=rgb(1,0,0,alpha=0.3),lwd=1)
}



