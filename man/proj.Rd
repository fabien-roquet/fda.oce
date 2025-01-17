% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proj.R
\name{proj}
\alias{proj}
\title{Projection of Temperature and Salinity profiles}
\usage{
proj(temp.fd, sal.fd, pca)
}
\arguments{
\item{temp.fd, sal.fd}{fd objects (list) of the T-S profile(s) to project. This is produced by the function \code{bspl}.}

\item{pca}{list of the modes to project on, produced by the function \code{fpca}.}

\item{te}{how many PCs to use in the reconstruction, default is set to the total number of PC, \code{te = mybn}.}
}
\value{
\code{Npc} The principal components of the profiles \code{temp.fd} and \code{sal.fd} projected on the modes contained in \code{pca}.
}
\description{
Projection of any Temperature and Salinity (T-S) profiles on a chosen basis. It is essential to locate a profile relatively to a climatology. The profiles to project must have the same \code{myb} than the modes to project on (i.e. same length of profile \code{c(dmin,dmax)} and same number of Bsplines \code{mybn}).
}
\references{
Ramsay J. O., and B. W. Silverman, 2005: Functional Data Analysis. Springer, 426 pp.
}
\seealso{
\code{\link{bspl}} for bsplines fit on T-S profiles, \code{\link{fpca}} FPCA of T-S profiles, \code{\link{PCmap}} for plotting a map of PC, \code{\link{kde_pc}} for kernel density estimation of two PCs...
}
