
#find min risk portfolio
# return data get from CSV
library(tseries)
library(fPortfolio)


setwd("D:\\Source\\R\\portfolio")


dfReturn <- read.csv("return.csv")

ret <- as.timeSeries(dfReturn)

#
#this will find the min Risk portfolio
#
minriskPortfolio(ret)

#return portfolio with Risk-> min and pm= mean(X)
#portfolio.optim(ret)
