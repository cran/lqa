\name{get.Amat}
\Rdversion{1.1}
\alias{get.Amat}
\title{
Computation of the approximated penalty matrix.
}
\description{
 The function \code{get.Amat} computes and returns
\deqn{\mathbf{A}_\lambda = \sum_{j=1}^J \frac{p_{\lambda,j}'(|\mathbf{a}_j^\top \boldsymbol{\beta}|)}{\sqrt{(\mathbf{a}_j^\top \boldsymbol{\beta})^2 + c}}\mathbf{a}_j\mathbf{a}_j^\top,}
 where \eqn{c > 0} is a small real number. However, this function is primarily intended for internal use. It acts as a link between \code{penalty}
 objects and methods which require the approximated penalty matrix \eqn{\mathbf{A}_\lambda}.
}
\usage{
get.Amat (initial.beta = NULL, penalty = NULL, intercept = TRUE, 
     c1 = lqa.control()$c1, x = NULL, \dots)
}
\arguments{
  \item{initial.beta}{ the current beta vector.}
  \item{penalty}{ member of the \code{\link{penalty}} class, the penalty to be used.}
  \item{intercept}{ logical. If `TRUE' an intercept is included in the model.}
  \item{c1}{ double: small positive real number used in the approximation of the linear combinations in the penalty.}
  \item{x}{ optional argument containing the original regressor matrix. This will be used by some penalties, such as \code{\link{penalreg}}
   or \code{\link{ao}}.} 
  \item{\dots}{further arguments.}
}
\details{
See \code{\link{penalty}} or the accompanying `User's Guide' for further details on \eqn{\mathbf{A}_\lambda}.
}
\value{
This function returns a \eqn{(p \times p)}-dimensional matrix or if an intercept is included a \eqn{((p+1) \times (p+1))}-dimensional matrix.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{lqa}}
}
\examples{
   penalty <- lasso (lambda = 1.5)
   beta <- c (1, -2, 3, -4)
   get.Amat (initial.beta = beta, penalty = penalty, intercept = FALSE)
}
\keyword{misc}

