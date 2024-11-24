# after resolve the inter-chromsome error, use ""scaffold" in ragtag to build chrosome genome
# The minimumCtgLength is the minimum length of contigs in resolved genome. That`s the most popular situation.
# If the results not so good, the "minimumCtgLength" could be bigger.
ragtag.py scaffold -u --aligner nucmer --nucmer-params '-c minimumCtgLength -l 50 -g 1000' -o scaffold B73.v5.genome.fasta CIMBL70.resolved.fasta