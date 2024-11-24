#!/bin/bash
# referred from https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation
# use this after run initial_anno.sh to filter out single-copy annotations
# $genome.out is the RepeatMasker .out file generated from the last step.
perl="/data/yjwang/anaconda3/envs/EDTA/bin/perl"
s1="/data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/util/output_by_list.pl"
s2="/data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/util/find_flTE.pl"
for i in `cat ~/bin/ONT_genome.list`; do
    ${perl} ${s1} \
     1 \
	 <( ${perl} -nle 's/#.*//; print $_' ${i}.all.fa.mod.EDTA.TElib.novel.fa ) \
     1 \
	 <( ${perl} ${s2} ${i}.all.fa.mod.out | \
     awk '{print $10}'| \
     sort| \
     uniq -c | \
     ${perl} -nle 'my ($count, $id) = (split); if ($id=~/LTR/){next if $count<=2} else {next if $count ==1} print $_' | \
     awk '{print $2}' ) -FA >${i}.all.fa.mod.EDTA.TElib.novel.fa.real &
done
