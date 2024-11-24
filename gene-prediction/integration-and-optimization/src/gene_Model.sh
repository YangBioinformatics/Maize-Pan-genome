#!/bin/bash
# use AGAT (v0.6.0) to get non-redundant gene models from previous step
# AGAT is here: https://github.com/NBISweden/AGAT
name="$1"
PERL="/data/yjwang/BIO-analysistools/perl-5.30.1/bin/perl"
AGAT="/data/yjwang/BIO-analysistools/perl-5.30.1/bin/"

ln -s ../g-transcript-assembly/${name}_mikado.loci.gff3
ln -s ../Braker/rnd1/mybraker/braker.gff3
ln -s ../Braker/rnd2/braker/augustus.hints.gff3

echo "${PERL} ${AGAT}agat_convert_sp_gxf2gxf.pl -g ${name}_mikado.loci.gff3 -o f.mikado.gff3" > agat.fix.check.cmds
echo "${PERL} ${AGAT}agat_convert_sp_gxf2gxf.pl -g braker.gff3 -o f.rnd1.gff3" >> agat.fix.check.cmds
echo "${PERL} ${AGAT}agat_convert_sp_gxf2gxf.pl -g augustus.hints.gff3 -o f.rnd2.gff3" >> agat.fix.check.cmds
parallel -j 3 < agat.fix.check.cmds
cat f.mikado.gff3|sed 's/ncRNA_gene/gene/g'|sed 's/ncRNA/mRNA/g' > good.mikado.gff3
${PERL} ${AGAT}agat_sp_merge_annotations.pl --gff good.mikado.gff3 --gff f.rnd1.gff3 --gff f.rnd2.gff3 --out init.merged.gff
${PERL} ${AGAT}agat_sp_fix_overlaping_genes.pl -f init.merged.gff -o rmOvlp.gff3
${PERL} ${AGAT}agat_convert_sp_gxf2gxf.pl -g rmOvlp.gff3 -o gene_model.gff3
