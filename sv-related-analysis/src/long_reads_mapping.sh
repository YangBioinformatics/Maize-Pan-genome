# taken CIMBL70 (NanoPore) or CIMBL55 (PacBio) as an example
# -p represents the proportion of samples extracted from the total sequencing data; 0.3 represents extracting 30% from 100× fastq data of CIMBL70
seqkit sample -s100 CIMBL70.filt.fa.gz -p 0.3 -2|/software/gzip-1.10/gzip -c - >30x_CIMBL70.fastq.gz
# long reads mapping, for NanoPore data, such as CIMBL70
minimap2 -ax map-ont --MD -t 32 /data/genome/B73v5/genome.fa CIMBL70.fq.gz >CIMBL70.sam
# long reads mapping, for PacBio data, such as CIMBL55
minimap2 -ax map-pb --MD -t 32 /data/genome/B73v5/genome.fa CIMBL55.fq.gz >CIMBL55.sam
samtools view -@  32 -Sb  CIMBL70.sam | samtools sort -@ 32 -o CIMBL70.bam -
samtools index -@ 32 CIMBL70.bam
rm CIMBL70.sam