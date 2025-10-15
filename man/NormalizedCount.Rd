\name{NormalizeCount}
\alias{NormalizeCount}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Normalize RNA Sequencing Samples from different batches by Using House Keep Genes}
\description{Normalize RNA Sequencing Samples from different batches by Using House Keep Genes}
\usage{
NormalizeCount(x, HKGs, k)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{data matrix which combined the row counts from different batches}
  \item{HKGs}{the vector of house keep genes that shared by different batches sequencing data}
  \item{k}{The value of k is typically chosen based on data characteristics, with common values ranging from 1 to 10. The effectively used k is automatically adjusted to retain only principal components with singular values above a tolerance threshold. This parameter controls the strength of the correction: a larger k corrects for more dimensions of technical variation but may also remove more biological signal.}
}
\value{
  \item{x}{data matrix}
  \item{HKGs}{a vector}
  \item{k}{numeric number ranges from 1-10}
}

\author{Songchen Yang}

\examples{
\dontrun{
HKGs_batch1<-Find_HKGs(tpm_result_batch1, 300)
HKGs_batch2<-Find_HKGs(tpm_result_batch2, 300)
shared_HKGs<-intersect(HKGs_batch1, HKGs_batch2)

MM_counts<-cbind(rowcounts1, rowcounts2)

normalized_results<-NormalizeCount(MM_counts, shared_HKGs, 2)
}
}

