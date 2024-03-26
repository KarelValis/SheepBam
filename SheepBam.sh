>curl -o genome2 https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCF_016772045.2/download?    include_annotation_type=GENOME_FASTA&include_annotation_type=GENOME_GFF&include_annotation_type=RNA_FASTA&include_annotation_type=CDS_FASTA&include_annotation_type=PROT_FASTA&include_annotation_type=SEQUENCE_REPORT&hydrated=FULLY_HYDRATED

# Fetch sheep shot-gun assembly fasta reference from NCBI /to/your/pathway

>minimap2 -t 6 -a -x sr /pathway/to/your/reference.fa pathway/to/your/R1.fq R2.fq -o file.sam

# Aligns your fastq sequences to the fasta reference in /your/pathway through the bwa (#6 means # of threads) & generates .sam file

>samtools fixmate -@ 6 -O bam,level=1 file.sam file.fixmate.bam

# Fix mate pairs & converts .sam -> compressed .fixmate.bam

>samtools fixmate -@ 6 -O bam,level=1 -m file.sam file.fixmate.bam

# Generates more compressed .fixmate.bam

>samtools sort -@ 6 /pathway/to/your/file.fixmate.bam -o /pathway/to/your/file.fix.sort.bam

# Sorts reads in fix.bam & generates fix.sort.bam

>samtools markdup -@ 6 -O bam,level=1 file.fix.sort.bam file.markdup.bam

# Mark duplicite in fix.sort.bam & generates compressed markdup.bam

>samtools flagstats pathway/to/your/file.markdup.bam

# Shows statistical overview of your markdup.bam 

>samtools view -@ 6 file.markdup.bam -o file.final.bam

# Converts markdup.bam -> final.bam

>samtools index /pathway/to/your/file.final.bam

# Generates indexes for your final.bam -> binary final.bam.bai file
