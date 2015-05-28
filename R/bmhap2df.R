#Function to convert hapmap data from biomaRt to a dataframe for
#conversion to a genind object
# based on query of the following nature:
# hap.mart <-useMart("HapMap_rel27",dataset="hm27_variation")
# dat <-getBM(attributes=c("sample_id","pop_id","pop_code_genotype",
# "marker1","genotype"),filter="marker_name",values=snp.samp,mart=hap.mart)
# where snp.samp is a vector of snps.
bmhap2df <-function(df1){
  indiv <-unlist(strsplit(df1[1,1]," ")) # extract names of individuals
  snp.ids <-df1$marker1 # extract snp names
  genos <-df1$genotype # create a variable of the individual genotypes
  genos.spl <-sapply(genos,strsplit," ") # separate multilocus genotypes into single loci
  genos.df <-do.call(cbind.data.frame,genos.spl) #convert this to a data frame
  genos.df[genos.df=="NN"] <-NA #convert missing data to NA
  rownames(genos.df) <-indiv # name rows
  colnames(genos.df) <-snp.ids # and columns
  return(genos.df)
  
}