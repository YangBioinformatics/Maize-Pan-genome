#!/bin/bash
# use stringtie to assemble transcripts

bam="$1"
/data/yjwang/BIO-analysistools/mikado_NAM_module/stringtie/stringtie \
   ${bam} \
   -m 100 \
   -p 8 \
   -v \
   -o stringtie.gtf
