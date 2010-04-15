\name{penalty}
\Rdversion{1.1}
\alias{penalty}
\alias{print.penalty}
\title{Penalty Objects}
\usage{penalty (x, \dots)
}
\arguments{
%  \item{lambda}{ (vector of) tuning parameter(s).}
  \item{x}{ the function \code{\link{penalty}} accesses the \code{penalty} objects which are stored within objects created by modelling functions (e.g. \code{\link{lqa}}).}
%  \item{al.weights}{ weights used for the adaptive lasso penalty. See Zou (2006)}
%  \item{Rmat}{ the empirical correlation matrix. This argument is required for penalties \code{aoa} and \code{penalreg}.}
%  \item{eps}{ the tolerance for modifying exactly correlated regressors in order to compute the correlation-based penalty.}
  \item{\dots}{ further arguments passed to methods.}
}

\description{
  Penalty objects provide a convenient way to specify the details of the penalty terms used by functions for penalized regression 
  problems as in \code{\link{lqa}}. See the documentation for \code{\link{lqa}} for the details on how such model fitting takes place.
}

\details{
  \code{penalty} is a generic function with methods for objects of the \code{lqa} class. 
  The most crucial issue of \code{penalty} objects
  is to compute
   \deqn{
   \mathbf{A}_\lambda = \sum_{j=1}^J \frac{p_{\lambda,j}'(|\mathbf{a}_j^\top \boldsymbol{\beta}|)}{\sqrt{(\mathbf{a}_j^\top \boldsymbol{\beta})^2 + c}}
   \mathbf{a}_j\mathbf{a}_j^\top,
   }
where \eqn{c > 0} is a small real number. This approximated penalty matrix will be used in the fitting procedures \code{lqa.update2}, \code{\link{GBlockBoost}}
or \code{\link{ForwardBoost}}.
  
  
  There are five basic methods for \code{penalty} objects: \code{penalty}, \code{lambda}, \code{getpenmat}, \code{first.derivative}, \code{a.coefs}.
    The methods \code{penalty} and \code{lambda} are mandatory. They
    are necessary to identify the penalty family and, respectively, the tuning parameter vector in the other functions of
    the \code{\link{lqa-package}}. But they just appear as list elements in the \code{structure()} environment. The function
    \code{getpenmat()}
    and the functions \code{first.derivative()} and \code{a.coefs()} are mutually exclusive. Whether we need the first one or the last two depends on
    the nature of the penalty. Hence we have to distinguish two
    cases 
    \enumerate{
        \item{(i)}{The use of a function \code{getpenmat()} is more efficient (in a numerical sense) if
        \itemize{
            \item{\eqn{\bullet}}{the penalty matrix \eqn{\mathbf{A}_\lambda} as given above is a diagonal matrix, e.g. if \eqn{J = p} and 
            \eqn{\mathbf{a}_j, \:j=1,\ldots,J} just contains one non-zero
            element, or}
            \item{\eqn{\bullet}}{the penalty is quadratic.}}
        Then the (approximate) penalty matrix \eqn{\mathbf{A}_\lambda} can be computed directly. Most implemented penalties are of those
        types, e.g. \code{\link{ridge}}, \code{\link{lasso}}, \code{\link{scad}} and \code{\link{penalreg}}.}
        \item{(ii)}{The combination of the functions \code{first.derivative} and \code{a.coefs} is necessary in all other cases. The 
        \code{\link{fused.lasso}} penalty
        is an example for it.}
}
}
\value{
  An object of the class \code{penalty} (which has a concise print method). This is a list with elements
   \item{penalty}{ character: the penalty name.}
   \item{lambda}{ double: the (non-negative) tuning parameter.}
   \item{getpenmat}{ function: the penalty matrix. Note this element is optional. Either \code{getpenmat} or \code{first.derivative} (and if necessary \code{a.coefs}) must be given.}
   \item{first.derivative}{ function: This returns a J dimensional vector of the first derivative of the J penalty terms with respect to \eqn{\xi_j} not(!!!) to \eqn{\mathbf{\beta}}.}
   \item{a.coefs}{ a \eqn{p \times J} matrix containing the coefficients of the linear combinations.}
}


\author{Jan Ulbricht}
\examples{
   penalty <- lasso (lambda = 1.5)
   penalty
   beta <- c (1, -2, 3, -4)
   penalty$first.deriv (beta)
}

\keyword{classes}
