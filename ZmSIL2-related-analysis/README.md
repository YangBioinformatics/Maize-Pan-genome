### RNA-seq and ChIP-seq analysis
##### For both RNA-seq and ChIP-seq data, Quality control of Illumina short reads sequencing data for each sample was conducted by fastp (https://github.com/OpenGene/fastp). 
##### 1) RNA-seq analysis
Clean FASTQ reads were mapped to B73 (v5) by HISAT (https://daehwankimlab.github.io/hisat2/). Then, the generated 
Binary Alignment Map (BAM, https://en.wikipedia.org/wiki/Binary_Alignment_Map) files were used for following 
differentially expressed genes (DEGs) identification by DESeq2 (https://github.com/thelovelab/DESeq2).
##### 2) ChIP-seq analysis
Clean FASTQ reads were to B73 (v5) by Bowtie2 (https://bowtie-bio.sourceforge.net/bowtie2/index.shtml).
Then, the generated BAM files were used for peak calling by MACS2 (https://github.com/macs3-project/MACS/wiki/Install-macs2).
To identify the binding motifs of ZmSIL2, 500-bp sequences flanking all peak summit were submit to MEME-ChIP online server (https://meme-suite.org/meme/tools/meme-chip).