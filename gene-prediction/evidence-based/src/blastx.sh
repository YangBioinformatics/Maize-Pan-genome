#!/bin/bash
# run blastx to get the homology information between assembled transcrpits and SwissProt(viridiplantae) sequences
# uniprot-sprot_viridiplantae.fasta was downloaded from UniProt
file_name = "$1"  #  split transcripts fasta file
/data/yjwang/BIO-analysistools/ncbi-blast-2.10.1+/bin/blastx \
 -max_target_seqs 5 \
 -num_threads 4 \
 -query ${file_name} \
 -outfmt 5 \
 -db /data/yjwang/Genomics-Analysis/NAM_anno_module/Gene/uniprot_database/uniprot-sprot_viridiplantae.fasta \
 -evalue 0.000001 \
 2> ${file_name}.log | sed '/^$/d' | gzip -c - > ${file_name}.blast.xml.gz
