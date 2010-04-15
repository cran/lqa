\name{adaptive.lasso}
\Rdversion{1.1}
\alias{adaptive.lasso}
\title{
Adaptive Lasso Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the adaptive lasso penalty (Zou, 2006).
}
\usage{
adaptive.lasso (lambda = NULL, al.weights = NULL, \dots)
}
\arguments{
  \item{lambda}{
regularization parameter. This must be a nonnegative real number.
}
  \item{al.weights}{ weights used for the adaptive lasso penalty.
}
  \item{\dots}{
further arguments.
}
}
\details{
The adaptive lasso penalty (Zou, 2006) is defined as
\deqn{P_{\tilde{\lambda}}^{al} (\boldsymbol{\beta}) = \lambda \sum_{i=1}^p w_i |\beta_i|,}
    where adaptive weights \eqn{w_i} are used for penalizing different coefficients in the \eqn{L_1}-norm penalty. Based on a root-n-consistent estimator
    \eqn{\hat{\boldsymbol{\beta}}} of the true parameter vector \eqn{\boldsymbol{\beta}}, Zou (2006) uses the weight vector \eqn{\hat\mathbf{w} = (\hat{w}_1,\ldots,\hat{w}_p)^\top} with
\deqn{\hat{w}_j = \frac{1}{|\hat\beta_j|^\gamma}, \quad j = 1, \ldots, p}
    as estimates
    for the adaptive weights, where \eqn{\gamma > 0} can be chosen arbitrarily. In
    the \eqn{n > p} case, the MLE can be used for the estimated weights. In the \eqn{n \ll p}{n << p} case, a ridge penalized MLE with an
    optimized regularization parameter might be a good alternative. You can commit any nonnegative weights by using \code{al.weights} in the initialization of the corresponding \code{penalty} object. If you left it unspecified then \code{al.weights = 1} will be used.
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) regularization parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
   \item{first.derivative}{ function: This returns the p-dimensional vector of the first derivative of the p penalty terms with respect to \eqn{|\beta_i|}. However, this function is not really required for adaptive lasso.}
}
\references{
Zou, H. (2006) The adaptive lasso and its oracle properties. \emph{Journal of the American Statistical Association} \bold{101}, 1418--1429.
}
\author{
Jan Ulbricht
}
\seealso{
  \code{\link{penalty}}, \code{\link{lasso}}
}
%\examples{
%}
