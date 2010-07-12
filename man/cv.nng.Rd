\name{cv.nng}
\Rdversion{1.1}
\alias{cv.nng}
\alias{nng.update}
\alias{nnls}
\alias{nnls2}
\title{
  Finding Optimal Tuning Parameter via Cross-Validation or Validation Data for non-negative garrote penalization
}
\description{
  This function computes optimal tuning parameters for GLMs with non-negative garrote penalization that can be fitted by the algorithm described in Ulbricht (2010), Subsection 3.4.1.
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
  cv.nng(y.train, x.train, intercept = TRUE, y.vali = NULL, 
             x.vali = NULL, lambda.nng, family, penalty, 
             standardize = TRUE, n.fold, cv.folds, 
             loss.func = aic.loss, control = lqa.control(), \dots)
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
  \item{lambda.nng}{
 a list containing the tuning parameter candidates for the non-negative garrote penalization. 
}
  \item{family}{
 identifies the exponential family of the response and the link function of the model. See the description of the R function \code{family()} for further details.
}
  \item{penalty}{
 a description of the penalty to be used in the fitting procedure. This must be a penalty object. See \code{\link{penalty}} for details on penalty functions.
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
  This function can be used for evaluating model performance of different tuning parameter candidates for the non-negative garrote penalty. If you just give training data a cross-validation will be applied. If you additionally provide validation data then those data will be used for measuring the performance and the training data are completely used for model fitting. 

If the non-negative garrote estimate might be based on the maximum likelihood estimator (MLE) then you can leave the argume \code{penalty} unspecified. Otherwise, e.g. if you want to apply a ridge penalty, you should specify it as follows, e.g. \code{penalty = ridge (lambda.opt)}, where \code{lambda.opt} is the optimized ridge regularization parameter as determined from a previous cross-validation procedure.

For evaluation you must specify a loss function. The default value is \code{aic.loss} e.g. the AIC will be used to find an optimal tuning parameter. Other already implemented loss functions are \code{bic.loss}, \code{gcv.loss}, \code{squared.loss} (quadratic loss function), \code{dev.loss} (deviance as loss function). 
}
\value{
The function \code{\link{cv.nng}} returns an object of class \code{cv.lqa} which is a list with the following components:
 
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
\references{
Ulbricht, Jan (2010) \emph{Variable Selection in Generalized Linear Models}. Ph.D. Thesis. Ludwig Maximilians University Munich.
}
\seealso{
\code{\link{lqa}}, \code{\link{predict.lqa}}
}
\examples{

set.seed (1234)

n <- 50
p <- 5
X <- matrix (rnorm (n * p), ncol = p)
X[,2] <- X[,1] + rnorm (n, sd = 0.1)
X[,3] <- X[,1] + rnorm (n, sd = 0.1)
true.beta <- c (1, 2, 0, 0, -1)
y <- drop (X \%*\% true.beta) + rnorm (n)

family1 <- binomial ()
eta.true <- drop (X \%*\% true.beta)
mu.true <- family1$linkinv (eta.true)
nvec <- 1 : n
y2 <- sapply (nvec, function (nvec) {rbinom (1, 1, mu.true[nvec])})


nng.obj <- cv.nng (y.train = y2, x.train = X, lambda.nng = 
             list (c (0.01, 0.1, 1, 5, 10)), family = binomial (), 
             n.fold = 5, penalty = NULL)

cv.obj <- cv.lqa (y.train = y2, x.train = X, lambda.candidates = 
             list (c (0.01, 0.1, 1, 5, 10)), family = binomial (), 
             n.fold = 5, penalty = ridge)

lambda.opt <- cv.obj$lambda.opt
nng.obj2 <- cv.nng (y.train = y2, x.train = X, lambda.nng = 
             list (c (0.01, 0.1, 1, 5, 10)), family = binomial (), 
             n.fold = 5, penalty = ridge (lambda.opt))

coef (nng.obj$best.obj)
coef (cv.obj$best.obj)
coef (nng.obj2$best.obj)

}
\keyword{methods}
