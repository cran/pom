\name{siteocc}
\alias{siteocc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fitting Patch Occupancy Models
}
\description{
\code{siteocc} will fit a patch occupancy model to histories of observations and can account for an imperfect probability of detection.
}
\usage{
siteocc(psi, p, histories, start=NULL, lower=NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{psi}{
an object of class \code{formula} (or one that can be coerced to that class): model formula for the site occupancy parameters.  Each covariate called should be a vector of size nsites x 1.
}
  \item{p}{
an object of class \code{formula} (or one that can be coerced to that class): model formula for probability of detection given presence parameters.  Each covariate called should be a matrix of size nsites x nvisits.  To fit a beta-binomial mixture to probability of detection, specify "~ Beta.mixture" (case-sensitive) as the model for p. This argument specification assumes p's come from a beta-binomial mixture. 
}
  \item{histories}{
matrix of encounter histories. One row per site, one column per visit.  This argument should be of size nsites x nvisits.  A NA may be used in the \code{histories} dataframe to represent instances when a survey could not be completed at a particular site for a particular visit.
}
  \item{start}{
vector of starting values passed to the \code{nlminb} function.  If \code{start=NULL}, then the default starting values will be used.  See details.
}
 \item{lower}{
 vector of lower bounds passed to the \code{nlminb} function.  If \code{lower=NULL}, then the default lower bounds will be used.  See details.
}
 \item{\dots}{
other arguments passed to the \code{nlminb} function.  See \code{?nlminb}.
}
}
\details{
The log-likelihood is maximized using the \code{nlminb} function.  If the user decides to provide starting values, then they will need to specify values for each PSI covariate as well as each P covariate, including intercepts.   The starting values should be listed in the order of the specified covariates (i.e., the PSI intercept starting value first, the PSI coefficient(s) starting value(s) next, then the P intercept starting value, and finally the P Coefficient(s) starting value(s)).  See below for an example of format.  If specifying a Beta-mixture model, then the starting values are 0.5 for all of the covariates including the intercept.  Otherwise, 0 is used for the starting value of each covariate.

The same format used to specify starting values should also be used to specify the lower bounds for the \code{lower} argument. The default lower bounds for a Beta-mixture are -Inf for all PSI covariates and 0 for both of the beta-binomial parameters.  If you specify a lower bound of less than 0 for the beta-binomial parameters, your model will most likely not converge.  This is because both parameters must be strictly greater than 0.  If a Beta-mixture is not specified, then -Inf will be the lower bound for all covariates. 

Unless otherwise specified, the default values of the \code{nlminb} function are used.  

The example datasets are detailed in pages 116-122 of MacKenzie et al. (2006) and also included with the program PRESENCE. 
}
\value{
\item{loglik}{Optimized log-likelihood.}
\item{convergence}{An integer code. 0 indicates successful convergence.  See the Value section of \code{?nlminb.}}
\item{convergence.message}{A character string giving any additional information returned by the optimizer, or NULL.  See the Value section of\code{ ?nlminb.}}
\item{call}{The matched call.}
\item{naive.psi.est}{Naive Estimate of Occupancy.}
\item{nsites}{Number of Sites.}
\item{nvisits}{Number of Visits.}
\item{psi.coefs}{Esimate(s) of psi coefficient(s).}
\item{p.coefs}{Estimate(s) of p coefficient(s) or the shape parameters if a Beta-Binomial mixture model was specified.}
\item{se.psi.coefs}{Standard Error of the psi coefficient(s).}
\item{se.p.coefs}{Standard Error of the p coefficient(s).}
\item{hessian}{Hessian matrix used to compute the standard error of the psi and p coefficient(s).}
\item{psi.ests}{Psi Estimates corresponding to each site.}
\item{p.ests}{Matrix of P Estimates corresponding to each site and visit.}
\item{aic}{Akaike's information criterion.}
\item{bic}{Bayesian information criterion.}
}
\references{
Royle, J.A., 2006. Site occupancy models with heterogeneous detection probabilities. Biometrics 62:97-102.

MacKenzie, D.I., Nichols, J.D., Lachman, G. B., Droege, S., Royle, J. A., and Langtimm, C. A., 2002. Estimating site occupancy rates when detection probabilities are less than one. Ecology, 83:2248-2255.

MacKenzie, D.I., Nichols, J.D., Royle, J.A., and Pollock, K.H. (2006), Occupancy Estimation and Modeling: Inferring Patterns and Dynamics of Species Occurrence, Academic Press, Burlington, MA.
}
\author{
Fawn Hornsby, Ryan Nielson, and Trent McDonald \url{www.west-inc.com}
	
Maintainer: Fawn Hornsby \email{fhornsby@west-inc.com}
}
\seealso{
\code{\link{weta.data}} \cr
\code{\link{print.pom}} \cr
\code{\link{print.mixed.pom}} \cr
\code{\link{F.2nd.deriv}} 
}
\examples{
data(weta.data)

# INTERCEPT-ONLY MODEL
fit1 <- siteocc(~1, ~1, histories=weta.data$detection.histories, start=c(1,1))

# BETA-BINOMIAL MIXTURE MODEL
fit2 <- siteocc(~1, ~Beta.mixture, histories=weta.data$detection.histories, 
	lower=c(log(0.01),0.0001,0.0001))

# MODEL TESTING BROWSED AND OBSERVER EFFECTS
fit3 <- siteocc(~weta.data$siteCovar$Browsed, ~weta.data$Obs1 + weta.data$Obs2, 
	histories=weta.data$detection.histories, start=c(0,2,0,-1,0), control=list(iter.max=50))

# MODEL WHICH ALSO FITS A SITE COVARIATE TO THE PROBABILITY OF DETECTION
numvisits=5
p.Browse <- matrix(rep(weta.data$siteCovar$Browsed, numvisits), ncol=numvisits)
fit4 <- siteocc(~1, ~p.Browse + weta.data$Obs1 + weta.data$Obs2, 
	histories=weta.data$detection.histories)
}
\section{Warning}{
 Be sure to check for convergence.  Some tips if you are having trouble getting your models to converge: \cr
1. Choose different starting values. \cr
2. Make sure your covariates are on similar scales. \cr
3. Check for high correlations among covariates.
}
\note{
Currently, this function does not fit visit-specific P-covariates.
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
