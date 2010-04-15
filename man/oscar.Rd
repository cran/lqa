\name{oscar}
\Rdversion{1.1}
\alias{oscar}
\title{
  OSCAR Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the OSCAR penalty (Bondell \& Reich, 2008)
}
\usage{
oscar (lambda = NULL, ...)
}
\arguments{
  \item{lambda}{
two-dimensional tuning parameter. The first component corresponds to the regularization parameter \eqn{\lambda} that drives the relevance of the
OSCAR penalty for likelihood inference. The second component corresponds to \eqn{c} (see details below)
Both must be nonnegative.
}
  \item{\dots}{
further arguments
}
}
\details{
Bondell \& Reich (2008) propose a shrinkage method for linear models called OSCAR that simultaneously select variables while grouping them
    into predictive clusters. The OSCAR penalty is defined as
    \deqn{
  P_{\tilde{\lambda}}^{osc}(\boldsymbol{\beta}) = \lambda\left( \sum_{k=1}^p |\beta_k| + c \sum_{j < k} \max\{|\beta_j|, |\beta_k|\} \right),
  \quad \tilde{\lambda} = (\lambda, c)
}
where \eqn{c \geq 0} and \eqn{\lambda > 0} are tuning parameters with c controlling the relative weighting of the \eqn{L_\infty}-norms and \eqn{\lambda}
controlling the magnitude of penalization. The \eqn{L_1}-norm entails sparsity, 
while the pairwise maximum (\eqn{L_\infty}-)norm encourages equality of coefficients.

 Due to equation (3) in Bondell \& Reich (2008), we use the alternative formulation 
    \deqn{
     P_{\tilde{\lambda}}^{osc}(\boldsymbol{\beta}) = \lambda \sum_{j=1}^p \{c(j-1) + 1\}|\beta|_{(j)},
}
    where \eqn{|\beta|_{(1)} \leq |\beta|_{(2)} \leq \ldots \leq |\beta|_{(p)}} denote the ordered absolute values of the coefficients.  However, there
    could be some difficulties in the LQA algorithm since we need an ordering of regressors which can differ between two adjacent iterations.
    In the worst case, this can lead to oscillations and hence to no convergence of the algorithm. Hence, for the OSCAR penalty it is recommend to
    use \eqn{\gamma < 1}, e.g. \eqn{\gamma = 0.01} when to apply \code{lqa.update2} for fitting the GLM in order to facilitate convergence.
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
Bondell, H. D. \& B. J. Reich (2008) Simultaneous regression shrinkage, variable selection and clustering of predictors with oscar. 
\emph{Biometrics} \bold{64}, 115--123.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{lasso}}, \code{\link{fused.lasso}}, \code{\link{weighted.fusion}}
}
%\examples{
%}
