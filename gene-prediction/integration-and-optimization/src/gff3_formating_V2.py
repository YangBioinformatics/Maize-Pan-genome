#!/bin/env python

import re
import sys


# gene mRNA exon CDS five_prime_UTR three_prime_UTR

geneID_count = 0
#geneID_prefix = 'ZmBY4944a'  # just an example
geneID_prefix = 'Zm' + str(sys.argv[1]) + 'a'
Parent_ID = 'Parent'
# exonID_count = 0

#with open("C:/Users/Yijie Wang/Desktop/sample.gff3") as file:
with open(sys.argv[2]) as file:
    for x in file:
        if not re.match('#', x):
            if x.strip() != '':
                mx = (x.strip()).split()
                feature = str(mx[2])
                strA = ("\t".join(mx[0:8]))
                if re.match('gene', feature):
                    geneID_count = geneID_count + 1
                    mrnaID_count = 0
                    gene_ID = geneID_prefix + str("%05d" % geneID_count) + '0'
                    # strA = ("\t".join(mx[0:8]))
                    strB = "\tID=" + gene_ID
                    strC = strA + strB
                    print(strC)
                if re.match('mRNA', feature):
                    exonID_count = 0
                    mrnaID_count = mrnaID_count + 1
                    # UTR5_ID_count = 1
                    # if gene_ID == Parent_ID:
                    #     mrnaID_count = mrnaID_count + 1
                    # else:
                    #     mrnaID_count = 1
                    # strA = ("\t".join(mx[0:8]))
                    attribute = ((x.strip()).split(";"))
                    AED = str((";".join(attribute[3:])))
                    mRNA_ID = geneID_prefix + str("%05d" % geneID_count) + '0_T' + str("%03d" % mrnaID_count)
                    strB = "\tID=" + mRNA_ID
                    # Parent_ID = gene_ID
                    strC = ';Parent=' + gene_ID+ ';Name=' + mRNA_ID
                    strD = strA + strB + strC + ';' + AED
                    print(strD)
                if re.match('exon', feature):
                    # strA = ("\t".join(mx[0:8]))
                    exonID_count = exonID_count + 1
                    strB = '\tParent=' + mRNA_ID
                    exonName = mRNA_ID + '.exon' + str(exonID_count)
                    strC = strA + strB + ';ID=' + exonName
                    print(strC)
                if re.match('CDS', feature):
                    CDSID_count = mrnaID_count
                    # strA = ("\t".join(mx[0:8]))
                    strB = "\tID=" + gene_ID + '_P' + str("%03d" % CDSID_count) + ';Parent=' + mRNA_ID
                    strC = strA + strB
                    print(strC)
                if re.match('five_prime_UTR', feature):
                    strB = '\tParent=' + mRNA_ID
                    strC = strA + strB
                    print(strC)
                    # UTR5_ID_count = UTR5_ID_count + 1
                if re.match('three_prime_UTR', feature):
                    strB = '\tParent=' + mRNA_ID
                    strC = strA + strB
                    print(strC)
        # else:
        #     print(x)
