\name{lqa-package}
\Rdversion{1.1}
\alias{lqa-package}
\docType{package}
\title{
Fitting GLMs based on penalized likelihood inference.
}
\description{The \code{lqa} package is designed to fit Generalized Linear Models (GLMs) based on penalized likelihood inference. 
That is we assume our objective to be
\deqn{
  \min_{\mathbf{b}} - \ell (\mathbf{b}) + P_\lambda (\boldsymbol{\beta}),
}
where \eqn{\ell(\mathbf{b})} is the log-likelihood of the underlying GLM with unknown coefficient vector 
\eqn{\mathbf{b} = (\beta_0, \boldsymbol{\beta}^\top)^\top} and the penalty term has structure
\deqn{
   P_{\lambda} (\boldsymbol{\beta}) = \sum_{j=1}^J p_{\lambda,j} (|\mathbf{a}_j^\top \boldsymbol{\beta}|)
}
with known vectors of constants \eqn{\mathbf{a}_j}. 
The subscript
\eqn{\boldsymbol{\lambda}} illustrates the dependency on a vector of tuning parameters. This structure allows for many different penalty terms,
including polytopes (such as lasso, fused lasso, LICB) and quadratic penalties (ridge, penalreg etc.).

The main important fitting procedure is the LQA algorithm. Alternatively, you can apply GBlockBoost (including RidgeBoost as 
special case when you use the arguments \code{penalty = ridge} and \code{componentwise = TRUE}) or ForwardBoost. 
However, the P-IRLS algorithm is also implemented (indirectly) as this is a special case of the LQA algorithm.
 See Ulbricht (2010) or the accompanying `User's Guide' for further details.
}
\details{
\tabular{ll}{
Package: \tab lqa\cr
Type: \tab Package\cr
Version: \tab 1.0-2\cr
Date: \tab 2010-04-15 \cr
License: \tab GPL-2 \cr
LazyLoad: \tab yes\cr
}
}
\author{
Jan Ulbricht

Maintainer: Jan Ulbricht <jan.ulbricht@stat.uni-muenchen.de>
}
\references{
Ulbricht, Jan (2010) \emph{Variable Selection in Generalized Linear Models}. Ph.D. Thesis. Ludwig Maximilians University Munich.
}
\keyword{ package }
