\name{lasso}
\Rdversion{1.1}
\alias{lasso}
\title{
Lasso Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the lasso penalty (Tibshirani, 1996).
}
\usage{
lasso (lambda = NULL, ...)
}
\arguments{
  \item{lambda}{
regularization parameter. This must be a nonnegative real number.
}
  \item{\dots}{
further arguments
}
}
\details{
The `classic' penalty that incorporates variables selection. As introduced in Tibshirani (1996) the lasso penalty is defined as
\deqn{
P_\lambda^r (\boldsymbol{\beta}) = \lambda \sum_{i=1}^p |\beta_j|.
}
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) regularization parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Tibshirani, R. (1996) Regression shrinkage and selection via the lasso. \emph{Journal of the Royal Statistical Society B} \bold{58}, 267--288.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{ridge}}, \code{\link{penalreg}}
}
%\examples{
%}


