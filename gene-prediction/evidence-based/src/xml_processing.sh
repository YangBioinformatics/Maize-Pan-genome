#!/bin/bash
# processing blastx results with BlastXMLmerge.py
# the BlastXMLmerge.py origin from https://github.com/HuffordLab/NAM-genomes/blob/master/gene-prediction/scripts-evidence/BlastXMLmerge.py
for xml in *xml.gz; do
   gunzip $xml;
done
python2.7 /home/yjwang/NAM_scripts/BlastXMLmerge.py ../../mikado.blast.xml *.xml
for xml in *xml; do
   gzip $xml;
done