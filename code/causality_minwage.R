## ------------------------------------------------------------------------
minwage <- read.csv("../data/minwage.csv") # load the data

dim(minwage)
summary(minwage)

minwageNJ <- subset(minwage, subset = (location != "PA"))
minwagePA <- subset(minwage, subset = (location == "PA"))

mean(minwageNJ$wageBefore < 5.05)
mean(minwageNJ$wageAfter < 5.05)
mean(minwagePA$wageBefore < 5.05)
mean(minwagePA$wageAfter < 5.05)

minwageNJ$fullPropAfter <- minwageNJ$fullAfter /
    (minwageNJ$fullAfter + minwageNJ$partAfter)
minwagePA$fullPropAfter <- minwagePA$fullAfter /
    (minwagePA$fullAfter + minwagePA$partAfter)

mean(minwageNJ$fullPropAfter) - mean(minwagePA$fullPropAfter)

prop.table(table(minwageNJ$chain))
prop.table(table(minwagePA$chain))

minwageNJ.bk <- subset(minwageNJ, subset = (chain == "burgerking"))
minwagePA.bk <- subset(minwagePA, subset = (chain == "burgerking"))

mean(minwageNJ.bk$fullPropAfter) - mean(minwagePA.bk$fullPropAfter)

minwageNJ.bk.subset <-
    subset(minwageNJ.bk, subset = ((location != "shoreNJ") &
                                       (location != "centralNJ")))

mean(minwageNJ.bk.subset$fullPropAfter) - mean(minwagePA.bk$fullPropAfter)

minwageNJ$fullPropBefore <- minwageNJ$fullBefore /
    (minwageNJ$fullBefore + minwageNJ$partBefore)

NJdiff <- mean(minwageNJ$fullPropAfter) - mean(minwageNJ$fullPropBefore)
NJdiff

minwagePA$fullPropBefore <- minwagePA$fullBefore /
    (minwagePA$fullBefore + minwagePA$partBefore)

PAdiff <- mean(minwagePA$fullPropAfter) - mean(minwagePA$fullPropBefore)

NJdiff - PAdiff


minwagePA$fullPropBefore <- minwagePA$fullBefore /
    (minwagePA$fullBefore + minwagePA$partBefore)

PAdiff <- mean(minwagePA$fullPropAfter) - mean(minwagePA$fullPropBefore)

NJdiff - PAdiff

median(minwageNJ$fullPropAfter) - median(minwagePA$fullPropAfter)

NJdiff.med <- median(minwageNJ$fullPropAfter) -
    median(minwageNJ$fullPropBefore)
NJdiff.med

PAdiff.med <- median(minwagePA$fullPropAfter) -
    median(minwagePA$fullPropBefore)
NJdiff.med - PAdiff.med

summary(minwageNJ$wageBefore)
summary(minwageNJ$wageAfter)

IQR(minwageNJ$wageBefore)
IQR(minwageNJ$wageAfter)

quantile(minwageNJ$wageBefore, probs = seq(from = 0, to = 1, by = 0.1))
quantile(minwageNJ$wageAfter, probs = seq(from = 0, to = 1, by = 0.1))

sqrt(mean((minwageNJ$fullPropAfter - minwageNJ$fullPropBefore)^2))
mean(minwageNJ$fullPropAfter - minwageNJ$fullPropBefore)

sd(minwageNJ$fullPropBefore)
sd(minwageNJ$fullPropAfter)

var(minwageNJ$fullPropBefore)
var(minwageNJ$fullPropAfter)