\name{icb}
\Rdversion{1.1}
\alias{icb}
\title{
Improved Correlation-based Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the Improved Correlation-Based (ICB) Penalty (Ulbricht, 2010).
}
\usage{
icb(lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
two dimensional tuning parameter parameter. The first component corresponds to the regularization parameter \eqn{\lambda_1} for the lasso penalty
term, the second one \eqn{\lambda_2} for the correlation-based penalty. Both parameters must be nonnegative.
}
  \item{\dots}{
further arguments
}
}
\details{
The improved correlation-based (ICB) penalty is defined as
\deqn{
P_{\lambda}^{icb}(\boldsymbol{\beta}) = \lambda_1 |\boldsymbol{\beta}|_1 + \frac{1}{2}\lambda_2 \boldsymbol{\beta}^\top \mathbf{M}^{cb} \boldsymbol{\beta},
}
with tuning parameter \eqn{\lambda = (\lambda_1, \lambda_2)}, where \eqn{\mathbf{M}^{cb} = (m_{ij})} is determined by
\eqn{m_{ij} = 2\sum_{s\neq i}\frac{1}{1-\varrho_{is}^2}} if \eqn{i = j}, and \eqn{m_{ij} = -2\frac{\varrho_{ij}}{1-\varrho_{ij}^2}} otherwise.
The ICB has been introduced to overcome the major drawback of the correlation based-penalized estimator, that is its lack of sparsity.
See Ulbricht (2010) for details.
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) regularization parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Ulbricht, Jan (2010) \emph{Variable Selection in Generalized Linear Models}. Ph.D. Thesis. LMU Munich.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{penalreg}}, \code{\link{licb}}, \code{\link{weighted.fusion}}
}
%\examples{
%}

