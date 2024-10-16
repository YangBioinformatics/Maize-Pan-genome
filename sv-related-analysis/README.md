### Long-reads alignment (Sniffles and CuteSV) and genome sequence alignment (syri and smarite-sv) were used to identify SV between B73 (v5) and the remaining 55 genomes.
###### 1.	Sniffles (https://github.com/fritzsedlazeck/Sniffles) and CuteSV  (https://github.com/tjiangHIT/cuteSV) <br>
About 30× raw long-reads sequencing fastq data for each accession was sampled using seqkit 
(https://github.com/shenwei356/seqkit). Then, fastq data of each accession was aligned to B73 (v5) to generated SAM file.
These SAM files were further converted to BAM files for following SV calling.
###### 2.	SyRi (https://github.com/schneebergerlab/syri)
###### 3.	Smartie-sv (https://github.com/zeeev/smartie-sv)