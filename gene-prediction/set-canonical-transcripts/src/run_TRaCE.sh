#!/bin/bash
# use TRaCE to rank transcripts
# take CIMBL70 genome for example
# CIMBL70.gff3 is the gene annotation file
# CIMBL70.prot.fa.tsv is the interproscan output
# CIMBL70.TRaCE.gtf is the stringtie output
perl /data/yjwang/Genomics-Analysis/NAM_anno_module/TRaCE-main/TRaCE.pl CIMBL70.gff3 CIMBL70.prot.fa.tsv 0.5 0.5 0.5 0.5 CIMBL70.TRaCE.gtf >CIMBL70.TRaCE.res