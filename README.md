# Maize Pan-genome related scripts and pipelines
# Contents
1. [Genome assembly and quality evaluation](genome-assembly/README.md)
2. [Gene annotation](gene-prediction/README.md)
3. [Repeat sequence annotation](TE-annotation/README.md)
4. [SV identification](SV-identification-genotyping/README.md)
5. [Heritability estimation](heritability-estimation/README.md)
6. [eQTL analysis](eQTL-analysis/README.md)
7. [Graph genome construction](graph-genome-construction)
8. [ZmSIL2-related-analysis](ZmSIL2-related-analysis)
# Installation
We did not develop any software that requires compilation or complex installation. Scripts and pipelines provided rely on existing software, with dependencies and versions outlined in the software dependencies section.
The scripts and workflows were written with bash/python and were only tested on Linux platform.
Runtime environment: OS Requirements (Centos 8), Python 3.7.11
```
Usage: git clone https://github.com/YangBioinformatics/Maize-Pan-genome.git
```
# External data
1. The reference genome for maize pan genome analysis is [B73 (version 5)](https://download.maizegdb.org/Zm-B73-REFERENCE-NAM-5.0/).
2. Raw sequencing data (Nanopore, DNA/RNA Illumina sequencing and genome sequences of 25 newly assembled maize germplasms, as well as RNA-seq and ChIP-seq data for transgenic plants) is available at NCBI BioProject: [PRJNA1103102](https://dataview.ncbi.nlm.nih.gov/object/PRJNA1103102?reviewer=lh8b609gr4nu5763dvvqduask8) (Currently, this data can only be viewed but cannot be downloaded). 
3. In addition, the genome sequence and annotation data have also been uploaded to the [MaizeGDB](https://www.maizegdb.org/) website. For above data, we will make them publicly available immediately after the paper is accepted or during the review process if requested by the reviewers/editors. 
4. SV information at the pan-genome and population level is avaiable at [zenodo](https://zenodo.org/records/14736924).
5. Other dependent data has been placed in a separate directory or documented in the README file within the directory.

# Software dependencies
```
1. Genome assembly and quality evaluation: NextDenovo (v2.3.1), NextPolish (v1.3.1), LTR_retriever (v2.9.0), BUSCO (v4.1.4) and RagTag (v2.1.0)

2. Gene annotation: STAR (v2.7.7a), Trinity (v2.11.0), StringTie (v2.0.6), Strawberry (v1.1.2), Cufflinks (v2.2.1), Class2 (v2.1.7), Mikado (v2.4.4), Portcullis (v1.2.0), TransDecoder, BLASTx (v2.9.0), BRAKER (v2.1.6), RepeatMasker (v4.1.1), AGAT (v0.6.0), PASA (v2.4.1), TEsorter (v1.3), MAKER-P (v3.01.03), USEARCH (v11.0.667), GFF3toolkit (v2.0.3), InterProScan (v5.52-86.0) and TRaCE, BUSCO (v4.1.4)
 
3. Repeat sequence annotation: EDTA (v1.9.0), RepeatMasker (v4.1.1) and SineFinder (v1.0.1)
 
4. SV identification: SyRi (v1.4), Smartie-sv, Sniffles (v1.0.12), cuteSV (v1.0.13), MUMmer (v4.0), minimap (v2.1) and Jasmine (v1.0.0)
 
5. Graph-genome construction and SV genotyping: vg (v.1.46.0), BWA (v0.7.17) and Paragraph (v2.4) 
 
6. Heritability estimation: LDAK (v5.2)

7. RNA-seq and eQTL analysis: fastp (v0.23.2), STAR (v2.7.7a), StringTie (v2.1.7) and EMMAX 

8. ChIP-seq analysis: Bowtie2 (v2.4.5), SAMtools (v1.6) and MACS2 (v2.7.1)
 
```
# Contacts
Shiping Yang (shi_ping_yang@163.com) and Yijie Wang (yijiewang0101@163.com)

# Citation
If you use this pipeline in your work, please citate our paper (In preparing)