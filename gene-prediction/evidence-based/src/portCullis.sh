#!/bin/bash
# use portcullis to get high-confidence spilicing junction from BAM file
genome=$1
bam=$2
portcullis full \
   -t 16 \
   --orientation FR \
   --strandedness unstranded \
   --use_csi \
   --output ./ \
     $genome \
     $bam
