Calculate_tpm<-function(count, geneLength){
  zz<-intersect(rownames(count), rownames(geneLength))
  count<-count[zz,]
  geneLength<-geneLength[zz,]
  names(geneLength)<-rownames(count)
  M_all_3=as.matrix(count)
  rpk <- count / (geneLength / 1000)
  scaling_factors <- colSums(rpk) / 1e6
  tpm <- t(t(rpk) / scaling_factors)
  return(tpm)
}