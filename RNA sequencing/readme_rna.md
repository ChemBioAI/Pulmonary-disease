# RNA Sample Analysis with CircExplorer and CIRI2

This repository contains the commands used for analyzing RNA samples using CircExplorer and CIRI2 pipelines. The analysis includes mapping RNA reads to the human reference genome using BWA, converting SAM files to BAM files, and running the pipelines for circular RNA detection.

## Dataset

The RNA samples used for this analysis were obtained from https://www.ebi.ac.uk/ena/browser/view/PRJNA316136 
The reference human genome GRCh38.p13 was downloaded from https://www.gencodegenes.org/human/release_38.html
Annotatonfile - hg38_ref.txt
GTF file - https://www.gencodegenes.org/human/release_38.html

## Requirements

- BWA (Burrows-Wheeler Aligner): Version: 0.7.17-r1188
- Samtools: Version samtools 1.13
- CircExplorer: [CIRCexplorer2 GitHub Repository](https://github.com/YangLab/CIRCexplorer2)
- CIRI2: CIRI-full_v2.0

## Usage
 
All commands are run in linux terminal

1. **For RNA samples downloading**:
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/004/SRR3286994/SRR3286994.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/000/SRR5515950/SRR5515950.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/006/SRR3286996/SRR3286996.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/004/SRR5515944/SRR5515944.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/006/SRR5515946/SRR5515946.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/002/SRR3286992/SRR3286992.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/007/SRR3286997/SRR3286997.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/002/SRR5515952/SRR5515952.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/008/SRR3286988/SRR3286988.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/000/SRR3286990/SRR3286990.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/008/SRR5515948/SRR5515948.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/001/SRR5515951/SRR5515951.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/008/SRR3286998/SRR3286998.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/003/SRR5515943/SRR5515943.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/005/SRR5515945/SRR5515945.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/005/SRR3286995/SRR3286995.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/003/SRR5515953/SRR5515953.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/009/SRR3286989/SRR3286989.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/002/SRR5515942/SRR5515942.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/003/SRR3286993/SRR3286993.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/007/SRR5515947/SRR5515947.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR551/009/SRR5515949/SRR5515949.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR328/001/SRR3286991/SRR3286991.fastq.gz

2. **Indexing Reference Genome**:
bwa index <reference_genome.fasta>
Here we used GRCh38.p13.fa
bwa index GRCh38.p13.fa

3.  **Mapping RNA Reads**:
# Mapping RNA reads to the reference genome
bwa mem <reference_genome_index.fa> <rna_sample.fastq> > <rna_sample.sam>
Here 's the command to be ran in terminal
bwa mem GRCh38.p13.fa SRR3286994.fastq -t 8 > SRR3286994.sam
bwa mem GRCh38.p13.fa SRR5515950.fastq -t 8 > SRR5515950.sam
bwa mem GRCh38.p13.fa SRR3286996.fastq -t 8 > SRR3286996.sam
bwa mem GRCh38.p13.fa SRR5515944.fastq -t 8 > SRR5515944.sam
bwa mem GRCh38.p13.fa SRR5515946.fastq -t 8 > SRR5515946.sam
bwa mem GRCh38.p13.fa SRR3286992.fastq -t 8 > SRR3286992.sam
bwa mem GRCh38.p13.fa SRR3286997.fastq -t 8 > SRR3286997.sam
bwa mem GRCh38.p13.fa SRR5515952.fastq -t 8 > SRR5515952.sam
bwa mem GRCh38.p13.fa SRR3286988.fastq -t 8 > SRR3286988.sam
bwa mem GRCh38.p13.fa SRR3286990.fastq -t 8 > SRR3286990.sam
bwa mem GRCh38.p13.fa SRR5515948.fastq -t 8 > SRR5515948.sam
bwa mem GRCh38.p13.fa SRR5515951.fastq -t 8 > SRR5515951.sam
bwa mem GRCh38.p13.fa SRR3286998.fastq -t 8 > SRR3286998.sam
bwa mem GRCh38.p13.fa SRR5515943.fastq -t 8 > SRR5515943.sam
bwa mem GRCh38.p13.fa SRR5515945.fastq -t 8 > SRR5515945.sam
bwa mem GRCh38.p13.fa SRR3286995.fastq -t 8 > SRR3286995.sam
bwa mem GRCh38.p13.fa SRR5515953.fastq -t 8 > SRR5515953.sam
bwa mem GRCh38.p13.fa SRR3286989.fastq -t 8 > SRR3286989.sam
bwa mem GRCh38.p13.fa SRR5515942.fastq -t 8 > SRR5515942.sam
bwa mem GRCh38.p13.fa SRR3286993.fastq -t 8 > SRR3286993.sam
bwa mem GRCh38.p13.fa SRR5515947.fastq -t 8 > SRR5515947.sam
bwa mem GRCh38.p13.fa SRR5515949.fastq -t 8 > SRR5515949.sam
bwa mem GRCh38.p13.fa SRR3286991.fastq -t 8 > SRR3286991.sam

4. **Sam to bam file**:
# Converting SAM files to BAM files using Samtools
samtools view -bS <rna_sample.sam> > <rna_sample.bam>

Here 's the command to be ran in terminal

samtools view -bS SRR3286994.sam > SRR3286994.bam
samtools view -bS SRR5515950.sam > SRR5515950.bam
samtools view -bS SRR3286996.sam > SRR3286996.bam
samtools view -bS SRR5515944.sam > SRR5515944.bam
samtools view -bS SRR5515946.sam > SRR5515946.bam
samtools view -bS SRR3286992.sam > SRR3286992.bam
samtools view -bS SRR3286997.sam > SRR3286997.bam
samtools view -bS SRR5515952.sam > SRR5515952.bam
samtools view -bS SRR3286988.sam > SRR3286988.bam
samtools view -bS SRR3286990.sam > SRR3286990.bam
samtools view -bS SRR5515948.sam > SRR5515948.bam
samtools view -bS SRR5515951.sam > SRR5515951.bam
samtools view -bS SRR3286998.sam > SRR3286998.bam
samtools view -bS SRR5515943.sam > SRR5515943.bam
samtools view -bS SRR5515945.sam > SRR5515945.bam
samtools view -bS SRR3286995.sam > SRR3286995.bam
samtools view -bS SRR5515953.sam > SRR5515953.bam
samtools view -bS SRR3286989.sam > SRR3286989.bam
samtools view -bS SRR5515942.sam > SRR5515942.bam
samtools view -bS SRR3286993.sam > SRR3286993.bam
samtools view -bS SRR5515947.sam > SRR5515947.bam
samtools view -bS SRR5515949.sam > SRR5515949.bam
samtools view -bS SRR3286991.sam > SRR3286991.bam

5 . **CIRCEXPLORER 2 PIPELINE USED**:

# Detecting circular RNAs for each sample using fast_circ.py

CIRCexplorer2 denovo -r <annotion_ref> -<ref_genome.fa> back_spliced_junction.bed -o <ouput_directory>

fast_circ.py parse -r <annotion_ref> -g <ref_genome.fa> -t BWA -o  <output_directory> <rna_sample.bam>

Here 's the command to be ran in terminal:

fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286991_circ SRR3286991.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286992_circ SRR3286992.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286993_circ SRR3286993.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286994_circ SRR3286994.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286995_circ SRR3286995.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286996_circ SRR3286996.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286997_circ SRR3286997.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286988_circ SRR3286988.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286989_circ SRR3286989.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286990_circ SRR3286990.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR3286998_circ SRR3286998.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515942_circ SRR5515942.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515943_circ SRR5515943.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515944_circ SRR5515944.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515945_circ SRR5515945.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515946_circ SRR5515946.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515947_circ SRR5515947.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515948_circ SRR5515948.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515949_circ SRR5515949.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515950_circ SRR5515950.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515951_circ SRR5515951.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515952_circ SRR5515952.bam
fast_circ.py parse -r hg38_ref.txt -g GRCh38.p13.genome.fa -t BWA -o SRR5515953_circ SRR5515953.bam


6. **USE OF DENOVO FOR NEW CIRCULAR RNA**:

CIRCexplorer2 denovo -r <annotion_ref> -<ref_genome.fa> back_spliced_junction.bed -o <ouput_directory>

# Running CIRCexplorer2 denovo mode for each sample
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286991.fastq/SRR3286991_circ/back_spliced_junction.bed -o SRR3286991.fastq/denovoSRR3286991_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286992.fastq/SRR3286992_circ/back_spliced_junction.bed -o SRR3286992.fastq/denovoSRR3286992_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286993.fastq/SRR3286993_circ/back_spliced_junction.bed -o SRR3286993.fastq/denovoSRR3286993_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286994.fastq/SRR3286994_circ/back_spliced_junction.bed -o SRR3286994.fastq/denovoSRR3286994_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286995.fastq/SRR3286995_circ/back_spliced_junction.bed -o SRR3286995.fastq/denovoSRR3286995_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286996.fastq/SRR3286996_circ/back_spliced_junction.bed -o SRR3286996.fastq/denovoSRR3286996_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286997.fastq/SRR3286997_circ/back_spliced_junction.bed -o SRR3286997.fastq/denovoSRR3286997_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286988.fastq/SRR3286988_circ/back_spliced_junction.bed -o SRR3286988.fastq/denovoSRR3286988_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286989.fastq/SRR3286989_circ/back_spliced_junction.bed -o SRR3286989.fastq/denovoSRR3286989_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286990.fastq/SRR3286990_circ/back_spliced_junction.bed -o SRR3286990.fastq/denovoSRR3286990_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR3286998.fastq/SRR3286998_circ/back_spliced_junction.bed -o SRR3286998.fastq/denovoSRR3286998_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515942.fastq/SRR5515942_circ/back_spliced_junction.bed -o SRR5515942.fastq/denovoSRR5515942_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515943.fastq/SRR5515943_circ/back_spliced_junction.bed -o SRR5515943.fastq/denovoSRR5515943_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515944.fastq/SRR5515944_circ/back_spliced_junction.bed -o SRR5515944.fastq/denovoSRR5515944_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515945.fastq/SRR5515945_circ/back_spliced_junction.bed -o SRR5515945.fastq/denovoSRR5515945_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515946.fastq/SRR5515946_circ/back_spliced_junction.bed -o SRR5515946.fastq/denovoSRR5515946_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515947.fastq/SRR5515947_circ/back_spliced_junction.bed -o SRR5515947.fastq/denovoSRR5515947_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515948.fastq/SRR5515948_circ/back_spliced_junction.bed -o SRR5515948.fastq/denovoSRR5515948_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515949.fastq/SRR5515949_circ/back_spliced_junction.bed -o SRR5515949.fastq/denovoSRR5515949_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515950.fastq/SRR5515950_circ/back_spliced_junction.bed -o SRR5515950.fastq/denovoSRR5515950_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515951.fastq/SRR5515951_circ/back_spliced_junction.bed -o SRR5515951.fastq/denovoSRR5515951_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515952.fastq/SRR5515952_circ/back_spliced_junction.bed -o SRR5515952.fastq/denovoSRR5515952_circ
CIRCexplorer2 denovo -r hg38_ref.txt -g GRCh38.p13.genome.fa -b SRR5515953.fastq/SRR5515953_circ/back_spliced_junction.bed -o SRR5515953.fastq/denovoSRR5515953_circ


7.**CIRI2 PIPELINE**:

We have the reference genome indexing and fastq files converted into sam now we have to run the perl scriot of ciri2

perl CIRI2.pl -I <rna_sample.sam> -O <output_file> -F <ref_genome.fa> -A <annotation.gtf>

perl CIRI2.pl -I SRR3286991.fastq/SRR3286991.sam -O SRR3286991_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286992.fastq/SRR3286992.sam -O SRR3286992_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286993.fastq/SRR3286993.sam -O SRR3286993_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286994.fastq/SRR3286994.sam -O SRR3286994_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286995.fastq/SRR3286995.sam -O SRR3286995_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286996.fastq/SRR3286996.sam -O SRR3286996_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286997.fastq/SRR3286997.sam -O SRR3286997_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286988.fastq/SRR3286988.sam -O SRR3286988_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286989.fastq/SRR3286989.sam -O SRR3286989_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286990.fastq/SRR3286990.sam -O SRR3286990_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR3286998.fastq/SRR3286998.sam -O SRR3286998_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515942.fastq/SRR5515942.sam -O SRR5515942_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515943.fastq/SRR5515943.sam -O SRR5515943_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515944.fastq/SRR5515944.sam -O SRR5515944_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515945.fastq/SRR5515945.sam -O SRR5515945_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515946.fastq/SRR5515946.sam -O SRR5515946_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515947.fastq/SRR5515947.sam -O SRR5515947_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515948.fastq/SRR5515948.sam -O SRR5515948_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515949.fastq/SRR5515949.sam -O SRR5515949_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515950.fastq/SRR5515950.sam -O SRR5515950_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515951.fastq/SRR5515951.sam -O SRR5515951_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515952.fastq/SRR5515952.sam -O SRR5515952_outfile -F GRCh38.p13.genome.fa -A h.gtf
perl CIRI2.pl -I SRR5515953.fastq/SRR5515953.sam -O SRR5515953_outfile -F GRCh38.p13.genome.fa -A h.gtf


8. **Folder**
The RNA sequencing folder contains 2 pipelins CIRCEXPLORER2 and CIRI2 both these folders contains their scriots and a folder containing all rna samples and its results 



