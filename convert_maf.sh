#!/bin/bash

#SBATCH --time=1:0:0
#SBATCH --mem=30G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=$EMAIL

SAMPLE_FILE=$1

for sample in `cat $SAMPLE_FILE`; do
    perl snpeffToMaf.pl ${sample} 0 0.00
done 
   
cat *maf | awk '!/Hugo_Symbol/ || NR==1' > all.maf
