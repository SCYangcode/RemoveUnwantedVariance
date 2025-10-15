#' Remove Variance Within Group
#'
#' @param x Expression matrix
#' @param group Factor Vector Indicates Sample's Group
#' @return Normalized matrix
#' @export
Normal_dp<-function(x, group){
  keep <- rowSums(x >= 10) >= 2
  dds <- x[keep, ] %>% as.matrix()
  vst_mat <- vst(dds, blind = TRUE)   # genes x samples
  ## ---- Build models for SVA ----
  pheno <- data.frame(group = group)
  mod  <- model.matrix(~ group, pheno)       
  mod0 <- model.matrix(~ 1, pheno)          
  ## ---- Estimate number of surrogate variables ----
  k_be   <- num.sv(vst_mat, mod, method = "be")
  k_leek <- num.sv(vst_mat, mod, method = "leek")
  k      <- max(k_be, k_leek)  # 
  message("Estimated SVs: be=", k_be, ", leek=", k_leek, " -> using k=", k)
  ## ---- Run SVA  ----
  if (k > 0) {
    svobj <- sva(vst_mat, mod, mod0, n.sv = k)
    svs   <- svobj$sv  # samples x k
    vst_adj <- removeBatchEffect(vst_mat, covariates = svs, design = mod)
  } else {
    warning("No SVs detected (k=0). Proceeding without SVA adjustment.")
    vst_adj <- vst_mat
  }
}
