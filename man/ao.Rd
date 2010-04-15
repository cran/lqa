\name{ao}
\Rdversion{1.1}
\alias{ao}
\title{
Approximated Octagon Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the AO penalty (Ulbricht, 2010).
}
\usage{
ao (lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
two dimensional tuning parameter parameter. The first component corresponds to the regularization parameter \eqn{\lambda}. 
This must be a nonnegative real number. The second component indicates the exponent \eqn{\gamma} of the bridge penalty term. See details below.
It must hold that \eqn{\gamma > 1}.
}
  \item{\dots}{
further arguments.
}
}
\details{
The basic idea of the AO penalty is 
to use a linear combination of \eqn{L_1}-norm and the bridge penalty with \eqn{\gamma > 1} where the amount of 
the bridge penalty part is driven by empirical
correlation. So, consider the penalty
\deqn{
    P_{\tilde{\lambda}}^{ao}(\boldsymbol{\beta}) = \sum_{i = 2}^p \sum_{j< i} p_{\tilde{\lambda},ij} 
    (\boldsymbol{\beta}), \quad \tilde{\lambda} = (\lambda, \gamma)
}
where
\deqn{
    p_{\tilde{\lambda},ij} = \lambda[(1 - |\varrho_{ij}|) (|\beta_i| + |\beta_j|) + |\varrho_{ij}|(|\beta_i|^\gamma + |\beta_j|^\gamma)],
}
and \eqn{\varrho_{ij}} denotes the value of the (empirical) correlation of the i-th and j-th regressor. Since we are going to
approximate an octagonal polytope in two dimensions, we will refer to this penalty as \emph{approximated octagon}
(AO) penalty. Note that \eqn{P_{\tilde{\lambda}}^{ao}(\boldsymbol{\beta})} leads to a dominating lasso term if the regressors are uncorrelated and to a
dominating bridge term if they are nearly perfectly correlated.

The penalty can be rearranged as
\deqn{
    P_{\tilde{\lambda}}^{ao}(\boldsymbol{\beta}) = \sum_{i=1}^p p_{\tilde{\lambda},i}^{ao}(\beta_i),
}
where
\deqn{
    p_{\tilde{\lambda},i}^{ao}(\beta_i) = \lambda \left\{|\beta_i|\sum_{j \neq i} (1 - |\varrho_{ij}|) + |\beta_i|^\gamma \sum_{j \neq i} |\varrho_{ij}|\right\}.
}
It uses two tuning parameters \eqn{\tilde{\lambda} = (\lambda, \gamma)}, where \eqn{\lambda} controls the penalty amount and \eqn{\gamma} 
manages the approximation of the pairwise \eqn{L_\infty}-norm.
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
\code{\link{penalty}}, \code{\link{genet}}
}
%\examples{
%}

