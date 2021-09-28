data = read.csv('housedata.csv')
fit = lm(Price~Size,data)
summary(fit)