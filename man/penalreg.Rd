\name{penalreg}
\Rdversion{1.1}
\alias{penalreg}
\title{
Correlation-based Penalty
}
\description{
Object of the \code{\link{penalty}} to handle the correlation-based penalty  (Tutz \& Ulbricht, 2009).
}
\usage{
penalreg(lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
regularization parameter. This must be a nonnegative real number.
}
  \item{\dots}{
further arguments
}
}
\details{
The method proposed in Tutz \& Ulbricht (2009) and Ulbricht \& Tutz (2008) utilizes the correlation between regressors explicitly in the
penalty term. Coefficients which correspond to pairs of covariates are weighted according to their marginal correlation. The
\emph{correlation-based penalty} is given by
\deqn{
P_{\lambda}^{cb}(\boldsymbol{\beta})  =  \frac{\lambda}{2} \sum_{i=1}^{p-1}\sum_{j > i}\left\{
\frac{(\beta_{i}-\beta_{j})^{2}}{1-\varrho_{ij}} +
\frac{(\beta_{i}+\beta_{j})^{2}}{1+\varrho_{ij}}\right\}
}
where \eqn{\varrho_{ij}} denotes the (empirical) correlation between the i-th and the j-th regressor. It is designed in a
way so that for strong positive correlation \eqn{(\varrho_{ij}\uparrow 1)} the first term becomes dominant having the effect that
estimates for \eqn{\beta_i} and \eqn{\beta_j} are similar \eqn{(\hat\beta_i\approx\hat\beta_j)}. For strong negative correlation
\eqn{(\varrho_{ij}\downarrow -1)} the second term becomes dominant and \eqn{\hat\beta_i} will be close to \eqn{-\hat\beta_j}. The effect is
grouping, highly correlated effects show comparable values of estimates \eqn{(|\hat\beta_i|\approx|\hat\beta_j|)} with the sign being
determined by positive or negative correlation. If the regressors are uncorrelated \eqn{(\varrho_{ij}=0)} one obtains (up to a
constant) the ridge penalty, i.e. \eqn{P_\lambda^{cb}(\boldsymbol{\beta})\propto\lambda\sum_{i=1}^p\beta_i^2}. Consequently, for weakly
correlated data the performance is quite close to the ridge estimator. Therefore, as for the elastic net ridge regression is a
limiting case. 

The correlation-based penalty is a quadratic penalty. Consequently, in general it will not be able to select variables. For this reason there have
been introduced some advanced boosting techniques, such as GBlockBoost or ForwardBoost. See \code{\link{GBlockBoost}} and \code{\link{ForwardBoost}}
for further details.
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) regularization parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Tutz, G. \& J. Ulbricht (2009) Penalized Regression with correlation based penalty. \emph{Statistics and Computing} \bold{19}, 239--253.

Ulbricht, J. \& G. Tutz (2008) Boosting correlation based penalization in generalized linear models. In Shalabh \& C. Heumann (Eds.) \emph{Recent
Advances in Linear Models and Related Areas}. Heidelberg: Springer.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{ridge}}, \code{\link{lasso}}, \code{\link{GBlockBoost}}, \code{\link{ForwardBoost}}
}
%\examples{
%}
