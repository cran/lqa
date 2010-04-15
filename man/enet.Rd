\name{enet}
\Rdversion{1.1}
\alias{enet}
\title{
 Elastic Net Penalty
}
\description{
Object of the \code{\link{penalty}} to handle the elastic net (enet) penalty (Zou \& Hastie, 2005)
}
\usage{
enet (lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
two-dimensional tuning parameter. The first component corresponds to the regularization parameter \eqn{\lambda_1} of the lasso penalty,
the second one to the regularization parameter \eqn{\lambda_2} of the ridge penalty. Both must be nonnegative.
}
  \item{\dots}{
further arguments.
}
}
\details{
 The elastic net penalty has been introduced in the linear model context by Zou \& Hastie (2005).
    The elastic net enables simultaneous automatic variable selection and continuous shrinkage. Furthermore,
     contrary to the lasso
    it can select groups of correlated variables. This is related to the so called grouping effect, where strongly correlated
    regressors tend to be in or out of the model together.

     The \emph{elastic net} penalty
    \deqn{
    P_{\lambda}^{en} (\boldsymbol{\beta}) = \lambda_1 \sum_{i=1}^p |\beta_i| + \lambda_2 \sum_{i=1}^p \beta_i^2, \quad \lambda =
    (\lambda_1, \lambda_2)
}
    is a linear combination of the lasso penalty and the ridge penalty. Therefore the penalty covers these both as extreme cases.
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) tuning parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Zou, H. \& T. Hastie (2005) Regularization and variable selection via the elastic net. \emph{Journal of the Royal Statistical Society B} 
\bold{67}, 301--320.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{genet}}, \code{\link{lasso}}, \code{\link{ridge}}
}
%\examples{
%}
