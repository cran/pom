\name{F.2nd.deriv}
\alias{F.2nd.deriv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the Hessian Matrix
}
\description{
Compute numeric 2nd derivative (Hessian) of the function \code{FUN()}
}
\usage{
F.2nd.deriv(pt, FUN, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pt}{
	Vector input to FUN.
}
  \item{FUN}{
	Name of a function to evaluate.  Must return a scalar when FUN(pt) is called.
}
  \item{\dots}{
	Optional Items to \code{FUN()}
}
}
\details{
This function is sourced by the \code{siteocc} function.
}
\value{
Returns the Hessian Matrix of the input function.
}
\references{
Casella, G., and Berger, R. L. (2002). Statistical inference, Duxbury Press.
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
F.test <- function(x){
    3*x[1]^3 + x[1]^2*x[2]^2 + x[2]^3 + x[1]^2*x[3]^4
}
F.2nd.deriv( c(2,3,4), F.test )

# Another Example using siteocc function to get standard errors.
data(weta.data) 
	
fit1 <- siteocc(~1, ~1, histories=weta.data$detection.histories) 
print(fit1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{methods}
