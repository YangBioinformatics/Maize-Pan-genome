# after long-reads polish, use nextpolish with paired-end short-reads file to conduct short-reads polish
ls CIMBL70_good_1.fq.gz CIMBL70_good_2.fq.gz >sgs.fofn # get paired-end short-reads file into file list
/data/yjwang/ont-denovo-assembly/genome_denovo+polish/newNP/NextPolish/nextPolish sgs.cfg # for short-reads polish