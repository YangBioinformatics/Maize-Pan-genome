### TE annotation
The repeat sequence annotation was performed using Extensive de-novo TE Annotator (EDTA) (v1.9.0) 
and RepeatMasker (v4.1.1) as described (Hufford et al., 2021). We only conducted minor revises 
based on scripts uploaded by maize NAM pan-genome research 
(https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation). In brief, novel TE information from
each genome was identified by EDTA and RepeatMasker by comparing with the known TE library 
(MTEC02052020, https://github.com/oushujun/MTEC). By merging all novel TE information, a non-redundant
novel TE library was obtained. This novel TE library is further aggregated with the MTEC library to 
form the final Pan-TE library. LTRs, TIRs, and helitrons were finally annotated based on the Pan-TE library.
The SINEs were annotated by SineFinder (v1.0.1) and long interspersed nuclear elements (LINEs) and
non-TE repeats were directly annotated by RepeatMasker and EDTA.