\name{weighted.fusion}
\Rdversion{1.1}
\alias{weighted.fusion}
\title{
Weighted Fusion Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the weighted fusion penalty (Daye \& Jeng, 2009)
}
\usage{
weighted.fusion(lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
three-dimensional tuning parameter. The first component corresponds to the regularization parameter \eqn{\lambda_1} of the lasso penalty.
The second component corresponds to the regularization parameter \eqn{\lambda_2} of the fusion penalty. Both components must be nonnegative.
The third component corresponds to \eqn{\gamma > 0} that determines the fusion penalty.
}
  \item{\dots}{
further arguments.
}
}
\details{
Another extension of correlation-based penalization has been proposed by Daye \& Jeng (2009). They introduce the
\emph{weighted fusion penalty} to utilize the correlation information from the data by penalizing the pairwise differences of
coefficients via correlation-driven weights. As a consequence, highly correlated regressors are allowed to be treated similarly
in regression. The weighted fusion penalty is defined as
\deqn{
    P_{\lambda}^{wf}(\boldsymbol{\beta})= \lambda_1 \sum_{j=1}^p|\beta_j| + P_{\lambda_2}^{cd} (\boldsymbol{\beta}),
}
where
\deqn{
    P_{\lambda_2}^{cd}(\boldsymbol{\beta}) = \frac{\lambda_2}{p}\sum_{i < j} \omega_{ij} \{\beta_i - \textrm{sign} (\varrho_{ij})\beta_j\}^2
}
is referred to as \emph{correlation-driven penalty} function. Daye \& Jeng (2009) propose to use
\deqn{
    \omega_{ij} = \frac{|\varrho_{ij}|^\gamma}{1 - |\varrho_{ij}|},
}
where \eqn{\gamma > 0} is an additional tuning parameter. Consequently, the weighted fusion penalty consists of three tuning
parameters \eqn{\lambda = (\lambda_1, \lambda_2, \gamma)}. The effect is that \eqn{\omega_{ij} \rightarrow \infty} as \eqn{|\varrho_{ij}|
\rightarrow 1} so that the correlation-driven penalty function tends to equate the
magnitude of the coefficients of the corresponding regressors \eqn{x_i} and \eqn{x_j}. Note that the lasso penalty term in
the weighted fusion penalty is responsible for variable selection.
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) regularization parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Daye, Z. J. \& X. J. Jeng (2009) Shrinkage and model selection with correlated variabeles via weighted fusion. \emph{Computational Statistics
and Data Analysis} \bold{53}, 1284--1298.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{penalreg}}, \code{\link{icb}}, \code{\link{licb}}, \code{\link{ForwardBoost}}
}
%\examples{
%}
