# find min risk portfolio
# return data get from CSV
library(tseries)
library(quadprog)


#read return data from CSV
dfReturn <- read.csv("return.csv")

#convert return data to tseries
ret <- as.timeSeries(dfReturn)



#
# this method return the portfolio with minimum risk
# using quadprog
# Minimize    VAR(X)
#
portf.minRisk <- function(ret)
{
  #covariance matrix
  covMatrix <- cov(ret)
  n <- ncol(ret)
  
  # data for solve.QP
  bvec <- c(1, rep(0, n))
  dvec <- rep(0,n)
  A <- rbind(rep(1, n), diag(n))
  
  qp <- solve.QP( Dmat=covMatrix, dvec = -dvec, Amat = t(A), bvec = bvec, meq = 1)
  
  #get the data from the result of optimization
  p.pw <- qp$solution
  
  meanRet <- base::colMeans(ret) # meanRet = the mean return of each asset
  # mean return of portfolio
  p.pm <- sum(meanRet*w)
  
  #risk of the portfolio
  p.sd <- sqrt(t(w) %*% covMatrix %*% w)
  
  list(pw=p.pw, pm=p.pm, ps=p.sd[1,1])
    
}


#test the min risk function to minimize the portfolio risk

#portf.minRisk(ret)





