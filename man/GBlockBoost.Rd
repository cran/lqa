\name{GBlockBoost}
\Rdversion{1.1}
\alias{GBlockBoost}
\title{
  Computation of the GBlockBoost Algorithm or Componentwise Boosting
}
\description{
This function fits a GLM based on penalized likelihood inference by the GBlockBoost algorithm. However, it is primarily intended 
for internal use. You 
can access it via the argument setting \code{method = "GBlockBoost"} in \code{\link{lqa}}, \code{\link{cv.lqa}} or \code{\link{plot.lqa}}.
If you use \code{componentwise = TRUE} then componentwise boosting will be applied.
}
\usage{
   GBlockBoost (x, y, family = NULL, penalty = NULL, intercept = 
       TRUE, weights = rep (1, nobs), control = lqa.control (), 
       componentwise, \dots)
}
\arguments{
  \item{x}{
 matrix of standardized regressors. This matrix does not need to include a first column of ones when a GLM with intercept is to be fitted.
}
  \item{y}{
 vector of observed response values.
}
  \item{family}{
 a description of the error distribution and link function to be used in the model. This can be a character string naming a family function,
 a family function or the result of a call to a family function. See \code{family()} for further details.
}
  \item{penalty}{
 a description of the penalty to be used in the fitting procedure, e.g. \code{penalty = lasso (lambda = 1.7)}.
}
  \item{intercept}{
 a logical object indicating whether the model should include an intercept (this is recommended) or not. The default value is 
 \code{intercept = TRUE}.
}
  \item{weights}{
 some additional weights for the observations.
}
  \item{control}{
 a list of parameters for controlling the fitting process. See \code{\link{lqa.control}}.
}
  \item{componentwise}{
 if \code{TRUE} then componentwise boosting will be applied, e.g. there is just a single regressors updated during each iteration. Otherwise
 GBlockBoost will be applied. If this argument is missing and your penalty is \code{\link{ridge}} then it is set to \code{componentwise = TRUE}.
 Note that this will coincide with an application of the RidgeBoost algorithm.
 In all other cases of a missing argument \code{componentwise = FALSE} is used. 
}
  \item{\dots}{
  further arguments.
}
}
\details{
The GBlockBoost algorithm has been introduced in Ulbricht \& Tutz (2008). For a more detailed technical description, 
also for componentwise boosting, see Ulbricht (2010).
}
\value{
\code{GBlockBoost} returns a list containing the following elements:
  \item{coefficients}{ the vector of standardized estimated coefficients.}
  \item{beta.mat}{ matrix containing the estimated coefficients from all iterations (rowwise).}
  \item{m.stop}{ the number of iterations until AIC reaches its minimum.}
  \item{stop.at}{ the number of iterations until convergence.}
  \item{aic.vec}{ vector of AIC criterion through all iterations.}
  \item{bic.vec}{ vector of BIC criterion through all iterations.}
  \item{converged}{ a logical variable. This will be \code{TRUE} if the algorithm has indeed converged.}
  \item{min.aic}{ minimum value of AIC criterion.}
  \item{min.bic}{ minimum value of BIC criterion.}
  \item{tr.H}{ the trace of the hat matrix.}
  \item{tr.Hatmat}{ vector of hat matrix traces through all iterations.}
  \item{dev.m}{ vector of deviances through all iterations.}
}
\references{
Ulbricht, Jan (2010) \emph{Variable Selection in Generalized Linear Models}. Ph.D. Thesis. LMU Munich.

Ulbricht, J. \& G. Tutz (2008) Boosting correlation based penalization in generalized linear models. In Shalabh \& C. Heumann (Eds.) \emph{Recent
Advances in Linear Models and Related Areas}. Heidelberg: Springer.
}
\author{
Jan Ulbricht
}

\seealso{
\code{\link{lqa}}, \code{\link{ForwardBoost}}
}

