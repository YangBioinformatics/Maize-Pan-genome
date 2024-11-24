#!/bin/bash
# referred from https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation
# use this after filter out single-copy annotations to get classification information and convert the #unknown to #DNA/Helitron
# GEMS55.genome.fa.mod.EDTA.TElib.novel.fa
# GEMS55.mod.EDTA.TElib.novel.fa.real
for j in *mod.EDTA.TElib.novel.fa; do 
    for i in `cat $j.real`; do 
        grep $i $j; 
    done| \
    perl -nle 's/#unknown/#DNA\/Helitron/; print $_' > $j.real.ori & 
done