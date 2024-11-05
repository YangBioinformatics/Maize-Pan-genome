# fastq data quality control, taken wild type of repeat 1 under well watered condition (WW-WT-1) as example, '_1' is one end of paired-end sequencing, '_2' is the other end.
/software/fastp/fastp -w 4 -i WW-WT-1_1.fq.gz -o qc_WW-WT-1_1.fq.gz -I fastq/WW-WT-1_2.fq.gz -O fastq/qc_WW-WT-1_2.fq.gz -j WW-WT-1.report.json -h WW-WT-1.json.html
# ------------------------------ RNA-seq analysis -------------------------------
# Build HISAT genome index, 'genome' represent B73 (v5)
gffread genome.gff3 -T -o genome.gtf
/software/bin/hisat2_extract_exons.py genome.gtf >genome.exon
/software/bin/hisat2_extract_splice_sites.py genome.gtf >genome.ss
/software/bin/hisat2-build -p 80 genome.fa --ss genome.ss --exon genome.exon B73v5_tran
# map RNA-seq clean data to reference genome using HISAT2
/software/bin/hisat2 -p 16  --dta -x  B73v5_tran -1 fastq/qc_WW-WT-1_1.fq.gz
-2 fastq/qc_WW-WT-1_2.fq.gz |/software/bin/samtools view  -@ 10 -bhS -q 30 -|/software/bin/samtools sort \
-@ 10 -o mapping_bam/WW-WT-1.sorted.bam
/software/bin/samtools index -@ 32 mapping_bam/WW-WT-1.sorted.bam
# call gene expression by stringtie
/software/bin/stringtie  -e -A ./stringtie/WW-WT-1.gene_expr -p 8 -G genome.gtf \
 -o ./stringtie/WW-WT-CRISPR-1.gtf WW-WT-1.sorted.bam
# Identifying differentially expressed genes (DEGs) of WW-i1 (treatment) compared to WW-WT (control)
/software/bin/python /software/bin/run_rnacocktail.py diff  --threads 8 \
--alignments WW-i1-1.sorted.bam,WW-i1-2.sorted.bam WW-WT-1.sorted.bam,WW-WT-2.sorted.bam \
--sample WW-i1-1,WW-i1-2 WW-WT-1,WW-WT-2 --ref_gtf genome.gtf --outdir WW-i1__WW-WT --workdir WW-i1__WW-WT_work
--featureCounts /software/bin/featureCounts --featureCounts_opts  " -p -B"
# ------------------------------ ChIP-seq analysis -------------------------------
# Build Bowtie2 genome index, 'genome' represent B73 (v5)
/software/bowtie2-2.4.5-linux-x86_64/bowtie2/bowtie-build genome.fa /data/genome.2021/B73v5/genome
# map ChIP-seq clean data to reference genome using Bowtie2
/software/bowtie2-2.4.5-linux-x86_64/bowtie2 -p 32  -x /data/genome.2021/B73v5/genome -1 fastq/WW-WT-1-Leaf_1.fq.gz -2 \
 fastq/WW-WT-1-Leaf_2.fq.gz|/software/bin/samtools view -@ 32 -bS -q 10 -o mapping_bam/WW-WT-1-Leaf.tmp.bam
/software/bin/samtools sort -@ 32 mapping_bam/WW-WT-1-Leaf.tmp.bam >mapping_bam/WW-WT-1-Leaf.bam
rm mapping_bam/WW-WT-1-Leaf.tmp.bam
/software/bin/samtools index -@ 32 mapping_bam/WW-WT-1-Leaf.bam
/software/bin/java -Xms1g -Xmx16g -XX:ParallelGCThreads=10 -jar /software/bin/picard.jar MarkDuplicates \
 I=mapping_bam/WW-WT-1-Leaf.bam TMP_DIR=tmp/WW-WT-1-Leaf O=rmdup_bam/WW-WT-1-Leaf.sorted.markdup.bam \
 REMOVE_DUPLICATES=true M=rmdup_bam/WW-WT-1-Leaf.mark_dup_matrix
/software/bin/samtools index -@ 32 rmdup_bam/WW-WT-1-Leaf.sorted.markdup.bam
/software/bin/bamCoverage --numberOfProcessors 32 -b rmdup_bam/WW-WT-1-Leaf.sorted.markdup.bam \
 --binSize 10 --effectiveGenomeSize 2300000000 --normalizeUsing RPKM -o rmdup_bam/WW-WT-1-Leaf.RPKM.bw