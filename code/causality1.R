## ------------------------------------------------------------------------
# Let's consider an experiment where researchers have a set of resumes, and then change the names at the top to white and black sounding names.  There are 36 different names in total.  4870 total observations, 
resume <- read.csv("../data/resume.csv")

dim(resume)
head(resume)
summary(resume)

race.call.tab <- table(race = resume$race, call = resume$call) 
race.call.tab

addmargins(race.call.tab)

## overall callback rate: total callbacks divided by the sample size
sum(race.call.tab[, 2]) / nrow(resume)

## callback rates for each race
race.call.tab[1, 2] / sum(race.call.tab[1, ]) # black
race.call.tab[2, 2] / sum(race.call.tab[2, ]) # white

race.call.tab[1,]  # the first row
race.call.tab[,2]  # the second column

mean(resume$call) # same as line 15!

## ------------------------------------------------------------------------
# A brief detour into logical variables in R
class(TRUE)

# logicals can be converted to integers with values you would expect!
as.integer(TRUE)
as.integer(FALSE)

x <- c(TRUE, FALSE, TRUE) # a vector with logical values

mean(x) # proportion of TRUEs
sum(x) # number of TRUEs

# Combining logicals.  This follows the standard rules of logic, where you are operating with either TRUE, FALSE, and "and", "or".
FALSE & TRUE
TRUE & TRUE
TRUE | FALSE
FALSE | FALSE
TRUE & FALSE & TRUE

(TRUE | FALSE) & FALSE # the parentheses evaluate to TRUE
TRUE | (FALSE & FALSE) # the parentheses evaluate to FALSE

# We can combine logicals across vectors, component-wise as below.
TF1 <- c(TRUE, FALSE, FALSE)
TF2 <- c(TRUE, FALSE, TRUE)
TF1 | TF2
TF1 & TF2

## ------------------------------------------------------------------------
# Now, we turn to creating logical statements with numerical variables
crazy = (4 < 3)

# note the "double equals" and "not equals" below
"Hello" == "hello"  # R is case-sensitive
"Hello" != "hello"

x <- c(3, 2, 1, -2, -1)
x >= 2
x != 1

## logical conjunction (combining with "and") of two vectors with logical values
test = (x > 0) & (x <= 2)
as.integer(test)
## logical disjunction (combining with "or") of two vectors with logical values
(x > 2) | (x <= -1)

x.int <- (x > 0) & (x <= 2) # logical vector
x.int

mean(x.int) # proportion of TRUEs
sum(x.int)  # number of TRUEs

## ------------------------------------------------------------------------
## callback rate for black-sounding names
mean(resume$call[resume$race == "black"]) 

## race of first 5 observations
resume$race[1:5]  

## comparison of first 5 observations
(resume$race == "black")[1:5] 

dim(resume) # dimension of original data frame

## subset blacks only
resumeB <- resume[resume$race == "black", ] 
dim(resumeB) # this data.frame has fewer rows than the original data.frame
mean(resumeB$call) # callback rate for blacks

## subset whites only
resumeW <- resume[resume$race == "white", ] 
dim(resumeW) # this data.frame has fewer rows than the original data.frame
mean(resumeW$call) # callback rate for blacks

## keep "call" and "firstname" variables 
## also keep observations with black female-sounding names
resumeBf <- subset(resume, select = c("call", "firstname"),
                   subset = (race == "black" & sex == "female"))
head(resumeBf)

## ## an alternative syntax with the same results
## resumeBf <- resume[resume$race == "black" & resume$sex == "female",
##                    c("call", "firstname")]
## black male
resumeBm <- subset(resume, subset = (race == "black") & (sex == "male"))
## white female
resumeWf <- subset(resume, subset = (race == "white") & (sex == "female"))
## white male
resumeWm <- subset(resume, subset = (race == "white") & (sex == "male"))

## racial gaps, now we are computing the difference-in-means also conditioning on gender, ie, hold gender fixed and calculate a difference-in-means between races.
mean(resumeWf$call) - mean(resumeBf$call) # among females
mean(resumeWm$call) - mean(resumeBm$call) # among males

## ------------------------------------------------------------------------
# creating a new variable using an ifelse function!
resume$BlackFemale <- ifelse(resume$race == "black" & 
                                 resume$sex == "female", 1, 0)

# printing out a "3D" table.  race and sex are the rows and columns, respectively, and then give me that table for, first, blackfemales=0, and second, blackfemales=1.
table(race = resume$race, sex = resume$sex,
      BlackFemale = resume$BlackFemale)

## ------------------------------------------------------------------------
resume$type <- NA
resume$type[resume$race == "black" & resume$sex == "female"] <- "BlackFemale"
resume$type[resume$race == "black" & resume$sex == "male"] <- "BlackMale"
resume$type[resume$race == "white" & resume$sex == "female"] <- "WhiteFemale"
resume$type[resume$race == "white" & resume$sex == "male"] <- "WhiteMale"

## check object class
class(resume$type)

## coerce new character variable into a factor variable
resume$type <- as.factor(resume$type)
## list all levels of a factor variable
levels(resume$type)

## obtain the number of observations for each level
# one of the most concise ways to summarize the callback rates
table(resume$type)
tapply(resume$call, resume$type, mean)

## turn first name into a factor variable 
resume$firstname <- as.factor(resume$firstname)
## compute callback rate for each first name
callback.name <- tapply(resume$call, resume$firstname, mean)
## sort the result in the increasing order
sort(callback.name)
