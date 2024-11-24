#!/bin/bash
# use strawberry to assemble transcripts
bam="$1"
/data/yjwang/BIO-analysistools/mikado_NAM_module/strawberry \
   --output-gtf strawberry.gtf \
   --logfile strawberry_assembled.log \
   --no-quant \
   --num-threads 12 \
   --min-transcript-size 100 \
     ${bam}
