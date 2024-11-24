### Genome assembly
In brief, the original ONT sequenced reads were corrected and then used to assemble the draft genome by 
NextDenovo (v2.3.1). Then the draft genome was polished by NextPolish (v1.3.1). Each genome got two round of
long-reads polish and two round of short-reads polish. After this, the RagTag (v2.1.0) was used 
to constructed pseudomolecule genome.