#' Reconstruction of Temperature and Salinity profiles
#'
#' Reconstruction of Temperature and Salinity (T-S) profiles with a chosen number of Principal Components (PCs).
#'

#' @param pca list produced by the function \code{fpca}
#' @param te how many PCs to use in the reconstruction, default is set to the total number of PC, \code{te = mybn}.
#' @param depth how many depth levels to get back.

#' @return \code{recotemp} and \code{recosali} matrix containing the reconstruction of \code{temp} and \code{sali} with the number of PCs \code{te}.
#'
#'@references Ramsay J. O., and B. W. Silverman, 2005: Functional Data Analysis. Springer, 426 pp.
#'
#' @seealso \code{\link{bspl}} for bsplines fit on T-S profiles, \code{\link{fpca}} FPCA of T-S profiles, \code{\link{PCmap}} for plotting a map of PC, \code{\link{kde_pc}} for kernel density estimation of two PCs...

#' @export
reco <- function(pca,te,depth){
  dmin  <- pca$rangeval[1]
  dmax  <- pca$rangeval[2]
  mybn  <- pca$nbasis
  myb   <- fda::create.bspline.basis(c(dmin,dmax),mybn)
  if(missing(depth)){
    depth <- dmin:dmax
  }
  phi   <- fda::eval.basis(myb,depth)
  nobs  <- dim(pca$pc)[1]

  if(missing(te)){
    te = mybn*2
  }

  tr <- matrix(NaN,nobs,length(depth))
  sr <- matrix(NaN,nobs,length(depth))
  for(k in 1:nobs){
    coefrecoT   <- pca$Cm[1:mybn]            + pca$vectors[1:mybn,1:te]            %*% t(t(pca$pc[k,1:te]))
    coefrecoS   <- pca$Cm[(mybn+1):(mybn*2)] + pca$vectors[(mybn+1):(mybn*2),1:te] %*% t(t(pca$pc[k,1:te]))
    tr[k,]  <- t(phi%*%coefrecoT)
    sr[k,]  <- t(phi%*%coefrecoS)
  }
  recotemp <<- tr
  recosali <<- sr
  #depth    <<- depth
}


