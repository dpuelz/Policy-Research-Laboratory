#' In this script, we investigate a policing experiment and see how to use the
#' FRT to characterize statistical uncertainty in the DiM estimator of the SATE

# First, load in all of the data
load('../data/Z_police.RData') # treatment assignments
load('../data/network_police.RData') # network
load('../data/outcomes_police.RData') # outcomes of interest

# convert to data frames and reorder rows 
network = as.data.frame(network)
network = network[order(as.numeric(rownames(network))),]

outcomes = as.data.frame(outcomes) 
outcomes = outcomes[order(as.numeric(rownames(outcomes))),]

Z = as.data.frame(Z)

# Let's plot our data first, what are we looking at?
head(network)
plot(network,xlab='',ylab='',pch=19,cex=0.4,col=rgb(0.5,0.5,0.5,alpha=0.5),xaxt='n',yaxt='n',bty='n')

# What do our outcomes look like?  Let's create a "crime index"
head(outcomes)
Y = (outcomes$hmotos +  outcomes$hcarros)*0.221 + 
  outcomes$homicidio*0.550 + outcomes$lesiones*0.112 + 
  outcomes$hpersonas*0.116
names(Y) = rownames(outcomes)
points(network,col=rgb(1,0,0,alpha=0.5),cex=Y,pch=19)

# Let's plot the observed treatment
dim(Z)
Zobs = Z[,1]; names(Zobs) = rownames(Z)
Zobs_long = rep(0,nrow(network)) # need to make a long Z
hotspot_indices = match(names(Zobs),rownames(network)) # indices in network dataframe that correspond to hotspot indices
Zobs_long[hotspot_indices] <- Zobs

plot(network,xlab='',ylab='',pch=19,cex=0.4,col=rgb(0.5,0.5,0.5,alpha=0.5),xaxt='n',yaxt='n',bty='n')
points(network[hotspot_indices,],col='blue',pch=19,cex=0.6)
points(network[which(Zobs_long==1),],col='green',pch=8,cex=0.75)

# What about another, alternative treatment?  Let's write a function
# This function will take in a small Z and output a long Z
treatmentlong = function(Zalt,network,hotspot_indices){
  Zalt
  Zalt_long = rep(0,nrow(network)) 
  Zalt_long[hotspot_indices] <- Zalt
  return(Zalt_long)
}

# A second function that uses the one above for plotting
plottreatment = function(Zalt,network,hotspot_indices){
  Zalt_long = treatmentlong(Zalt,network,hotspot_indices)
  
  plot(network,xlab='',ylab='',pch=19,cex=0.4,col=rgb(0.5,0.5,0.5,alpha=0.5),xaxt='n',yaxt='n',bty='n')  
  points(network[hotspot_indices,],col='blue',pch=19,cex=0.6)
  points(network[which(Zalt_long==1),],col='green',pch=8,cex=0.75)
}

# bringing it all together
plottreatment(Z[,1],network,hotspot_indices)
plottreatment(Z[,2],network,hotspot_indices)
plottreatment(Z[,3],network,hotspot_indices)
plottreatment(Z[,4],network,hotspot_indices)
plottreatment(Z[,5],network,hotspot_indices)


# Now, let's look into estimating some causal effects
# Since randomization is done only on the hotspots, we restrict our outcome vector to just the hotspots
Yobs = Y[hotspot_indices]
DiM = mean(Yobs[which(Zobs==1)]) - mean(Yobs[which(Zobs==0)])

DiM_function = function(Zalt,Y){
  DiM = mean(Y[which(Zalt==1)]) - mean(Y[which(Zalt==0)])
  return(DiM)
}

DiM_observed = DiM_function(Z[,1],Yobs)

# calculate alternative DiM's in a for loop
DiM_alt = c()
for(i in 1:ncol(Z[,-1])){
  DiM_alt = c(DiM_alt,DiM_function(Z[,i+1],Yobs))
}

# calculate alternative DiM's using the apply function
DiM_alt = apply(Z[,-1],2,DiM_function,Y=Yobs)
hist(DiM_alt)
abline(v=DiM_observed,col='blue',lwd=3)
p = mean(DiM_alt<DiM_observed)
min(p,1-p)

# homicides
Yobs = outcomes$homicidio[hotspot_indices]
DiM_alt = apply(Z[,-1],2,DiM_function,Y=Yobs)
DiM_observed = DiM_function(Z[,1],Yobs)
hist(DiM_alt)
abline(v=DiM_observed,col='blue',lwd=3)
p = mean(DiM_alt<DiM_observed)
min(p,1-p)

# car jackings
Yobs = outcomes$hcarros[hotspot_indices]
DiM_alt = apply(Z[,-1],2,DiM_function,Y=Yobs)
DiM_observed = DiM_function(Z[,1],Yobs)
hist(DiM_alt)
abline(v=DiM_observed,col='blue',lwd=3)
p = mean(DiM_alt<DiM_observed)
min(p,1-p)



