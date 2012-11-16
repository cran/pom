\name{print.pom}
\alias{print.pom}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Printing Patch Occupancy Model Fits
}
\description{
This function summarizes the results from class \code{pom}.  This function is called when covariate(s) or the intercept only model is specified as the model for p (probability of detection). 
}
\usage{
\method{print}{pom}( x,  digits = max(3, getOption("digits") - 3), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
an object of class \code{pom}; usually, a result of a call to \code{siteocc}.
}
  \item{digits}{
the number of significant digits to use when printing.
}
\item{\dots}{
further arguments passed to or from other methods.  They are ignored in this function.
}
}
\value{
The output includes the matched call, the convergence code, PSI Coefficients with Estimates, Standard Errors, Z-values, and 2-sided p-values, P Coefficients also with Estimates, Standard Errors, and t-values, AIC, BIC, the average estimated Probability of Occupancy (PSI) and the average estimated Probability of Detection (P).
}
\author{
Fawn Hornsby, Ryan Nielson, and Trent McDonald \url{www.west-inc.com}
	
Maintainer: Fawn Hornsby \email{fhornsby@west-inc.com}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{weta.data}} \cr
\code{\link{siteocc}}
}
\examples{
data(weta.data) 
	
fit1 <- siteocc(~1, ~1, histories=weta.data$detection.histories) 
print(fit1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ print }
