NormalizeCount<-function(x, HKGs, k, drop=0, center=TRUE, round=TRUE, epsilon=1, tolerance=1e-8, isLog=FALSE) {
  
  if(!isLog && !all(sapply(x, is.numeric))) {
    warning(paste0("The expression matrix does not contain counts.\n",
                   "Please, pass a matrix of counts (not logged) or set isLog to TRUE to skip the log transformation"))
  }
  
  if(isLog) {
    Y <- t(x)
  } else {
    Y <- t(log(x+epsilon))
  }
  
  if (center) {
    Ycenter <- apply(Y, 2, function(x) scale(x, center = TRUE, scale=FALSE))
  } else {
    Ycenter <- Y
  }
  if (drop >= k) {
    stop("'drop' must be less than 'k'.")
  }
  m <- nrow(Y)
  n <- ncol(Y)
  svdWa <- svd(Ycenter[, HKGs])
  first <- 1 + drop
  k <- min(k, max(which(svdWa$d > tolerance)))
  W <- svdWa$u[, (first:k), drop = FALSE]
  alpha <- solve(t(W) %*% W) %*% t(W) %*% Y
  correctedY <- Y - W %*% alpha
  if(!isLog && all(sapply(x,is.numeric))) {
    if(round) {
      correctedY <- round(exp(correctedY) - epsilon)
      correctedY[correctedY<0] <- 0
    } else {
      correctedY <- exp(correctedY) - epsilon
    }
  }
  colnames(W) <- paste("W", seq(1, ncol(W)), sep="_")
  return(list(W = W, normalizedCounts = t(correctedY)))
}