#!/bin/bash

# optimize the gene models first time

gff3 = gene_model.gff3 # gff3 file  generated from gene_Model.sh
genome_fasta="$2" #repeatmasked genome by Repeatmasker
clean="$3" #cleaned sequence from step 1
alignAssembly_config="$4" # wrapped in PASA
annotCompare_config="$5" # wrapped in PASA

echo $(realpath $mikado_loci_gff3)
echo $(realpath $genome_fasta)
echo $(realpath $clean)
echo $(realpath $alignAssembly_config)
echo $(realpath $annotCompare_config)

Load_Current_Gene_Annotations.dbi -c $alignAssembly_config -g $genome_fasta -P $gff3

Launch_PASA_pipeline.pl \
  -A  --CPU 16 \
  -c $annotCompare_config \
  -g $genome_fasta \
  -t $clean
