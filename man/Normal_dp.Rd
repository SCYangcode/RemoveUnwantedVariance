\name{Normal_dp}
\alias{Normal_dp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Centralize The Samples Within Group
}
\description{adjust for intra-group variability}
\usage{
Normal_dp(x, group)
}
\arguments{
  \item{x}{matrix can be rowcounts file or tpm matrix}
  \item{group}{a factor vector that indicates the groups of samples}
}
\value{
  \item{x}{data matrix}
  \item{group}{a factor vector}
}
\author{Songchen Yang}
\examples{
\dontrun{
group<-as.factor(c(rep(c("A", "B"), each=3),rep(c("A", "B"), each=3)))

MM_counts<-cbind(rowcounts1, rowcounts2)
Normalized_C<-Normal_dp(MM_counts, group)
}
}