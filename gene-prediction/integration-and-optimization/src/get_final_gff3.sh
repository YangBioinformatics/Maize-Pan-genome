#!/bin/bash
# use this scripts after run post_AED_0.5_process.sh
ln -s ../genome.all.fa
ln -s ../post_filter/sortID_formatted.gff3
name="$1" # genome name
gff=sortID_formatted.gff3
cat sortID_formatted.gff3|grep 'CDS'|cut -d '=' -f 3 > CDS.parent # New
cat sortID_formatted.gff3 |grep mRNA|cut -d '=' -f 2|cut -d ';' -f 1 > mRNA.list # New
grep -Fvf CDS.parent mRNA.list > noCDS_mRNA # New
grep -Fvf noCDS_mRNA ${gff} > mRNA_checked.gff # New 
gff3_QC -g mRNA_checked.gff -f genome.all.fa -o report.txt
gff3_fix -qc_r report.txt -g mRNA_checked.gff -og corrected.gff3
gff3_sort -t ~/NAM_scripts/feature_order -g corrected.gff3 -og feature_sorted.gff3
cat feature_sorted.gff3 |grep '^chr' > chr.gff3
cat feature_sorted.gff3 |grep '^ctg' > ctg.gff3
cat chr.gff3 ctg.gff3 > seqIDsorted.gff3
python ~/NAM_scripts/gff3_formating_V2.py ${name} seqIDsorted.gff3 > ${name}.gff3
