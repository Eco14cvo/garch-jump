### Testing script ###

### Load libraries ###
### Likelihood-function ###
library("bbmle")

### Load data ###
### Data accessed from Yahoo Finance ###
x<-read.csv("./Data/sp500.csv")
attach(x)

### Data management ###
x$Date<-as.Date(x$Date)

### Sort by date ###
x<-x[order(x$Date),]

### Drop unnessary data ###
x<-x[,c(1,7)]


### Normal dist. ###
mylike<-function(mu=0, sigma=1){
  -sum(stats::dnorm(x[,2],mean=mu, sd=sigma, log=TRUE))
}

