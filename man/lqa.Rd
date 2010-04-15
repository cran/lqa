\name{lqa}
\Rdversion{1.1}
\alias{lqa}
\alias{lqa.formula}
\alias{lqa.default}
\alias{lqa.update2}
%\alias{lqa.control}
\alias{print.summary.lqa}
\alias{summary.lqa}

\title{Fitting penalized Generalized Linear Models with the LQA algorithm}
\description{`lqa' is used to fit penalized generalized linear models, specified by giving a symbolic description of the 
linear predictor and descriptions of the error distribution and the penalty.}
\usage{
lqa (x, ...)

lqa.update2 (x, y, family = NULL, penalty = NULL, intercept = TRUE, 
             weights = rep (1, nobs), control = lqa.control (), 
             initial.beta, mustart, eta.new, gamma1 = 1, ...)

\method{lqa}{formula}(formula, data = list (), weights = rep (1, nobs), subset, 
            na.action, start = NULL, etastart, mustart, offset, ...)

\method{lqa}{default}(x, y, family = gaussian (), penalty = NULL, method = "lqa.update2", 
            weights = rep (1, nobs), start = NULL, 
            etastart = NULL, mustart = NULL, offset = rep (0, nobs), 
            control = lqa.control (), intercept = TRUE, 
            standardize = TRUE, \dots)

%\method{lqa}{control}(x = NULL, var.eps = .Machine$double.eps, max.steps = 5000, 
%            conv.eps = 0.001, conv.stop = TRUE, c1 = 1e-08, 
%            digits = 5)
}
\arguments{
  \item{formula}{ a symbolic description of the model to be fit. The details of model specification are given below.}
  \item{data}{ an optional data frame containing the variables in the model. If not found in `data', the variables are taken from
          `environment(formula)', typically the environment from which `lqa' is called.}
  \item{family}{ a description of the error distribution and link function to
          be used in the model. This can be a character string naming a
          family function, a family function or the result of a call to
          a family function.  (See \code{family()} for details of family
          functions.)}
  \item{penalty}{ a description of the penalty to be used in the fitting procedure. This must be a penalty object. See \code{\link{penalty}} for details on penalty functions.}
  \item{method}{ a character string naming the function used to estimate the model. 
  The default value \code{method = lqa.update2} applies the LQA algorithm.}
  \item{intercept}{ a logical object whether the model should include an intercept (this is recommended) or not. The default value is TRUE.}
  \item{standardize}{ a logical object, whether the regressors should be standardized (this is recommended) or not. The default value is TRUE.}
  \item{weights}{ an optional vector of weights to be used in the fitting process.}
  \item{start}{ starting values for the parameters in the linear predictor.}
  \item{etastart}{ starting values for the linear predictor.}
  \item{mustart}{ starting values for the vector of means (response).}
  \item{gamma1}{ additional step length parameter used in \code{lqa.update2} to enforce convergence if necessary.}
  \item{offset}{ this can be used to specify an a priori known component to be included in the linear predictor during fitting.}
  \item{control}{ a list of parameters for controlling the fitting process. See the documentation of \code{\link{lqa.control}} for details.}
  \item{na.action}{ a function which indicates what should happen when the data contain `NA's.}
  \item{subset}{ an optional vector specifying a subset of observations to be used in the fitting process.}
  \item{x, y}{ Used in `lqa.default': `x' is a design matrix (with additional column of ones if an intercept should be included in the model) of dimension `n * p', and `y' is a vector of observations of length `n'.}
  \item{initial.beta}{ optional initial values of beta used in the fitting procedures.}
  \item{eta.new}{ optional intial values of predictors used in the fitting procedures.}
  \item{\dots}{ further arguments passed to or from other methods.}
}
\details{
A typical formula has the form `response ~ terms' where 'response' is the (numeric) response vector and `terms' is a series of terms 
which specifies a linear predictor for `response'. The use is similar to that of the \code{glm()} function. 
As there, the right hand side of the model formula specifies the form of the linear predictor and hence gives the 
link function of the mean of the response, rather than the mean of the response directly. 
Per default an intercept is included in the model. If it should be removed then use formulae of the form `response ~ 0 + terms' 
or `response ~ terms - 1'.

Also \code{\link{lqa}} takes a \code{family} argument, which is used to specify the distribution from the exponential 
family to use, and the link function that is to go with it. The default value is the canonical link.
}
\value{
\code{\link{lqa}} returns an object of class \code{lqa} which inherits from the classes \code{glm} and \code{lm}. 

The generic accessor functions \code{coefficients}, \code{fitted.values} and \code{residuals} can be used to 
extract various useful features of the object returned by \code{\link{lqa}}.

Note it is highly recommended to include an intercept in the model (e.g. use \code{Intercept = TRUE}). 
If you use \code{Intercept = FALSE} in the classical linear model then make sure that your \code{y} 
argument is already centered! Otherwise the model would not be valid.

An object of class \code{lqa} is a list containing at least the following components:
  \item{coefficients}{a named vector of unstandardized coefficients.}
  \item{residuals}{the residuals based on the estimated coefficients.}
  \item{fitted.values}{the fitted mean values, obtained by transforming the linear predictors by the inverse of the link function.}
  \item{family}{the \code{family} object used.}
  \item{penalty}{the \code{\link{penalty}} object used, indicating which penalty has been used.}
  \item{linear.predictors}{the linear fit on link scale.}
  \item{deviance}{up to a constant, minus twice the maximimized (unpenalized) log-likelihood.}
  \item{aic}{Akaike's Information Criterion, minus twice the maximized log-likelihood plus twice the trace of the hat matrix
(so assuming that the dispersion is known).} 
  \item{bic}{Bayesian Information Criterion, minus twice the maximized log-likelihood plus log (nobs) times the trace of the hat matrix (so assuming that the dispersion is known).} 
  \item{null.deviance}{deviance of the null model (that only includes a constant)}
  \item{n.iter}{the number of iterations until convergence.}
  \item{best.iter}{the number of iterations until AIC reaches its minimum.}
  \item{weights}{diagonal elements of the weight matrix in GLMs.}
  \item{prior.weights}{the weights as optionally given as argument.}
  \item{df.residual}{the residual degrees of freedom.}
  \item{df.null}{the residual degrees of freedom for the null model.}
  \item{converged}{a logical variable. TRUE if the algorithm indeed converged.}
  \item{mean.x}{The vector of means of the regressors.}
  \item{norm.x}{The vector of Euclidean norms of the regressors.}
  \item{Amat}{The quadratically approximated penalty matrix corresponding to the penalty used.}
  \item{method}{The argument indicating the fitting method.}
  \item{rank}{The trace of the hat matrix.}
  \item{y}{the original response vector used to fit the model.}
  \item{x}{the original regressor matrix (including an intercept if given) used to fit the model.}
  \item{fit.obj}{the fitted object as returned from the fitting method (e.g. from \code{lqa.update2}).}
}
%%\references{
%% ~put references to the literature/web site here ~
%%}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{cv.lqa}}, \code{\link{penalty}}
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

obj1 <- lqa (y ~ X, family = gaussian (), penalty = lasso (1.5), 
             control = lqa.control ())
obj1$coef


set.seed (4321)

n <- 25
p <- 5
X <- matrix (rnorm (n * p), ncol = p)
X[,2] <- X[,1] + rnorm (n, sd = 0.1)
X[,3] <- X[,1] + rnorm (n, sd = 0.1)
true.beta <- c (1, 2, 0, 0, -1)

family1 <- binomial ()
eta.true <- drop (X \%*\% true.beta)
mu.true <- family1$linkinv (eta.true)
prob1 <- sum (as.integer (y > 0)) / n
nvec <- 1 : n
y2 <- sapply (mu.true, function (n.vec) {rbinom (1, 1, mu.true)})

obj2 <- lqa (y2 ~ X, family = binomial (), 
             penalty = fused.lasso (c (0.0001, 0.2)))
obj2$coef}
\keyword{methods}
\keyword{classes}


