#!/bin/bash
gff=$1 # gff3 file
cds=$2 # cds sequence fasta
prot=$3 # protein sequence fasta
name=$4 # genome name
usearch11.0.667_i86linux32 -usearch_local $prot -db /ce0721/yjwang/file/releated_pep/usearch.db -id 0.5 -uc ${name}.uc 
 # referred from NAM pan-genome research, usearch.db contains proteins from Sorghum bicolor, Oryza sativa, Brachypodiu distachyon and Arabidopsis thaliana
perl /home/yjwang/bin/scripts_for_Usearch/make_t2g.pl $gff > ${name}.t2g
perl /home/yjwang/bin/scripts_for_Usearch/get_species_specific_t2g.pl ${name}.t2g  ${name}.uc > ${name}.t2g.ss
perl /home/yjwang/bin/scripts_for_Usearch/conserved_filter.pl "${name}.conserved" ${name}.uc ${name}.t2g $prot $cds $gff
perl /home/yjwang/bin/scripts_for_Usearch/non-conserved_filter.pl "${name}.specific" ${name}.t2g.ss $prot $cds $gff
