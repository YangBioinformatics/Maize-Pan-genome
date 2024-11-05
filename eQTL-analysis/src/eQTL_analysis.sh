# prepare bed file
plink --allow-extra-chr --vcf variants.vcf --indep-pairwise 50 10 0.2 --out variants
plink --allow-extra-chr --vcf variants.vcf --extract variants.prune.in  --make-bed --out variants.pruned
# calculate population structure
admixture --cv %s.prune.in.ped 4 -j16 >variants.prune.in.log.txt
# calculate kinship
plink --allow-extra-chr --vcf variants.vcf --recode 12 transpose --output-missing-genotype 0 --out variants  --autosome-num 90
# eQTL-analysis
emmax -v -d 10 -t variants -o Zm00001eb000010_eqtl_result -p Zm00001eb000010_expr.txt -k variants.kinf -c pop_structure_confounding_factors.txt
