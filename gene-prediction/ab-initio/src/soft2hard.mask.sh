#!/bin/bash
# convert softmask fasta into hardmask fasta
cat $1 |awk '{if($0~/>/){print $0}else{gsub(/[atcgn]/,"N",$0);print $0}}'
