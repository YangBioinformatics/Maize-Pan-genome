#!/bin/bash
# run mikado to get final transcript
cd ./blastjobs/mikado_prepared.fasta.split/
sh ~/NAM_scripts/xml_processing.sh
cd -

nam="$1"
genome="$2"
blastxml=$(realpath mikado.blast.xml)
pathGenome=`realpath $genome`
targets=/data/yjwang/Genomics-Analysis/NAM_anno_module/Gene/uniprot_database/uniprot-sprot_viridiplantae.fasta
orfs=$(realpath mikado_prepared.fasta.transdecoder.bed)
junctions=$(realpath portcullis_filtered.pass.junctions.bed)
echo $blastxml
echo $orfs
echo $junctions
echo $pathGenome
# serialise
mikado serialise \
   --start-method spawn \
   --procs 32 \
   --blast_targets ${targets} \
   --json-conf configuration.yaml \
   --xml ${blastxml} \
   --orfs ${orfs} \
   --junctions ${junctions}
# pick
mikado pick \
   --start-method spawn \
   --procs 32 \
   --json-conf configuration.yaml \
   --subloci-out mikado.subloci.gff3
# data collect   
mkdir -p ../g-transcript-assembly/base-assemblies/
cp mikado.loci.gff3 ../g-transcript-assembly/${nam}_mikado.loci.gff3
cp mikado.loci.metrics.tsv ../g-transcript-assembly/${nam}_mikado.loci.metrics.tsv
cp mikado.loci.scores.tsv ../g-transcript-assembly/${nam}_mikado.loci.scores.tsv
gffread mikado.loci.gff3 -g ${genome} -t mRNA -x ${nam}_mikado.transcripts.fasta -y ${nam}_mikado.proteins.fasta
cp ${nam}_mikado.proteins.fasta ../g-transcript-assembly/${nam}_mikado.proteins.fasta
cp ${nam}_mikado.transcripts.fasta ../g-transcript-assembly/${nam}_mikado.transcripts.fasta
cp ${nam}_TrinityGG-mapped.gff3 ../g-transcript-assembly/base-assemblies/
cp stringtie.gtf ../g-transcript-assembly/base-assemblies/${nam}_Stringtie.gtf
cp strawberry.gtf ../g-transcript-assembly/base-assemblies/${nam}_Strawberry.gtf
cp transcripts.gtf ../g-transcript-assembly/base-assemblies/${nam}_Cufflinks.gtf
cp class.gtf ../g-transcript-assembly/base-assemblies/${nam}_Class2.gtf
cp ../Trinity-GG.fasta ../g-transcript-assembly/base-assemblies/${nam}_Trinity-GG.fasta
