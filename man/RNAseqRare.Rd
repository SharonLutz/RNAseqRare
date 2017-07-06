\name{RNAseqRare}
\alias{RNAseqRare}
\title{RNAseqRare
}
\description{
performs expression quantitative trait loci (eQTL) analyses of rare variants for RNA-seq data.
}
\usage{
RNAseqRare(x, y, z = NULL)
}
\arguments{
  \item{x}{
  is a matrix of rare variants in the region.
}
  \item{y}{
  is the count for the RNAseq data.
}
  \item{z}{
  is a matrix of covariates to adjust for.
}
}
\value{
\item{p-value }{The significance from SKAT with normalized count data. }
\item{matrix }{negative binomial with sum of rare variants. }
\item{matrix }{negative binomial with indicator for rare variants. }
}
\references{
Lutz SM, Thwing A, Fingerlin TE. (2017) A Statistical Framework for Rare Variant Associations with RNA-seq Data. Statistics in Medicine. (In preparation)
}
\author{
Sharon Lutz, Annie Thwing
}
\section{Warning}{
library(SKAT) and library(MASS) are needed to run this function. 
}

\keyword{ RNA }
\keyword{ sequence }
\keyword{ function }
