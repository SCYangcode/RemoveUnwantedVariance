

### Installation

```R
## install.packages("devtools")
devtools::install_github("SCYangcode/RemoveUnwantedVariance")
```

### Usages

#### Normalized the samples from different sequencing batches without spike in 

```R
## If you have samples from different batches, and you don't have the same conditions in different batches, but you'd like to compare the gene expression in conditionA which only exist in batch 1 and conditionB which only exist in batch2.  

count_batch1=count_batch1
count_batch2=count_batch2
geneLength=geneLength
batch1_tpm<-Calculate_tpm(count_batch1, geneLength)
batch2_tpm<-Calculate_tpm(count_batch2, geneLength)

HKGs_batch1<-Find_HKGs(batch1_tpm, 300)
HKGs_batch2<-Find_HKGs(batch2_tpm, 300)

Shared_HKGs<-intersect(HKGs_batch1, HKGs_batch2)

MM_counts<-cbind(count_batch1, count_batch2)

normalized_results<-NormalizeCount(MM_counts, shared_HKGs, 2)

normalizedCounts<-normalized_results$normalizedCounts

## DEseq2
sample_df <- data.frame(
  condition = rep(c("A", "C", "B", "D"), each=3),
  batches = rep(c("B1", "B2"), each=6)
)

deseq2.obj <- DESeqDataSetFromMatrix(countData = MM_counts, colData = sample_df, design = ~condition)

dds<-DESeq(deseq2.obj)
```

#### Remove unwanted variance within groups

```r
## if there are individual variances in group, please follow the steps:
group<-as.factor(c(rep(c("A", "B"), each=3),rep(c("A", "B"), each=3)))
batches<-as.factor(rep("B1", "B2"), each=6)
MM_counts<-cbind(rowcounts1, rowcounts2)
Normalized_C<-Normal_dp(MM_counts, group)
```