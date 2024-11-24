# get the spilicing junction information
awk -f ~/NAM_scripts/sjCollapseSamples.awk *_SJ.out.tab | sort -k1,1V -k2,2n -k3,3n > SJ.all
