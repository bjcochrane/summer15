## Funtion to clean data from snp database by 
## 1. removing those that don't have ancestral alleles determined, and
## 2. removing those not mapped to an actual chromosome
snpclean <-function(dat){
  dat[dat==""] <-NA
  dat <-dat[which(is.na(dat$allele_1)==FALSE),] # remove snps lacking ancestral
  aut <-c(as.character(1:23),"X") # Vector of chromosome names
  dat <-lapply(aut, function (x) dat[which(dat$chr_name==x),]) #do the filtering
  dat <-do.call(rbind.data.frame, dat) #Convert list to data frame
  dat
}