data = read.csv('../data/housedata.csv')
fit = lm(Price~Size,data)
summary(fit)