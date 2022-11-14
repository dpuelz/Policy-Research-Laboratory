set.seed(301)
f=function(x){
  ifelse(x<.2,pnorm(x),-2*x^2+2*x)
}
curve(f,-1,1)

n = 100
xx = runif(n,-1,1)
yy = f(xx) + rnorm(n,0,.04)
points(xx,yy,pch=19,cex=.1)
x.test = seq(-1,1,length.out = 1000)


library(BART)
model = wbart(x.train = xx,y.train = yy,x.test = x.test,ntree=200)


matplot(x.test,t(model$yhat.test),type='l',col=rgb(1,0,0,alpha=0.05),lty=1)
points(xx,yy,pch=19,cex=.8,col=rgb(0,0,0,alpha=0.5),xlab="X",ylab='Y')
# curve(f,-1,1,add=T,col='purple',lwd=1.5)
lines(x.test,model$yhat.test.mean,col=1,type='l',lwd=2.5)
lines(x.test,apply(model$yhat.test,2,quantile,.975),col=1,type='l',lwd=1)
lines(x.test,apply(model$yhat.test,2,quantile,.025),col=1,type='l',lwd=1)
