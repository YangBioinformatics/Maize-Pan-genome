#!/bin/bash
# use TransDecoder to predict ORFs
# mikado_prepared.fasta contains all the transcripts which was predicted base on RNA-seq in previous step
export PATH=/data/yjwang/BIO-analysistools/R/bin/:$PATH
/data/yjwang/BIO-analysistools/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t mikado_prepared.fasta
/data/yjwang/BIO-analysistools/TransDecoder-TransDecoder-v5.5.0/TransDecoder.Predict -t mikado_prepared.fasta --cpu 16
