\name{RNAseqErrorCheck}
\alias{RNAseqErrorCheck}
\title{RNAseqErrorCheck
}
\description{
Performs error checks on the input for the RNAseqRare function.
}
\usage{
RNAseqErrorCheck(x, y, z = NULL)
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
This function exits with an error message if the error checks are not met.
}
\author{
Sharon Lutz, Annie Thwing
}