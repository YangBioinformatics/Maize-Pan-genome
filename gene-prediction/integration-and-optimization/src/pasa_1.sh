#!/bin/bash

# pasa transcript assemblies

combined_fasta="$1" # transcript fasta generated with genome sequence and gene_model.gff3 from gene_Model.sh
genome_fasta="$2" # hardmasked genome by Repeatmasker
alignAssembly_config="$3" # wrapped in PASA
acc_list="$4" # a file list contained some published data that are B73 full-length cDNA, maize transcript from Iso-seq, ~2 million maize EST sequence in genebank


echo $(realpath $1)
echo $(realpath $2)
echo $(realpath $3)
echo $(realpath $4)


seqclean $mikado_combined_fasta -c 10

 
Launch_PASA_pipeline.pl \
 -c $alignAssembly_config -C -R -g $genome_fasta \
 -u $mikado_combined_fasta -T -t ${mikado_combined_fasta}.clean \
 -f $acc_list --ALIGNERS blat,gmap --CPU 16
