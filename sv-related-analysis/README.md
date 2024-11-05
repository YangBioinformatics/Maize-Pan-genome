## 1. SV identification
#### Long-reads alignment (Sniffles and CuteSV) and genome sequence alignment (SyRI and smarite-sv) were used to identify SV between B73 (v5) and the remaining 55 genomes.
##### 1) Sniffles (https://github.com/fritzsedlazeck/Sniffles) and cuteSV  (https://github.com/tjiangHIT/cuteSV) <br>
About 30× raw long-reads sequencing fastq data for each accession was sampled using seqkit 
(https://github.com/shenwei356/seqkit). Then, fastq data of each accession was aligned to B73 (v5) to generated SAM file.
These SAM files were further converted to BAM files for SV calling by sniffles.
##### 2) SyRI (https://github.com/schneebergerlab/syri)
NUCMER (https://github.com/mummer4/mummer) was first used to conduct whole-genome alignment between query genome and B73. The alignment results were further used to identify SVs by SyRI.
##### 3) Smartie-sv (https://github.com/zeeev/smartie-sv)
Contigs of a query genome was aligned to B73 to identify SVs by smartie-sv.
## 2. SV genotyping based on linear reference genome (B73)
Quality control of Illumina short reads sequencing data for each sample was conducted by fastp (https://github.com/OpenGene/fastp). 
Then, the clean fastq reads of each accession were further aligned to B73 by BWA (https://github.com/lh3/bwa) to generate a BAM 
(Binary Alignment Map, https://en.wikipedia.org/wiki/Binary_Alignment_Map) file for each sample.
Based on all BAM files and SVs identified by the above four methods, SVs at the population level were genotyped by paragraph. 
## 3. SV genotyping based on the graph genome
The clean fastq reads of each accession were aligned to the graph genome by giraffe (https://github.com/vgteam/vg) 
to generate a gam (Graph Alignment / Map, vg's BAM, https://github.com/vgteam/vg/wiki/File-Formats) file.
SVs at the population level were genotyped by vg (https://github.com/vgteam/vg). Related scripts were in the graph-genome folder.