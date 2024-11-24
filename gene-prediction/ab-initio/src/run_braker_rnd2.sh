#!/bin/bash
# run braker second round

genome="$1" # softmasked genome by Repeatmasker
bam="$2" # RNA-seq aligned bam
profile="$3" #  species profile created in the first round
echo $(realpath $1)
echo $(realpath $2)
echo $(realpath $3)
GENEMARK_PATH="/data/yjwang/BIO-analysistools/braker_module/gmes_linux_64/"
braker.pl \
   --genome=${genome} \
   --bam=${bam} \
   --species=${profile} \
   --skipAllTraining \
   --softmasking \
   --cores 32 \
   --gff3

