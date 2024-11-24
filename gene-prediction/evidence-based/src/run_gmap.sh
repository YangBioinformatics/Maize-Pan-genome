#!/bin/bash
#use gmap to generate gff3 file from Trinity assembled fasta
genome=$1
name=$2
path=`realpath $genome`
echo $path
/data/yjwang/BIO-analysistools/PASA_module/new_executable/gmap_build -d $name -D ./gmap_index $genome
/data/yjwang/BIO-analysistools/PASA_module/new_executable/gmap \
   -D ./gmap_index \
   -d $name \
   -B 4 \
   -t 32 \
   -f gff3_match_cdna \
      ./Trinity-GG.fasta \
    > ${name}_TrinityGG-mapped.gff3  \
    2> ./stderr-out
