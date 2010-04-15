\name{plot.lqa}
\Rdversion{1.1}
\alias{plot.lqa}
\title{
  Coefficient build-ups for penalized GLMs
}
\description{
  This function plots coefficient build-ups for GLMs that can be estimated with \code{\link{lqa}}.
}
\usage{
 plot.lqa (x, y, family, penalty.family, intercept = TRUE, 
   standardize = TRUE, lambdaseq = NULL, offset.values = NULL, 
   show.standardized = FALSE, add.MLE = TRUE, control = lqa.control(), 
   plot.type = "l", ret.true = FALSE, really.plot = TRUE, \dots)
}
\arguments{
  \item{x}{ the augmented design matrix. It must contain a column of ones if an intercept is included in the model.
}  
\item{y}{ the vector of observed responses.
}
  \item{family}{ a description of the error distribution and link function to
          be used in the model. This can be a character string naming a
          family function, a family function or the result of a call to
          a family function.  (See \code{family} for details of family
          functions.)
}
  \item{penalty.family}{
a function argument identifying the penalty family. See examples below.
}
  \item{intercept}{ 
a logical object whether the model should include an intercept (this is recommended) or not. The default value is TRUE.
}
  \item{standardize}{ 
a logical object, whether the regressors should be standardized (this is recommended) or not. The default value is TRUE.
}
  \item{lambdaseq}{
 a sequence of tuning parameter candidates for the dimension you want to plot.
}
  \item{offset.values}{
a vector of the same dimension as your tuning parameter. At the position of the dimension you want to plot there must be entry `NA'. 
The other positions should be filled with given (and fixed) tuning parameter values, as e.g. returned from \code{\link{cv.lqa}}. See examples below.
}
  \item{show.standardized}{ logical. If `TRUE' the standardized coefficients are plotted, otherwise the unstandardized coefficients are plotted.
}
  \item{add.MLE}{ logical. If `TRUE' the unrestricted MLE is also plotted. Note this only works for `n > p' settings. 
  Otherwise this argument is set to `FALSE' automatically.
}
  \item{control}{ list of control parameters as returned by \code{\link{lqa.control}}. See there for details.
}
  \item{plot.type}{ determines the line type.}
  \item{ret.true}{ logical. If `TRUE' then \code{plot.lqa} returns a list \code{ret.obj} with the abscissa 
  (\code{s1}) and ordinate (\code{beta.mat}) values of the coefficient build-up.}
  \item{really.plot}{ logical. If `FALSE' then \code{plot.lqa} just computes and returns the \code{ret.obj} object. 
}
  \item{\dots}{ further arguments.}
}
\details{
This function plots coefficient build-ups for a given dimension of your tuning parameter(s). The argument \code{lambdaseq} can be omitted. 
In this case a default sequence \code{lambdaseq <- exp (seq (-10, 6, length = 60)} is used. 
If your penalty consists of more than one tuning parameter you must identify the relevant dimension to plot 
using \code{offset.values} where you state the fixed values for the other tuning parameters.
See examples below for further details.
}
\value{
This returns a \code{plot} object, if \code{really.plot = TRUE}, or \code{ret.obj}, if \code{really.plot = FALSE}.
}
\author{
Jan Ulbricht
}


\seealso{
\code{\link{lqa}}, \code{\link{cv.lqa}}
}
\examples{
set.seed (434534)
family <- binomial ()

nobs <- 50
nvars <- 5
beta.true <- c (1, 2, 0, 0, -1)
intercept <- TRUE
standardize <- TRUE

x <- matrix (rnorm (nvars * nobs), ncol = nvars)
x[,2] <- x[,1] + rnorm (nobs, sd = 0.1)
x[,3] <- x[,1] + rnorm (nobs, sd = 0.2)

eta.true <- drop (x \%*\% beta.true)
mu.true <- family$linkinv (eta.true)
vec1 <- 1 : nobs
y <- sapply (mu.true, function (vec1) {rbinom (1, 1, vec1)})

pdf ("fusedlasso_lambda1.pdf", width = 6, height = 6)   
    # here lambda1 'lambda1' is getting varied:
plot.lqa (y = y, x = x, family = binomial (), penalty.family = fused.lasso, 
          offset.values = c (NA, 0.2), add.MLE = FALSE, really.plot = TRUE)
dev.off ()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{hplot}

