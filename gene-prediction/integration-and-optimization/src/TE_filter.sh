#!/bin/bash
# filter TE-related genes in optimized gene models

# rm genome.fa.fai 2>/dev/null &
PASA_gff3="$1" # optimized gff3 from PASA
name=`echo $PASA_gff3|cut -d '_' -f 1` # genome name
ln -s ../genome.all.fa ./
python pre_gff3_formating.py ${name} ${PASA_gff3}> ${name}.original.gff3
/data/yjwang/BIO-analysistools/PASA_module/perl/bin/perl /data/yjwang/BIO-analysistools/PASA_module/PASApipeline.v2.4.1/misc_utilities/pasa_gff3_validator.pl ${name}.original.gff3 > rpt.txt
# cat rpt.txt|grep 'ncRNA'|awk '$0'|awk '{print $3}'|cut -d '_' -f1|sort|uniq > ncRNA.txt
cat rpt.txt|grep 'ncRNA'|awk '$0'|awk '{print $3}'|sort|uniq > ncRNA.txt
/data/yjwang/BIO-analysistools/perl-5.30.1/bin/perl /data/yjwang/BIO-analysistools/perl-5.30.1/bin/agat_sp_filter_feature_from_kill_list.pl --gff ${name}.original.gff3 --kill_list ncRNA.txt --output ${name}.gff3 &>/dev/null
gffread -g genome.all.fa -t mRNA -x ${name}.temp.cds.fa -y ${name}.temp.prot.fa ${name}.gff3
TEsorter ${name}.temp.cds.fa -eval 1e-6 -p 32
grep -v "^#" ${name}.temp.cds.fa.rexdb.cls.tsv | cut -f1 | sort | uniq | cut -f1 -d '_' | sort | uniq > TE-genes.txt
/data/yjwang/BIO-analysistools/perl-5.30.1/bin/perl /data/yjwang/BIO-analysistools/perl-5.30.1/bin/agat_sp_filter_feature_from_kill_list.pl --gff ${name}.gff3 --kill_list TE-genes.txt --output temp.gff3 &>/dev/null 
/data/yjwang/BIO-analysistools/perl-5.30.1/bin/perl /data/yjwang/BIO-analysistools/perl-5.30.1/bin/agat_sp_filter_feature_from_keep_list.pl --gff ${name}.gff3 --keep_list TE-genes.txt --output temp.other.gff3 &>/dev/null
gt gff3 -sort -tidy -retainids temp.gff3|grep -v 'sequence-region' > ${name}.TErmv.gff3
gt gff3 -sort -tidy -retainids temp.other.gff3|grep -v 'sequence-region'  > ${name}.withTE.gff3
