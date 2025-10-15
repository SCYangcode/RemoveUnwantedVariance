\name{Find_HKGs}
\alias{Find_HKGs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Identify the House Keep Genes from one batch of sequencing samples}
\description{
Identify genes with low variance across conditions within a batch 
}
\usage{
Find_HKGs(tpm,n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tpm}{the tpm matrix obtained from Calculate_tpm}
  \item{n}{how many house keep genes you'd like to get from this analysis, 300 is recommended.}
}
\details{}
\value{tpm: matrix;
n:numeric number}
\author{Songchen Yang}
\examples{
\dontrun{
count=count
geneLength=geneLength
tpm_result<-Calculate_tpm(count, geneLength)
HKGs<-Find_HKGs(tpm_result, 300)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
