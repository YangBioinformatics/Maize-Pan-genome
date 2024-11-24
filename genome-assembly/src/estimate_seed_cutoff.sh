# before start to use nextdeonovo to correct original reads and assemble genoeme, we need use seq_stat wrapped in nextdeonovo to estimate the "seed_cutoff"

# prepare a file list at first (take CIMBL70 genoeme for an example)
ls CIMBL70.filt.fa.gz > input.fofn

# run the seq_stat

/data/yjwang/ont-denovo-assembly/genome_denovo+polish/NextDenovo/bin/seq_stat -g 2000Mb input.fofn