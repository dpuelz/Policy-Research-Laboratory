## project presentation script

set.seed(1)

students = read.csv("../data/students_2022.csv",header = F)
ord = sample(1:nrow(students))

final = cbind(noquote(c(rep('JPE',6),rep('Walmart',6))),students[ord,])
noquote(final)
