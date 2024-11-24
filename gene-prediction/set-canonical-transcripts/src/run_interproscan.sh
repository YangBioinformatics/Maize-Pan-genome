#!/bin/bash
# run interproscan to annotate the protein domain
# CIMBL70.prot.fa is the protein fasta file for CIMBL70 genome
sh /data/yjwang/Genomics-Analysis/NAM_anno_module/interproscan-5.52-86.0/interproscan.sh -i CIMBL70.prot.fa -dp -appl PfamA -iplookup --cpu 16 -f tsv