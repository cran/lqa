\name{predict.lqa}
\Rdversion{1.1}
\alias{predict.lqa}
\alias{print.pred.lqa}
\title{
Prediction Method for lqa Fits
}
\description{
This function computes predictions based on an \code{lqa} object.
}
\usage{

  \method{predict}{lqa}(object, new.x = NULL, new.y = NULL, 
          weights = rep(1, n.newobs), \dots)

  \method{print}{pred.lqa}(x, \dots)
}

\arguments{
  \item{object}{ a fitted object of class \code{lqa}. Usually this will be an object returned from the function \code{\link{lqa}}.}
  \item{new.x}{ Optionally, a new data frame from which to make the predictions. If omitted, the fitted linear predictors are used.
  Note, if given \code{new.x} must have the same number of entries as the estimated coefficient vectors has. That is it must include \eqn{\hat\beta_0}
  if your model includes an intercept.}
  \item{new.y}{ Optionally, a vector of new responses. If given, the deviance can be computed.}
  \item{weights}{ an optional vector including weights of the new observations.}
  \item{x}{ an object of class \code{pred.lqa} as returned from \code{\link{predict.lqa}}.}
  \item{\dots}{ additional arguments.} 
 }
\value{
  \code{predict.lqa} returns an object of class \code{pred.lqa}, i.e. this is a list with the following elements
  
  \item{deviance}{ the deviance based on the new observations. This element is NULL if new.y = NULL, i.e. no new responses are used in \code{\link{predict.lqa}}.}
  \item{tr.H}{ the trace of the hat matrix of the design matrix used to fit the model. This is just an extraction from the \code{lqa.obj} object that is used as argument of the internal loss functions.}
  \item{n.newobs}{ the number of new observations.}
  \item{eta.new}{ the estimated new predictors.}
  \item{mu.new}{ the estimated new responses.}
  \item{lqa.obj}{ the \code{lqa.obj} argument.}
  \item{new.y}{ the \code{new.y} argument.}
}
\author{
Jan Ulbricht
}
\seealso{
 \code{\link{lqa}}, \code{\link{cv.lqa}}
}
\examples{
set.seed (1111)

n <- 200
p <- 5
X <- matrix (rnorm (n * p), ncol = p)
X[,2] <- X[,1] + rnorm (n, sd = 0.1)
X[,3] <- X[,1] + rnorm (n, sd = 0.1)
true.beta <- c (1, 2, 0, 0, -1)
y <- drop (X \%*\% true.beta) + rnorm (n)

cv.obj1 <- cv.lqa (y, X, intercept = TRUE, lambda.candidates = 
   list (c (0.001, 0.05, 1, 5, 10), c (0.1, 0.5, 1)), family = gaussian (), 
   penalty.family = fused.lasso, loss.func = "gcv.loss")
cv.obj1

beta0.hat <- coef (cv.obj1$best.obj)[1]   # extracts the estimated intercept
pred.obj <- predict.lqa (cv.obj1$best.obj, new.x = c (beta0.hat, 1, 2, 3, 4, 5))
pred.obj

cv.obj2 <- cv.lqa (y, X, intercept = TRUE, lambda.candidates = 
   list (c (0.001, 0.05, 1, 5, 10), c (0.1, 0.5, 1)), family = gaussian (), 
   penalty.family = fused.lasso, n.fold = 5, loss.func = "squared.loss")
cv.obj2

beta0.hat <- coef (cv.obj2$best.obj)[1]  # extracts the estimated intercept
predict.lqa (cv.obj2$best.obj, new.x = cbind (beta0.hat, matrix (1 : 10, nrow = 2)))
}
\keyword{methods}


