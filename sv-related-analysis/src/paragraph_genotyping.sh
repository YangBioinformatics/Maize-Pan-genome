# fastq data quality control
/software/fastp/fastp -w 4 -i CIMBL70_1.fq.gz -o qc_CIMBL70_1.fq.gz -I CIMBL70_2.fq.gz -O qc_CIMBL70_2.fq.gz -j CIMBL70.report.json -h CIMBL70.json.html
# mapping short reads to B73
mkdir mapping_bam
/home/spyang/anaconda3.2019.04/bin/bwa mem -t 32 -M /data/genome/B73v5/genome.fa \
 -R "@RG\tID:CIMBL70\tLB:CIMBL70\tPL:Illumina\tSM:CIMBL70\tPU:run"  qc_CIMBL70_1.fastq.gz  qc_CIMBL70_2.fastq.gz \
 |samtools view -@  32 -Sb  - | samtools sort -@ 32 -o mapping_bam/CIMBL70.bam -
# mapping quality control
samtools view -@  32 -q 30 mapping_bam/CIMBL70.bam -o mapping_bam/CIMBL70.q30.bam
java -Xms1g -Xmx16g -XX:ParallelGCThreads=10 -jar picard.jar \
MarkDuplicates I=mapping_bam/CIMBL70.q30.bam TMP_DIR=tmp/CIMBL70 O=rmdup_bam/CIMBL70.sorted.markdup.bam \
REMOVE_DUPLICATES=true M=rmdup_bam/CIMBL70.mark_dup_matrix \
samtools index -@ 10 rmdup_bam/CIMBL70.sorted.markdup.bam
# call SVs through parapgrah
mkdir tmp
python /software/paragraph_2.4/bin/multigrmpy_prepare.py -t 16 -M 400 -i example/variants.vcf -m \
 example/sample_list.txt -r /data/genome/B73v5/genome.fa -o genotyping/variants.genotyped --scratch-dir tmp/variants
python /software/paragraph_2.4/bin/multigrmpy_run.py -t 10 -M 400 -i example/variants.vcf -m \
 example/chr10_33.txt -r /data/genome/B73v5/genome.fa -o genotyping/variants.genotyped --scratch-dir tmp/variants
