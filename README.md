# Maize Pan-genome. 

# Installation
Prerequisites
The pipeline was written with bash/python and was only tested on Linux platform.
Runtime environment: Centos 8,  Python 3.7.11

## Software dependencies
 >Genome assembly and quality evaluation: NextDenovo (v2.3.1), NextPolish (v1.3.1), LTR_retriever (v2.9.0), BUSCO (v4.1.4) and RagTag (v2.1.0). 
>Gene annotation: STAR (v2.7.7a), Trinity (v2.11.0), StringTie (v2.0.6), Strawberry (v1.1.2), Cufflinks (v2.2.1), Class2 (v2.1.7), Mikado (v2.4.4), Portcullis (v1.2.0), TransDecoder, BLASTx (v2.9.0), BRAKER (v2.1.6), RepeatMasker (v4.1.1), AGAT (v0.6.0), PASA (v2.4.1), TEsorter (v1.3), MAKER-P (v3.01.03), USEARCH (v11.0.667), GFF3toolkit (v2.0.3), InterProScan (v5.52-86.0) and TRaCE, BUSCO (v4.1.4); 
 >Repeat sequence annotation: EDTA (v1.9.0), RepeatMasker (v4.1.1) and SineFinder (v1.0.1); 
 Gene family identification: OrthoFinder (v2.5.5); 
 SV identification: SyRi (v1.4), Smartie-sv, Sniffles (v1.0.12), cuteSV (v1.0.13), MUMmer (v4.0), minimap (v2.1) and Jasmine (v1.0.0). 
 Graph-genome construction and SV genotyping: vg (v.1.46.0), BWA (v0.7.17) and Paragraph (v2.4). 
 RNA-seq and eQTL analysis: fastp (v0.23.2), STAR (v2.7.7a), StringTie (v2.1.7) and EMMAX. 
 Heritability estimation: LDAK (v5.2); 
 ChIP-seq: Bowtie2 (v2.4.5), SAMtools (v1.6) and MACS2 (v2.7.1). 

# Contacts
Shiping Yang (shi_ping_yang@163.com) and Yijie Wang (yijiewang0101@163.com)

# Citation
If you use this pipeline in your work, please citate our paper (preparing).