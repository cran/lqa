\name{ForwardBoost}
\Rdversion{1.1}
\alias{ForwardBoost}
\title{
  Computation of the ForwardBoost Algorithm
}
\description{
This function fits a GLM based on penalized likelihood inference by the ForwardBoost algorithm. However, it is primarily intended for internal use. You
can access it via the argument setting \code{method = "ForwardBoost"} in \code{\link{lqa}}, \code{\link{cv.lqa}} or \code{\link{plot.lqa}}.
}
\usage{
   ForwardBoost (x, y, family = NULL, penalty = NULL, intercept = 
        TRUE, weights = rep (1, nobs), control = lqa.control (), 
        nu = 1, monotonic = TRUE, \dots)
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
  \item{nu}{
 parameter \eqn{\nu} from the ForwardBoost algorithm. This parameter manages the update step length. See Ulbricht (2010).
}
  \item{monotonic}{
 a logical variable. If \code{TRUE} then the number of active regressors increases monotonically during the iterations. This is in line 
 with the ForwardBoost algorithm and hence recommended.
}
  \item{\dots}{
  further arguments.
}
}
\details{
The ForwardBoost algorithm has been described in Ulbricht (2010). So see there for a more detailed technical description.
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
}
\author{
Jan Ulbricht
}

\seealso{
\code{\link{lqa}}, \code{\link{GBlockBoost}}
}

