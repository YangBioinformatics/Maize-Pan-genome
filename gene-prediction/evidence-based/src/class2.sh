#!/bin/bash
# use class2 to assemble transcripts
bam="$1"
perl /data/yjwang/BIO-analysistools/mikado_NAM_module/CLASS-2.1.7/run_class.pl \
   -a $bam \
   -o class.gtf \
   -p 8 \
   --verbose \
   --clean
