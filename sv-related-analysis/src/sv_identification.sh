# taken CIMBL70 (NanoPore) or CIMBL55 (PacBio) as an example, reference genome (B73v5)
# ----------------- Sniffles -----------------
sniffles -t 4 -m CIMBL70.bam -v B73v5_CIMBL70.vcf
# ----------------- Cutesv -------------------
# for NanoPore data, such as CIMBL70
cuteSV -S CIMBL70 --genotype --max_size -1  --max_cluster_bias_INS 100 --diff_ratio_merging_INS 0.3  \
--max_cluster_bias_DEL 100 --diff_ratio_merging_DEL 0.3 CIMBL70.bam /data/genome/B73v5/genome.fa B73v5_CIMBL70.vcf CIMBL70
rm -rf CIMBL70
# for NanoPore data, such as CIMBL55
cuteSV -S CIMBL55 --genotype  --max_size -1  --max_cluster_bias_INS 100 --diff_ratio_merging_INS 0.3 \
--max_cluster_bias_DEL 200 --diff_ratio_merging_DEL 0.5 CIMBL55.bam /data/genome/B73v5/genome.fa B73v5_CIMBL55.vcf CIMBL55
rm -r CIMBL55
# ----------------- SyRI ----------------------
nucmer --maxmatch -c 500 -b 500 -l 200 -g 1000 -p syri_out_genome/B73v5_CIMBL70 /data/genome/B73v5/genome.fa /data/genome/CIMBL70/genome.fa
delta-filter -m -i 95 -l 2000 B73v5_CIMBL70/B73v5_CIMBL70.delta >B73v5_CIMBL70.filter.delta
show-coords -THrd B73v5_CIMBL70/B73v5_CIMBL70.filter.delta >B73v5_CIMBL70.filter.coords
python3 /software/syri-1.4/syri/bin/syri -c B73v5_CIMBL70.filter.coords -d B73v5_CIMBL70.filter.delta -r \
/data/genome.2021/B73v5/genome.fa -q /data/genome/CIMBL70/genome.fa --prefix B73v5_CIMBL70. --lf B73v5_CIMBL70.syri.log
# ----------------- Smartie-sv ----------------
# align contigs of CIMBL70 to B73 genome, edit configs.json (configs.joson of CIMBL70 is in configs/smartie-sv.config.json)
snakemake -s Snakefile -w 50  -p -k -j 35