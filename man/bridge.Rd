\name{bridge}
\Rdversion{1.1}
\alias{bridge}
\title{
Bridge Penalty
}
\description{
Object of the \code{\link{penalty}} to handle the bridge penalty (Frank \& Friedman, 1993, Fu, 1998)
}
\usage{
bridge (lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
two dimensional tuning parameter parameter. The first component corresponds to the regularization parameter \eqn{\lambda}. 
This must be a nonnegative real number. The second component indicates the exponent \eqn{\gamma} of the penalty term.
It must hold that \eqn{\gamma > 1}.
}
  \item{\dots}{
further arguments.
}
}
\details{
  The \emph{bridge} penalty has been introduced in Frank \& Friedman (1993). See also Fu (1998). It is defined as
    \deqn{
    P_{\tilde{\lambda}}^{br} (\boldsymbol{\beta}) = \lambda \sum_{i=1}^p |\beta_i|^\gamma, \quad \gamma > 0,
}
    where \eqn{\tilde{\lambda} = (\lambda, \gamma)}.
    It features an additional tuning parameter \eqn{\gamma} that controls the degree of preference for the
    estimated coefficient vector to align with the original, hence standardized, data axis directions in the regressor
    space.
     It comprises the lasso penalty (\eqn{\gamma = 1}) and the ridge penalty (\eqn{\gamma = 2}) as special cases.
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) regularization parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Frank, I. E. \& J. H. Friedman (1993) A statistical view of some chemometrics regression tools (with discussion). 
\emph{Technometrics} \bold{35}, 109--148.

Fu, W. J. (1998) Penalized Regression: the bridge versus the lasso. \emph{Journal of Computational and Graphical Statistics} \bold{7}, 397--416.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{lasso}}, \code{\link{ridge}}, \code{\link{ao}}, \code{\link{genet}}
}
%\examples{
%}

