# fastq data quality control, taken wild type of repeat 1 under well watered condition (WW-WT-1) as example, '_1' is one end of paired-end sequencing, '_2' is the other end.
/software/fastp/fastp -w 4 -i WW-WT-1_1.fq.gz -o qc_WW-WT-1_1.fq.gz -I WW-WT-1_2.fq.gz -O qc_WW-WT-1_2.fq.gz -j WW-WT-1.report.json -h WW-WT-1.json.html
# Build HISAT genome index, 'genome' represent B73 (v5)
gffread genome.gff3 -T -o genome.gtf
/software/bin/hisat2_extract_exons.py genome.gtf >genome.exon
/software/bin/hisat2_extract_splice_sites.py genome.gtf >genome.ss
/software/bin/hisat2-build -p 80 genome.fa --ss genome.ss --exon genome.exon B73v5_tran
# map RNA-seq clean data to reference genome using HISAT2
/software/bin/hisat2 -p 16  --dta -x  B73v5_tran -1 fastq/qc_WW-WT-1_1.fq.gz
-2 fastq/qc_WW-WT-1_2.fq.gz |/software/bin/samtools view  -@ 10 -bhS -q 30 -|/software/bin/samtools sort -@ 10 -o mapping_bam/WW-WT-1.sorted.bam
/software/bin/samtools index -@ 32 mapping_bam/WW-WT-1.sorted.bam
# call gene expression by stringtie
/software/bin/stringtie  -e -A ./stringtie/WW-WT-1.gene_expr -p 8 -G genome.gtf -o ./stringtie/WW-WT-CRISPR-1.gtf WW-WT-1.sorted.bam
# Identifying differentially expressed genes (DEGs) of WW-i1 (treatment) compared to WW-WT (control)
/software/bin/python /software/bin/run_rnacocktail.py diff  --threads 8 --alignments WW-i1-1.sorted.bam,WW-i1-2.sorted.bam WW-WT-1.sorted.bam,WW-WT-2.sorted.bam
--sample WW-i1-1,WW-i1-2 WW-WT-1,WW-WT-2 --ref_gtf genome.gtf --outdir WW-i1__WW-WT --workdir WW-i1__WW-WT_work
--featureCounts /software/bin/featureCounts --featureCounts_opts  " -p -B"