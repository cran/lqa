\name{ridge}
\Rdversion{1.1}
\alias{ridge}
\title{
Ridge Penalty
}
\description{
Object of the \code{\link{penalty}} class to handle the ridge penalty (Hoerl \& Kennard, 1970).
}
\usage{
ridge(lambda = NULL, \dots)
}
\arguments{
  \item{lambda}{
regularization parameter. This must be a nonnegative real number.
}
  \item{\dots}{
further arguments.
}
}
\details{
The `classic' penalty as introduced in Hoerl \& Kennard (1970). The ridge penalty is defined as
\deqn{
P_\lambda^r (\boldsymbol{\beta}) = \lambda \sum_{i=1}^p \beta_j^2.
}
}
\value{
  An object of the class \code{penalty}. This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (nonnegative) regularization parameter.}
   \item{getpenmat}{ function: computes the diagonal penalty matrix.}
}
\references{
Hoerl, A. E. \& R. W. Kennard (1970) Ridge Regression: Bias estimation for nonorthogonal problems. \emph{Technometrics} \bold{12}, 55--67.
}
\author{
Jan Ulbricht
}
\seealso{
\code{\link{penalty}}, \code{\link{lasso}}, \code{\link{penalreg}}, \code{\link{ForwardBoost}}
}
%\examples{
%}

