## ------------------------------------------------------------------------
minwage <- read.csv("minwage.csv") # load the data

dim(minwage) # dimension of data
summary(minwage) # summary of data

## subsetting the data into two states
minwageNJ <- subset(minwage, subset = (location != "PA"))
minwagePA <- subset(minwage, subset = (location == "PA"))

## proportion of restaurants whose wage is less than $5.05
mean(minwageNJ$wageBefore < 5.05) # NJ before
mean(minwageNJ$wageAfter < 5.05)  # NJ after
mean(minwagePA$wageBefore < 5.05) # PA before
mean(minwagePA$wageAfter < 5.05)  # PA after

## create a variable for proportion of full-time employees in NJ and PA
minwageNJ$fullPropAfter <- minwageNJ$fullAfter /
    (minwageNJ$fullAfter + minwageNJ$partAfter)
minwagePA$fullPropAfter <- minwagePA$fullAfter /
    (minwagePA$fullAfter + minwagePA$partAfter)

## compute the difference in means
mean(minwageNJ$fullPropAfter) - mean(minwagePA$fullPropAfter)

## ------------------------------------------------------------------------
prop.table(table(minwageNJ$chain))
prop.table(table(minwagePA$chain))

## subset Burger King only
minwageNJ.bk <- subset(minwageNJ, subset = (chain == "burgerking"))
minwagePA.bk <- subset(minwagePA, subset = (chain == "burgerking"))

## comparison of full-time employment rates
mean(minwageNJ.bk$fullPropAfter) - mean(minwagePA.bk$fullPropAfter)

minwageNJ.bk.subset <-
    subset(minwageNJ.bk, subset = ((location != "shoreNJ") &
                                       (location != "centralNJ")))

mean(minwageNJ.bk.subset$fullPropAfter) - mean(minwagePA.bk$fullPropAfter)

## ------------------------------------------------------------------------
## full-time employment proportion in the previous period for NJ
minwageNJ$fullPropBefore <- minwageNJ$fullBefore /
    (minwageNJ$fullBefore + minwageNJ$partBefore)

## mean difference between before and after the minimum wage increase
NJdiff <- mean(minwageNJ$fullPropAfter) - mean(minwageNJ$fullPropBefore)
NJdiff

## full-time employment proportion in the previous period for PA
minwagePA$fullPropBefore <- minwagePA$fullBefore /
    (minwagePA$fullBefore + minwagePA$partBefore)
## mean difference between before and after for PA
PAdiff <- mean(minwagePA$fullPropAfter) - mean(minwagePA$fullPropBefore)
## difference-in-differences
NJdiff - PAdiff

## full-time employment proportion in the previous period for PA
minwagePA$fullPropBefore <- minwagePA$fullBefore /
    (minwagePA$fullBefore + minwagePA$partBefore)
## mean difference between before and after for PA
PAdiff <- mean(minwagePA$fullPropAfter) - mean(minwagePA$fullPropBefore)
## difference-in-differences
NJdiff - PAdiff

## ------------------------------------------------------------------------
## cross-section comparison between NJ and PA
median(minwageNJ$fullPropAfter) - median(minwagePA$fullPropAfter)
## before and after comparison
NJdiff.med <- median(minwageNJ$fullPropAfter) -
    median(minwageNJ$fullPropBefore)
NJdiff.med
## median difference-in-differences
PAdiff.med <- median(minwagePA$fullPropAfter) -
    median(minwagePA$fullPropBefore)
NJdiff.med - PAdiff.med

## summary shows quartiles as well as minimum, maximum, and mean
summary(minwageNJ$wageBefore)
summary(minwageNJ$wageAfter)
## interquartile range
IQR(minwageNJ$wageBefore)
IQR(minwageNJ$wageAfter)

## deciles (10 groups)
quantile(minwageNJ$wageBefore, probs = seq(from = 0, to = 1, by = 0.1))
quantile(minwageNJ$wageAfter, probs = seq(from = 0, to = 1, by = 0.1))

## ------------------------------------------------------------------------
sqrt(mean((minwageNJ$fullPropAfter - minwageNJ$fullPropBefore)^2))
mean(minwageNJ$fullPropAfter - minwageNJ$fullPropBefore)

## standard deviation
sd(minwageNJ$fullPropBefore)
sd(minwageNJ$fullPropAfter)
## variance
var(minwageNJ$fullPropBefore)
var(minwageNJ$fullPropAfter)