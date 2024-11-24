#!/bin/bash
# run braker first round

genome="$1" # hard-masked genome by Repeatmasker
bam="$2" # RNA-seq aligned bam
proteins="$3" # proteins fasta from mikado
name="$4" # genome name
today=$(date +"%Y%m%d")
echo "the profile created is: ${name}_prot-rna_${today}.1"
#GENEMARK_PATH="/data/yjwang/BIO-analysistools/braker_module/gmes_linux_64"
braker.pl \
   --genome=${genome} \
   --bam=${bam} \
   --prot_seq=${proteins} \
   --prg=gth \
   --gth2traingenes \
   --species=${name}_prot-rna_${today}.1 \
   --cores 32 \
   --workingdir=mybraker \
   --gff3
