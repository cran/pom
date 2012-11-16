\name{print.mixed.pom}
\alias{print.mixed.pom}
\title{
Printing Patch Occupancy Model Fits For a Beta-binomial Mixture
}
\description{
This function summarizes the results from class \code{mixed.pom}.  This function is called when a "~Beta.mixture" is specified as the model for p (probability of detection).
}
\usage{
\method{print}{mixed.pom}( x,  digits = max(3, getOption("digits") - 3), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
an object of class \code{mixed.pom}; usually, a result of a call to \code{siteocc}.
}
  \item{digits}{
the number of significant digits to use when printing.
}
\item{\dots}{
further arguments passed to or from other methods.  They are ignored in this function.
}
}
\value{
The output includes the matched call, the convergence code, PSI Coefficients with Estimates, Standard Errors, Z-values, and 2-sided p-values, Beta mixture parameters for P, AIC, BIC, the average estimated Probability of Occupancy (PSI).
}
\author{
Fawn Hornsby, Ryan Nielson, and Trent McDonald \url{www.west-inc.com}
	
Maintainer: Fawn Hornsby \email{fhornsby@west-inc.com}
}
\seealso{
\code{\link{weta.data}} \cr
\code{\link{siteocc}}
}
\examples{
data(weta.data) 
	
fit1 <- siteocc(~1, ~1, histories=weta.data$detection.histories) 
print(fit1)
}
\keyword{ print}
