#!/bin/bash
# after run maker3, use this scripts with AED-filtered gff3 file
echo "this is post_AED_0.5_process_V2.sh"
PERL="/data/yjwang/BIO-analysistools/perl-5.30.1/bin/perl"
AGAT="/data/yjwang/BIO-analysistools/perl-5.30.1/bin/"
name="$1"
genome=genome.all.fa
gff=${name}.0.5.gff3
ln -s ../genome.all.fa
ln -s ../AED_filter/${name}.soft.mask.maker.output/${name}.0.5.gff3
gff3_sort -t ~/NAM_scripts/feature_order -g ${gff} -og sorted.gff3
python ~/NAM_scripts/gff3_formating_V2.py Gene sorted.gff3 > formatted.gff3
${PERL} ${AGAT}agat_convert_sp_gxf2gxf.pl -g formatted.gff3 -o refined.gff3 &>/dev/null
${PERL} ${AGAT}agat_sp_flag_premature_stop_codons.pl -g refined.gff3 -f $genome -o add.pseudo.gff &>/dev/null
${PERL} ${AGAT}agat_sp_filter_feature_by_attribute_presence.pl --gff add.pseudo.gff -a 'pseudo' -o filter.pseudo.gff &>/dev/null
gffread filter.pseudo.gff -g $genome -t mRNA -x temp.cds.fa -y temp.prot.fa 
rm ${genome}.fai
Usearch.sh filter.pseudo.gff temp.cds.fa temp.prot.fa $name
rm temp.cds.fa temp.prot.fa
${PERL} ${AGAT}agat_sp_fix_cds_phases.pl -g $name.conserved.gff -f $genome -o fixed.cons.gff &>/dev/null
${PERL} ${AGAT}agat_sp_fix_cds_phases.pl -g $name.specific.gff -f $genome -o fixed.spec.gff &>/dev/null
${PERL} ${AGAT}agat_sp_filter_incomplete_gene_coding_models.pl --gff fixed.cons.gff --fasta $genome -o cons.completeness.check.gff &>/dev/null
${PERL} ${AGAT}agat_sp_filter_incomplete_gene_coding_models.pl --gff fixed.spec.gff --fasta $genome -o spec.completeness.check.gff &>/dev/null
cat fixed.cons.gff spec.completeness.check.gff > CodingGeneTempA.gff3 # all conserved and complete specific gff3
# gffread merged.gff3 -t mRNA -g $genome -x m.cds.fa -y m.prot.fa
${PERL} ${AGAT}agat_convert_sp_gxf2gxf.pl -g CodingGeneTempA.gff3 -o CodingGeneTempB.gff3 &>/dev/null
python ~/NAM_scripts/gff3_formating_V2.py Gene CodingGeneTempB.gff3 > CodingGene.gff3
gff3_QC -g CodingGene.gff3 -f genome.all.fa -o report.txt
gff3_fix -qc_r report.txt -g CodingGene.gff3 -og corrected.gff3
${PERL} ${AGAT}agat_convert_sp_gxf2gxf.pl -g corrected.gff3 -o cvt_checked.gff3 &>/dev/null
gffread cvt_checked.gff3 -t mRNA -g $genome -x temp.cds.fa
rm ${genome}.fai #
seqkit seq -n -M 30 temp.cds.fa > shortCDS.list # hard-filter
${PERL} ${AGAT}agat_sp_filter_feature_from_kill_list.pl --gff cvt_checked.gff3 --kill_list shortCDS.list --output ${name}.hardfiltered.gff3
cat ${name}.hardfiltered.gff3 |grep '^chr' > chr.gff3
cat ${name}.hardfiltered.gff3 |grep '^ctg' > ctg.gff3
cat chr.gff3 ctg.gff3 > seqIDsorted.gff3
python ~/NAM_scripts/gff3_formating_V2.py Gene seqIDsorted.gff3 > sortID_formatted.gff3
rm temp.cds.fa
