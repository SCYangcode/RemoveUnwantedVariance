### Introduction

The **RemoveUnwantedVariance** method provides significant practical benefits:

1. **Spike-In Free Normalization:** It eliminates the need for external spike-in controls by leveraging intrinsic genomic features, such as housekeeping genes, making it more accessible and cost-effective.
2. **Handles Non-Overlapping Designs:** It is uniquely capable of correcting for batch effects in complex experimental designs where the same biological conditions are not present in all batches, thus overcoming a major limitation of many other batch-correction tools.
3. **Universal Compatibility:** Delers a standardized matrix that works seamlessly with all common differential expression tools.

### Installation

```R
## install.packages("devtools")
devtools::install_github("SCYangcode/RemoveUnwantedVariance")
```

### Usages

#### Normalized the samples from different sequencing batches without spike in 

```R
## Normalization
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
## If there are individual variances in group, please follow the steps:
group<-as.factor(c(rep(c("A", "B"), each=3),rep(c("A", "B"), each=3)))
batches<-as.factor(rep("B1", "B2"), each=6)
MM_counts<-cbind(rowcounts1, rowcounts2)
Normalized_C<-Normal_dp(MM_counts, group)
```
