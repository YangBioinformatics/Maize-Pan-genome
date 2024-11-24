#!/bin/bash
# use cufflinks to assemble transcripts
bam="$1"
mkdir -p cuff_output
/data/yjwang/BIO-analysistools/mikado_NAM_module/cufflinks-2.2.1.Linux_x86_64/cufflinks \
   --output-dir cuff_output \
   --num-threads 64 \
   --frag-len-mean 100 \
   --no-update-check \
   ${bam}
