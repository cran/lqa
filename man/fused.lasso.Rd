\name{fused.lasso}
\Rdversion{1.1}
\alias{fused.lasso}
\title{
  Fused Lasso Penalty
}
\description{
Object of the \code{\link{penalty}} to handle the fused lasso penalty (Tibshirani et al., 2005)
}
\usage{
fused.lasso (lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
two-dimensional tuning parameter. The first component corresponds to the regularization parameter \eqn{\lambda_1} of the lasso penalty,
the second one to the regularization parameter \eqn{\lambda_2} of the fusion penalty. Both must be nonnegative.
}
  \item{\dots}{
further arguments
}
}
\details{
The \emph{fused lasso} penalty is defined as
    \deqn{
    P_{\tilde{\lambda}}^{fl} (\boldsymbol{\beta}) = \lambda_1 \sum_{i=1}^p |\beta_i| + \lambda_2 \sum_{i=2}^p |\beta_{i} - \beta_{i-1}|,
}
    where \eqn{\tilde{\lambda} = (\lambda_1, \lambda_2)} contains two regularization parameters.
    The main idea of the fused lasso penalty is to encourage sparsity in the coefficients by using the \eqn{L_1}-norm lasso penalty, and additionally to
    force sparsity in the differences of the coefficients by the \eqn{L_1}-norm of their differences as reflected in the second penalty term. As a
    result,
    the fused lasso penalty conveys the estimated coefficients to behave in a smooth manner, with only a small number of big jumps.
    See Tibshirani et al. (2005) for further details.
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) regularization parameter.}
      \item{first.derivative}{ function: This returns the J-dimensional vector of the first derivative of the J penalty terms with 
      respect to \eqn{|\mathbf{a}^\top_j\boldsymbol{\beta|}}.}
   \item{a.coefs}{ function: This returns the p-dimensional coefficient vector \eqn{\mathbf{a}_j} of the J penalty terms.}
}
\references{
Tibshirani, R., M. Saunders, S. Rosset, J. Zhu and K. Knight (2005) Sparsity and smoothness via the fused lasso. 
\emph{Journal of the Royal Statistical Society B} \bold{67}, 91--108.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{lasso}}, \code{\link{ridge}}, \code{\link{weighted.fusion}}
}
%\examples{
%}
