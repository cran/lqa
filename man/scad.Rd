\name{scad}
\Rdversion{1.1}
\alias{scad}
\title{
 The SCAD Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the SCAD penalty (Fan \& Li, 2001)
}
\usage{
scad(lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
two-dimensional tuning parameter. The first component corresponds to the regularization parameter \eqn{\lambda} that drives the relevance of the
SCAD penalty for likelihood inference. It must be nonnegative. The second component corresponds to \eqn{a} (see details below). It must be greater 
than two.

}
  \item{\dots}{
further arguments.
}
}
\details{
The \emph{SCAD} penalty is formally defined as
\deqn{
    P_{\tilde{\lambda}}^{sc} (\boldsymbol{\beta}) = \sum_{j=1}^p p_{\tilde{\lambda},j}^{sc} (|\beta_j|), \quad \tilde{\lambda} = (\lambda, s),
}
    where \eqn{p_{\tilde{\lambda},j}^{sc} (|\beta_j|)} is complicated to be specified directly.
    Fan \& Li (2001) just give the penalty by the first derivatives of its components as
    \deqn{
      \frac{d p_{\tilde{\lambda},j}^{sc} (|\beta_j|)}{d |\beta_j|} = \lambda\left\{1_{|\beta_j| \leq \lambda}(|\beta_j|) +
      \frac{(a\lambda - |\beta_j|)_+}{(a-1)\lambda}1_{|\beta_j| > \lambda} (|\beta_j|) \right\},
}
    where we use the notation \eqn{b_+ := \max \{0, b\}} and \eqn{1_A(x)} denotes the indicator function.
    The penalty depends on two tuning parameters, \eqn{\lambda>0} and \eqn{a>2}. 
    It is continuously differentiable in \eqn{\beta_j}, but not in their tuning
    parameters. If \eqn{|\beta_j| \leq \lambda} then the lasso penalty is applied to \eqn{\beta_j}. 
    Afterwards this penalization smoothly clipped apart until
    the threshold \emph{a} is reached. For \eqn{|\beta_j| > a} there is no penalization at all at this coefficient.
    Fan \& Li (2001) suggest to use \eqn{a = 3.7}.
    The SCAD penalty leaves large values of \eqn{\beta_j} not excessively penalized and makes the solution continuous.
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) tuning parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Fan, J. \& R. Li (2001) Variable selection via nonconcave penalized likelihood and its oracle properties. 
\emph{Journal of the American Statistical Association} \bold{96}, 1348--1360.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{lasso}}, \code{\link{ridge}}
}
%\examples{
%}
