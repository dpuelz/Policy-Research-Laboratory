## ------------------------------------------------------------------------
5 + 3
5 - 3
5 / 3
5 ^ 3
5 * (10 - 3)
sqrt(4)

## ------------------------------------------------------------------------
result <- 5 + 3
result
print(result)
result <- 5 - 3
result

david <- "instructor"
david
david <- "instructor and author"
david

Result <- "5"
Result
result

# R is case sensitive, and there are many different types of variables
class(result)
Result
class(Result)
class(sqrt)

## ------------------------------------------------------------------------
# Let's look at the world population in thousands from 1950 to 2010 in 10 year intervals
world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183)
world.pop

pop.first <- c(2525779, 3026003, 3691173)
pop.second <- c(4449049, 5320817, 6127700, 6916183)
pop.all <- c(pop.first, pop.second)
pop.all

# We can extract and access different parts of a vector
world.pop[2]
world.pop[c(2, 4)] 
world.pop[c(4, 2)] 
world.pop[-3]

# We can also convert the vector to different units using mathematical operations
pop.million <- world.pop / 1000
pop.million

# Here, we compute the population rate based off of the 1950 measurement
pop.rate <- world.pop / world.pop[1]
pop.rate

# Now, we look at the rate of increase (percent change)
# this is just (final-initial)/initial * 100 formula in vector form
pop.increase <- world.pop[-1] - world.pop[-7]
percent.increase <- (pop.increase / world.pop[-7]) * 100
percent.increase
percent.increase[c(1, 2)] <- c(20, 22)
percent.increase

## ------------------------------------------------------------------------
# There are many way to extract summary statistics from a given vector
length(world.pop)  
min(world.pop)     
max(world.pop)     
range(world.pop)   
mean(world.pop)    
sum(world.pop) / length(world.pop) 

# we can add names to our vector below
year <- seq(from = 1950, to = 2010, by = 10)
year

# the seq function is useful here to generate a vector from one point to another
seq(to = 2010, by = 10, from = 1950)

seq(from = 2010, to = 1950, by = -10)
2008:2012
2012:2008

names(world.pop) 
names(world.pop) <- year
names(world.pop)
world.pop

## myfunction <- function(input1, input2, ..., inputN) {
## 
##     DEFINE `output' USING INPUTS
## 
##     return(output)
## }
my.summary <- function(x){ # function takes one input
  s.out <- sum(x)
  l.out <- length(x)
  m.out <- s.out / l.out
  out <- c(s.out, l.out, m.out) # define the output
  names(out) <- c("sum", "length", "mean") # add labels
  return(out) # end function by calling output
}
z <- 1:10
my.summary(z)
my.summary(world.pop)
my.summary(rnorm(10000))




