\name{genet}
\Rdversion{1.1}
\alias{genet}
\title{
  Generalized Elastic Net Penalty
}
\description{
Object of the \code{\link{penalty}} to handle the Generalized Elastic Net (GENET) penalty (Ulbricht, 2010).
}
\usage{
genet (lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
three-dimensional tuning parameter. The first component corresponds to the regularization parameter \eqn{\lambda}. 
This must be a nonnegative real number. The second component \eqn{0 \leq \alpha \leq 1} drives the linear combination of \eqn{L_1} penalty 
and the bridge penalty.
The third component indicates the exponent \eqn{\gamma} of the bridge penalty term. See details below.
It must hold that \eqn{\gamma > 1}.
}
  \item{\dots}{
further arguments.
}
}
\details{
The GENET penalty can be defined as
\deqn{
    P_{\bar{\lambda}}^{genet}(\boldsymbol{\beta}) = \lambda \left\{\alpha \sum_{i=1}^p |\beta_i| + (1-\alpha)
    \sum_{i=1}^p |\beta_i|^\gamma \right\}, \quad 0 \leq \alpha \leq
1, \: \gamma > 1
}
with tuning parameter vector \eqn{\bar{\lambda} = (\lambda, \alpha, \gamma)}. 

The regularization parameter \eqn{\lambda} determines the overall relevance of the GENET penalty. The balance between \eqn{L_1}-norm penalization, 
and hence variable selection, and
bridge penalization for incorporating the grouping effect is managed by an overall tuning parameter \eqn{\alpha}.
For motivation and further details on the GENET penalty see Ulbricht (2010).
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) tuning parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Ulbricht, Jan (2010) \emph{Variable Selection in Generalized Linear Models}. Ph.D. Thesis. LMU Munich.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{ao}}
}
%\examples{
%}


