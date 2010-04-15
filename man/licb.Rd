\name{licb}
\Rdversion{1.1}
\alias{licb}
\title{
L1-Norm based Improved Correlation-based Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the L1-Norm based Improved Correlation-Based (LICB) Penalty (Ulbricht, 2010).
}
\usage{
licb (lambda = NULL, ...)
}
\arguments{
  \item{lambda}{
two-dimensional tuning parameter parameter. The first component corresponds to the regularization parameter \eqn{\lambda_1} for the lasso penalty
term, the second one \eqn{\lambda_2} for the \eqn{L_1}-norm based correlation penalty term. Both parameters must be nonnegative.
}
  \item{\dots}{
further arguments
}
}
\details{
The improved correlation-based (LICB) penalty is defined as
\deqn{
P_{\lambda}^{licb}(\boldsymbol{\beta}) =  \lambda_1 \sum_{i=1}^p |\beta_i| + \lambda_2 \sum_{i=1}^{p-1} \sum_{j > i}
    \left\{\frac{|\beta_i - \beta_j|}{1 - \varrho_{ij}} + \frac{|\beta_i + \beta_j|}{1 + \varrho_{ij}}\right\}.
}
The LICB has been introduced to overcome the major drawback of the correlation based-penalized estimator, that is its lack of sparsity.
See Ulbricht (2010) for details.
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
Ulbricht, Jan (2010) \emph{Variable Selection in Generalized Linear Models}. Ph.D. Thesis. LMU Munich.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{penalreg}}, \code{\link{icb}}, \code{\link{weighted.fusion}}
}
%\examples{
%}

