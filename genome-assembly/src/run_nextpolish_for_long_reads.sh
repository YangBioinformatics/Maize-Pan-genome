# after got the draft genomes (raw genomes), use nextpolish to perform long-reads polish at first
ls  CIMBL70.filt.fa.gz >lgs.fofn # get long-reads file into file list
/data/yjwang/ont-denovo-assembly/genome_denovo+polish/newNP/NextPolish/nextPolish lgs.cfg # for long-reads polish
