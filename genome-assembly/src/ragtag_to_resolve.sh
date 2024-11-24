# after got the polished genome, use "correct" in ragtag to resolve the inter-chromsome error
# here we use B73 genome (version file) as the reference genome
ragtag.py correct --inter -u -o correct --aligner nucmer --nucmer-params '-c 50000 -g 1000 -l 50' -o resolve B73.v5.genome.fasta CIMBL70.polished.fasta