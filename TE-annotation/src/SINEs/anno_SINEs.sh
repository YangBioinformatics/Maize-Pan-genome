#!/bin/bash
# get SINE annotation into gff3 format
# use this scripts after run SINE-FINDER
genome = $1 #genome name

# extract information into table
cat ${genome}-matches.fasta|grep '>'|sed 's/>//g'|sed 's/:/\t/g'|sed 's/;/\t/g'|sed 's/-//g' |sed 's/=//g'> ${genome}.SINE.txt # ${genome}-matches.fasta is the SINE-FINDER output
# recode information into gff3 format
python3 cvt_SINE_info_2_gff3.py  ${genome}.SINE.txt >  ${genome}.SINE.gff3