## Script to count
## Libraries
library("vroom")
library("dplyr")
library("stringr")

## Read args from command line
args <- commandArgs(trailingOnly = T)

# Uncomment for debbuging
# Comment for production mode only
#args[1] <- "./cutedfile"

## Place args into named object
cutedfile<- args[1]

## Up file
file <- vroom(file = cutedfile, col_names = F)

## Keep only gene id
clean_file <- file %>% 
  mutate(X4 = str_extract(string = file$X4, pattern = "gene_id=ENS.{15}")) 

## Remove ;
clean_file2 <- clean_file %>% 
  mutate(X4 = str_replace(string = clean_file$X4, pattern = ";", replacement = "") ) %>% 
  unique()

## Export
write.table(x = clean_file2, file = "clean_data",quote = F, col.names = F, row.names = F, sep = "\t")
