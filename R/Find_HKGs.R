#' Identify The House Keep genes
#'
#' @param tpm TPM matrix
#' @param n Number of House Keep Genes Obtained From the Analysis
#' @return Vector Contains House Keep Genes
#' @export
Find_HKGs<-function(tpm, n){
  CV <- function(x){sd(x)/mean(x)}
  tpm.numeric<-apply(tpm, 2, as.numeric)
  tpm.numeric<-as.data.frame(tpm.numeric)
  rownames(tpm.numeric)<-rownames(tpm)
  tpm.log2 <- log2(tpm.numeric + 1)
  CV.vector <- apply(tpm.log2,1,CV)
  tpm.log2.sort <- tpm.log2[order(CV.vector),]
  tpm.log2.sort.100 <- tpm.log2.sort[1:n,] %>% rownames()
  return(tpm.log2.sort.100)
}
