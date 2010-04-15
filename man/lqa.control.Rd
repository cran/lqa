\name{lqa.control}
\Rdversion{1.1}
\alias{lqa.control}
\title{
 Auxiliary for controlling lqa fitting
}
\description{
Auxiliary function as user interface for \code{\link{lqa}} fitting. Typically only used when calling \code{\link{lqa}} or \code{lqa.update2}.
}
\usage{
   lqa.control (x = NULL, var.eps = .Machine$double.eps, max.steps = 5000, 
            conv.eps = 0.001, conv.stop = TRUE, c1 = 1e-08, 
            digits = 5, \dots)
}
\arguments{
  \item{x}{ object of class 'lqa'. This optional argument is just included to be in line with the S3 class concept.}
  \item{var.eps}{ tolerance in checking for zero variance of some regressors.}
  \item{max.steps}{ maximum number of steps in the lqa algorithm.}
  \item{conv.eps}{ tolerance for convergence break in parameter updating.}
  \item{conv.stop}{ whether or not to stop the iterations when estimated coefficients are converged.}
  \item{c1}{ controls the amount of approximation of linear combinations in the penalty term.}
  \item{digits}{ number of digits of tuning parameter candidates to take into consideration when returning the loss array and mean 
  array in \code{\link{cv.lqa}}.}
  \item{\dots}{ further arguments.}
}
\value{A list with the arguments as components.}
\author{Jan Ulbricht}
\seealso{\code{\link{lqa}}, \code{\link{cv.lqa}}}
\examples{
set.seed (1111)

n <- 200
p <- 5
X <- matrix (rnorm (n * p), ncol = p)
X[,2] <- X[,1] + rnorm (n, sd = 0.1)
X[,3] <- X[,1] + rnorm (n, sd = 0.1)
true.beta <- c (1, 2, 0, 0, -1)
y <- drop (X \%*\% true.beta) + rnorm (n)

control.obj <- lqa.control (max.steps = 200, conv.eps = 1e-3, 
   conv.stop = FALSE)
obj <- lqa (y ~ X, family = gaussian (), penalty = lasso (1.5), 
            control = control.obj)
obj$coef
}
\keyword{misc}


