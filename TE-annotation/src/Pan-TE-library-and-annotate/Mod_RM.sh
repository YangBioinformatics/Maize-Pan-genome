#!/bin/bash
# referred from https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation
# made some modifications to the out file from RepeatMasker
# use this after the RM.sh
name=${1} # genome name
out_file = ${2}
perl -nle 's/knob180_knob180/knob180/g;\
            s/CentC_CentC/CentC/g; \
            s/Unspecified/LTR\/CRM/g; \
            s/4\-12\-1_CL569186.1/CL569186.1/; \
            s/TR\-1_TR\-1/TR\-1/g;  \
            next if /TE_00018291_LTR/; \
            next if /TE_00013511/; \
            next if /TE_00016670_LTR/; \
            print $_' ${out_file}> ${1}.genome.out.mod &
