## project presentation script

set.seed(1)

groups = read.csv("../data/project_groups_2022.csv",header = T)
ord = sample(1:nrow(groups))

final = cbind(c('Tues','Tues','Tues','Thurs','Thurs'),groups[ord,])
colnames(final) = ''
final
