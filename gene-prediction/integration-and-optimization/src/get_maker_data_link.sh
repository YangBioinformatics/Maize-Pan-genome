#!/bin/bash
name="$1" # genome name
cp ~/NAM_scripts/maker_* ./
ln -s ../g-m.fasta/${name}.soft.mask.fa
ln -s ../TE_filter/${name}.TErmv.gff3
ln -s ../g-transcript-assembly/${name}_mikado.transcripts.fasta
sed -i 's/Jason/'$name'/g' maker_opts.ctl
