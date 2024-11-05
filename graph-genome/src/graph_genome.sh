# ------------ prepare PanSV vcf file  --------------------------
/data/spyang/wgs/smartie-sv/src/htslib/bgzip -@ 10 -f pansv.vcf
/data/spyang/wgs/smartie-sv/src/htslib/tabix -f -p vcf pansv.vcf.gz
vcf=pansv.vcf.gz
ref=B73v5.fa
threads=60
# ------------ construct graph genome --------------------------
/data/spyang/wgs/vg-1.46/vg construct -t $threads -a -f -S -v $vcf -r $ref  > B73v5.vg
# rm -rf tmp; mkdir tmp
/data/spyang/wgs/vg-1.46/vg index -t $threads --temp-dir tmp -L -x B73v5.xg B73v5.vg
/data/spyang/wgs/vg-1.46/vg index -t $threads --temp-dir tmp -j B73v5.dist B73v5.vg
/data/spyang/wgs/vg-1.46/vg gbwt --num-jobs $threads --temp-dir tmp -g B73v5.gg -x B73v5.xg -o B73v5.gbwt -P
/data/spyang/wgs/vg-1.46/vg gbwt --num-jobs $threads --temp-dir tmp  --progress  --xg-name B73v5.xg --graph-name B73v5.gbz --gbz-format B73v5.gbwt
/data/spyang/wgs/vg-1.46/vg minimizer --progress --distance-index B73v5.dist --output-name B73v5.min B73v5.gbz
/data/spyang/wgs/vg-1.46/vg snarls -t $threads B73v5.xg > B73v5.snarls
# ------------ genotype SV based on the graph genome --------------------------
# taken CIMBL70 as an example
vg giraffe -t 40 -f qc_CIMBL70_1.fastq.gz -f qc_CIMBL70_2.fastq.gz -x B73v5.xg -g B73v5.gg -m B73v5.min -d B73v5.dist -H B73v5.gbwt > CIMBL70.gam
vg pack -t 40 -Q 5 -x  B73v5.xg -g CIMBL70.gam -o CIMBL70.pack
vg call -t 40 -r B73v5.snarls -k CIMBL70.pack  -s CIMBL70 B73v5.xg > CIMBL70.vcf