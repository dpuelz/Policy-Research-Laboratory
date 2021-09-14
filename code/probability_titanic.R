# meditteranean diet 
data = read.csv('../data/titanicsurvival.csv')
summary(data)

# summarizing the data counts in contigencey tables!
xtabs(~group + event, data)
xtabs(~sex + group + event, data)
tab = ftable(xtabs(~sex + group + event, data)) # flatten this table
addmargins(tab)
tab
