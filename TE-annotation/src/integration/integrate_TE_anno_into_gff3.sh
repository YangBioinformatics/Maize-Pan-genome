#!/bin/bash
# get the pan-TE lib annotation and the SINEs annotation into gff3 file together
genome = $1
cat ~/bin/ONT_genome.list |while read i;do(cat $genome.EDTA.final.gff3 $genome.SINE.gff3 > $genome.EDTA_SINE.gff3);done
cat ~/bin/ONT_genome.list|while read i;do(gff3_sort -r -g $genome.EDTA_SINE.gff3 -o $genome.sort &);done
cat ~/bin/ONT_genome.list |while read i;do(cat $genome.sort|sed 's/###//g'|awk '$0' > $genome.TE.gff3);done
