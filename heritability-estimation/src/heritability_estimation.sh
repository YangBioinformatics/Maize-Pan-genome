# prepare bed file, WW-snp.vcf is the snp vcf file corresponding well watered (WW) condition
/software/plink1.9/plink --vcf WW-snp.vcf --make-bed --out WW-snp
# calculate LDAK weightings by chromosome, https://dougspeed.com/calculate-weightings/
for i in {1..10}
do
    ldak --bfile WW-snp --cut-weights chr1_WW-snp --window-prune .98 --window-kb 100 --chr $i --max-threads 8  --allow-multi YES
    ldak --bfile WW-snp --calc-weights-all chr1_WW-snp --chr $i --max-threads 8  --allow-multi YES
done
mkdir WW-snp
# merge all weights into the final weight file (WW-snp/weights.short)
cat "WW-snp_{1..10}/weights.short" > WW-snp/weights.short
# calculate kinship, https://dougspeed.com/calculate-kinships/
ldak --calc-kins-direct WW-snp.LDAK-Thin --bfile WW-snp --weights WW-snp/weights.short --power -.25  --max-threads 8  --allow-multi YES
# calculate PCA using plink
/data01/spyang/wgs/plink1.9/plink --allow-extra-chr --threads 20 -bfile WW-snp --pca 3  --out WW-snp.plink.pca
# estimate SNP heritability, taken gene expression of Zm00001eb000010 under well watered (WW) as an example
ldak --reml  WW-Zm00001eb000010.reml --pheno WW-Zm00001eb000010_expr.txt --grm WW-snp.LDAK-Thin --allow-multi YES --covar WW-snp.plink.pca.eigenvec --constrain YES
