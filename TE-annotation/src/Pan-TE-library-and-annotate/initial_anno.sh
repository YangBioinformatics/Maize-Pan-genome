#!/bin/bash
# referred from "https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation"
# after identify raw TE, use this to perform initial annotation to get de novo TE lib for each genome

name="$1" # genome name

# ${name}.fa is the genome fasta
# ${name}.cds.fa is the cds fasta extracted by the gene annotation information for each genome
# maizeTE02052020 is the curated maize TE libraries from https://github.com/oushujun/MTEC

/data/yjwang/anaconda3/envs/EDTA/bin/perl \
/data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/EDTA.pl \
--genome ${name}.fa \
--species Maize \
-t 16 \
--cds ${name}.cds.fa \
--curatedlib maizeTE02052020 \
--anno 1 &>init_anno.log
