#!/bin/bash
# prepare all the files that the mikado needed
list=$1 # contain the gtf files from stringtie, strawberry, cufflinks, class2 and trinity(by running gmap).
junctions=$2 #portcullis_filtered.pass.junctions.bed
genome=$3
pathA=`realpath $1`
pathB=`realpath $2`
pathC=`realpath $3`
echo $pathA
echo $pathB
echo $pathC
# run configure
mikado configure \
   --list $list \
   --reference $genome \
   --mode permissive \
   --scoring plant.yaml \
   --copy-scoring plant.yaml \
   --junctions $junctions configuration.yaml
# edit config files
rm ./plant.yaml
sed -i 's/threads: 1/threads: 12/g' configuration.yaml # configuration.yaml was generated from mikado configure step
sed -i 's/plant.yaml/\/home\/yjwang\/NAM_scripts\/plant.yaml/g' configuration.yaml #use custom plant.yaml (referred from NAM pan-genome analysis)
# consolidate transcripts
mikado prepare \
   --json-conf configuration.yaml
mkdir blastjobs
cd blastjobs
# cp /data/yjwang/Genomics-Analysis/NAM_anno_module/data/uniprot-sprot_viridiplantae.fasta ./
# /data/yjwang/BIO-analysistools/ncbi-blast-2.10.1+/bin/makeblastdb -in uniprot-sprot_viridiplantae.fasta -dbtype prot -parse_seqids > blast_prepare.log
ln -s ../mikado_prepared.fasta ./
# split fasta and run BLAST
seqkit split -p 8 mikado_prepared.fasta
cd mikado_prepared.fasta.split/
ls mikado_prepared.part_*.fasta|while read i;do(echo "sh /home/yjwang/NAM_scripts/blastx.sh $i");done > blastx.jobs
parallel -j 8 < blastx.jobs &
# run Transcdecoder
cd ../../
# sh /home/yjwang/NAM_scripts/transDecoder.sh
export PATH=/data/yjwang/BIO-analysistools/R/bin/:$PATH
/data/yjwang/BIO-analysistools/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t mikado_prepared.fasta
/data/yjwang/BIO-analysistools/TransDecoder-TransDecoder-v5.5.0/TransDecoder.Predict -t mikado_prepared.fasta --cpu 16
