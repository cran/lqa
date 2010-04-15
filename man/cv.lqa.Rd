\name{cv.lqa}
\Rdversion{1.1}
\alias{cv.lqa}
\alias{print.cv.lqa}
\title{
  Finding Optimal Tuning Parameter via Cross-Validation or Validation Data
}
\description{
  This function computes optimal tuning parameters for penalized GLMs that can be fitted by \code{\link{lqa}}.
  The optimal tuning parameter minimizes the loss function you have specified in the argument \code{loss.func}.
  However, to find the optimal one this function evaluates model performance for different tuning parameter 
  candidates given in the argument \code{lambda.candidates}. 

If you just give training data then a cross-validation will be applied. If you additionally provide validation 
data (\code{y.vali} and \code{x.vali}) then these will be used for measuring model performance while your training data 
(\code{y.train} and \code{x.train}) are entirely used for model fitting.
 
The \code{\link{cv.lqa}} function also returns \code{best.obj}. That is the \code{lqa} object as returned from \code{\link{lqa}} 
when it has been called with the chosen penalty family and the optimal tuning parameter.
}
\usage{
  cv.lqa(y.train, x.train, intercept = TRUE, y.vali = NULL, 
             x.vali = NULL, lambda.candidates, family, penalty.family, 
             standardize = TRUE, n.fold, cv.folds, 
             loss.func = aic.loss, control = lqa.control(), \dots)
  \method{print}{cv.lqa}(x, ...)
}
\arguments{
  \item{y.train}{
  the vector of response training data.
}
  \item{x.train}{
  the design matrix of training data. If \code{intercept = TRUE} then it does not matter whether a column of ones is already included in \code{x.train} or not. The function adjusts it if necessary.
}
  \item{intercept}{
  logical. If `TRUE' then an intercept is included in the model (this is recommended).
}
  \item{y.vali}{
  an additional vector of response validation data. If given the validation data are used for evaluating the loss function.
}
  \item{x.vali}{
 an additional design matrix of validation data. If given the validation data are used for evaluating the loss function. 
 If \code{intercept = TRUE} then it does not matter whether a column of ones is already included in \code{x.vali} or not. 
 The function adjusts it if necessary.
}
  \item{lambda.candidates}{
 a list containing the tuning parameter candidates. The number of list elements must correspond to the dimension of the
  tuning parameter. See the accompanying `User's Guide' for further details.
}
  \item{family}{
 identifies the exponential family of the response and the link function of the model. See the description of the R function \code{family()} for further details.
}
  \item{penalty.family}{
a function or character argument identifying the penalty family. See examples below.
}
  \item{standardize}{
 logical. If `TRUE' the data are standardized (this is recommended).
}
  \item{n.fold}{
 number of folds in cross-validation. This argument can be omitted if a validation set is used.
}
  \item{cv.folds}{
 a list containing the indices of \code{y.train} to indicate the observations that might be used in the particular cross-validation folds. This can be omitted if a validation set is used. Moreover, it is optional as well if no validation set is given.
}
  \item{loss.func}{
 a character indicating the loss function to be used in evaluating the model performance for the tuning parameter candidates. 
 If it is missing then the \code{aic.loss()} function will be used. See details below.
}
  \item{control}{ a list of parameters for controlling the fitting process. See the documentation of \code{\link{lqa.control}} for details.
}
  \item{x}{ used in the `print' method: a \code{cv.lqa} object as returned by \code{\link{cv.lqa}}.
}
  \item{\dots}{
  Further arguments.
}
}
  
\details{
  This function can be used for evaluating model performance for different tuning parameter candidates. If you just give training data a cross-validation will be applied. If you additionally provide validation data then those data will be used for measuring the performance and the training data are completely used for model fitting. 

You must specify a penalty family. This can be done by giving its name as a character (e.g. \code{penalty.family = "lasso"}) or as a function call
(e.g. \code{penalty.family = lasso}).

The tuning parameter candidates are given in the argument \code{lambda.candidates}. Usually one should a priori generate a sequence of 
equidistant points and then use them as exponents to Euler's number. See example below. 
Note that \code{lambda.candidates} must be a list in order to cope with different numbers of candidates among the elements of the tuning parameter vector.

For evaluation you must specify a loss function. The default value is \code{aic.loss} e.g. the AIC will be used to find an optimal tuning parameter. Other already implemented loss functions are \code{bic.loss}, \code{gcv.loss}, \code{squared.loss} (quadratic loss function), \code{dev.loss} (deviance as loss function). 
}
\value{
The function \code{\link{cv.lqa}} returns an object of class \code{cv.lqa} which is a list with the following components:
 
  \item{lambda.opt}{ the optimal tuning parameter(s).}
  \item{beta.opt}{ the MLE corresponding to the optimal tuning parameter(s).}
  \item{best.pos}{ the positions of the optimal tuning parameter(s) in the \code{lambda.candidates} argument.}
  \item{loss.mat}{ the array containing the loss function values of all tuning parameter candidates (rows) and all folds (columns).}
  \item{best.obj}{ a member of the class \code{\link{lqa}} where to optimal tuning parameters are used. }
  \item{loss.func}{ the loss function used.}
  \item{exist.vali}{ logical whether or not a validation data set has been given as argument.}
  \item{cv.folds}{ the cv.folds (list containing the indices of the training data that has been used in the cross-validation folds) used.}
  \item{n.fold}{ number of folds.}
  \item{mean.array}{ the array containing the mean performances of all tuning parameter candidates.}
  \item{lambda.candidates}{ the original \code{lambda.candidates} argument.}
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{lqa}}, \code{\link{predict.lqa}}
}
\examples{

## Gaussian response + lasso penalty + aic.loss:

set.seed (1111)

n <- 200
p <- 5
X <- matrix (rnorm (n * p), ncol = p)
X[,2] <- X[,1] + rnorm (n, sd = 0.1)
X[,3] <- X[,1] + rnorm (n, sd = 0.1)
true.beta <- c (1, 2, 0, 0, -1)
y <- drop (X \%*\% true.beta) + rnorm (n)

cv.obj1 <- cv.lqa (y, X, intercept = TRUE, 
   lambda.candidates = list (c (0.001, 0.05, 1, 5, 10)), family = gaussian (), 
   penalty.family = lasso, n.fold = 5, 
   loss.func = "aic.loss")
cv.obj1


## Binary response + fused.lasso penalty + dev.loss:

 n <- 100
 p <- 5

 set.seed (1234)
 x <- matrix (rnorm (n * p), ncol = p)
 x[,2] <- x[,1] + rnorm (n, sd = 0.01)
 x[,3] <- x[,1] + rnorm (n, sd = 0.1)
 beta <- c (1, 2, 0, 0, -1)
 prob1 <- 1 / (1 + exp (drop (-x \%*\% beta)))
 y <- sapply (prob1, function (prob1) {rbinom (1, 1, prob1)})

cv.obj2 <- cv.lqa (y, x, family = binomial (), penalty.family =
 fused.lasso, lambda.candidates = list (c (0.001, 0.05, 0.5, 1, 5),
 c (0.001, 0.01, 0.5)), n.fold = 5, loss.func = "dev.loss")
cv.obj2

}
\keyword{methods}
