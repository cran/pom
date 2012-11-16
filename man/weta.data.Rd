\name{weta.data}
\alias{weta.data}
\docType{data}
\title{
Occupancy data for the  New Zealand Mahoenui Giant Weta
}
\description{
A  list of datasets used in modeling the Mahoenui Giant Weta probability of occupancy.  72 sites were surveyed with up to 5 visits completed for each site.  This list also includes covariates to model an observer effect for three observers and whether a site was browsed.
}
\usage{data(weta.data)}
\format{
A list containing 5 datasets:

 $ detection.histories: A data frame with 72 observations (one row for each site) on the following 5 variables (one column for each visit to a particular site).  A 1 indicates that at least one weta was observed and 0 indicates that no weta were observed on a particular visit.  A NA indicates the site was not surveyed for that particular visit.

 $ siteCovar          : A data frame used to define the effect of browsing. \cr
  ..$ Browsed  : a vector of 1's and 0's, with 1 indicating that a site was browsed and 0 indicating the site was unbrowsed. \cr
  ..$ Unbrowsed: a vector of 1's and 0's, with 1 indicating that a site was unbrowsed and 0 indicating the site was browsed.

 $ Obs1               : Observer 1 Covariate matrix.  Each row refers to a specific site and each column refers to one of five total visits.  Thus, this matrix is of size 72x5.  A 1 indicates that Observer 1 conducted the survey for a particular visit, while a 0 indicates that Observer 1 did not conduct the survey for a particular visit. A NA indicates the site was not surveyed by any observer for that particular visit.

 $ Obs2               : Observer 2 Covariate matrix.  Each row refers to a specific site and each column refers to one of five total visits.  Thus, this matrix is of size 72x5.  A 1 indicates that Observer 2 conducted the survey for a particular visit, while a 0 indicates that Observer 2 did not conduct the survey for a particular visit. A NA indicates the site was not surveyed by any observer for that particular visit.

 $ Obs3               : Observer 3 Covariate matrix.  Each row refers to a specific site and each column refers to one of five total visits.  Thus, this matrix is of size 72x5.  A 1 indicates that Observer 3 conducted the survey for a particular visit, while a 0 indicates that Observer 3 did not conduct the survey for a particular visit. A NA indicates the site was not surveyed by any observer for that particular visit.
}
\details{
The example datasets are detailed in pages 116-122 of MacKenzie et al. (2006) and also included with the program PRESENCE.

Coding was used to define an observer effect using Obs1 and Obs2 as factor covariates (see table 4.6 on page 118 of MacKenzie et al., 2006).  \code{Obs3} has been included in this package for completeness. 
}
\source{
MacKenzie, D.I., Nichols, J.D., Royle, J.A., and Pollock, K.H. (2006), Occupancy Estimation and Modeling: Inferring Patterns and Dynamics of Species Occurrence, Academic Press, Burlington, MA.
}
\seealso{
\code{\link{siteocc}}
}
\examples{
data(weta.data) 

fit1 <- siteocc(~weta.data$siteCovar$Browsed, ~weta.data$Obs1 + weta.data$Obs2, 
         histories=weta.data$detection.histories)
print(fit1)
}
\keyword{datasets}
