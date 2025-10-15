\name{Calculate_tpm}
\alias{Calculate_tpm}
\title{Normalize Raw Counts of Samples to Transcripts Per Million}
\description{calculation of Transcripts Per Million from raw counts}
\usage{Calculate_tpm(count, geneLength)}
\arguments{
  \item{count}{counts file: columns: samples; rows:genes;}
  \item{geneLength}{file of gene length; column: length; row: genes}
  }
\details{calculate transcripts per million from raw counts}
\value{
count: gene*samples(matrix)
geneLength: gene*length(matrix)
}
\author{Songchen Yang}
\examples{
\dontrun{
count=count
geneLength=geneLength
result<-Calculate_tpm(count, geneLength)
result
}
}