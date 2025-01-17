# Maize Pan-genome 

# Installation
We did not develop new tools; instead, we provide scripts and workflows for data analysis. The required software and their versions are listed in the software dependencies.
The pipeline was written with bash/python and was only tested on Linux platform.
Runtime environment: OS Requirements (Centos 8),  Python 3.7.11

# Demo data
The reference genome for maize pan genome analysis is B73 (version 5).
Raw sequencing data is available at is [NCBI](https://dataview.ncbi.nlm.nih.gov/object/PRJNA1103102?reviewer=lh8b609gr4nu5763dvvqduask8). 


## Software dependencies
```
1. Genome assembly and quality evaluation: NextDenovo (v2.3.1), NextPolish (v1.3.1), LTR_retriever (v2.9.0), BUSCO (v4.1.4) and RagTag (v2.1.0)

2. Gene annotation: STAR (v2.7.7a), Trinity (v2.11.0), StringTie (v2.0.6), Strawberry (v1.1.2), Cufflinks (v2.2.1), Class2 (v2.1.7), Mikado (v2.4.4), Portcullis (v1.2.0), TransDecoder, BLASTx (v2.9.0), BRAKER (v2.1.6), RepeatMasker (v4.1.1), AGAT (v0.6.0), PASA (v2.4.1), TEsorter (v1.3), MAKER-P (v3.01.03), USEARCH (v11.0.667), GFF3toolkit (v2.0.3), InterProScan (v5.52-86.0) and TRaCE, BUSCO (v4.1.4)
 
3. Repeat sequence annotation: EDTA (v1.9.0), RepeatMasker (v4.1.1) and SineFinder (v1.0.1); 
 Gene family identification: OrthoFinder (v2.5.5)
 
4. SV identification: SyRi (v1.4), Smartie-sv, Sniffles (v1.0.12), cuteSV (v1.0.13), MUMmer (v4.0), minimap (v2.1) and Jasmine (v1.0.0)
 
4. Graph-genome construction and SV genotyping: vg (v.1.46.0), BWA (v0.7.17) and Paragraph (v2.4) 
 
5. Heritability estimation: LDAK (v5.2)

6. RNA-seq and eQTL analysis: fastp (v0.23.2), STAR (v2.7.7a), StringTie (v2.1.7) and EMMAX. 

7. ZmSIL2-related-analysis: Bowtie2 (v2.4.5), SAMtools (v1.6) and MACS2 (v2.7.1)
 
```
# Contacts
Shiping Yang (shi_ping_yang@163.com) and Yijie Wang (yijiewang0101@163.com)

# Citation
If you use this pipeline in your work, please citate our paper (preparing)