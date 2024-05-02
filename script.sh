


#!/bin/bash

# Set the path to the input directory containing your RNA-Seq data
input_dir="/media/anita/OTHER/SHADAB/STRAND19DEC/untrimmed"

# Set the path to the output directory where the results will be stored
output_dir="/media/anita/OTHER/SHADAB/STRAND19DEC/untrimmed/output"

# Create main output directory if it doesn't exist
mkdir -p "$output_dir"

    # Create subdirectories if they don't exist
    mkdir -p "$output_dir/fastqc"
    mkdir -p "$output_dir/trimmed"
    mkdir -p "$output_dir/star"
    mkdir -p "$output_dir/marked_duplicates"
    mkdir -p "$output_dir/htseq"

# Loop through each pair of fastq files in the input directory
for forward_read in "$input_dir"/*_R1_001.fastq.gz; do
    # Extract the base name of the file without extension
    base_name=$(basename -- "$forward_read")
    base_name_no_ext="${base_name%_R1_001.fastq.gz}"

    # Identify the corresponding reverse read
    reverse_read="$input_dir/${base_name_no_ext}_R2_001.fastq.gz"

    # FastQC analysis
    fastqc -t 100 "$forward_read" "$reverse_read" --outdir "$output_dir/fastqc"

    # Trimmomatic
    java -jar /media/anita/OTHER/SOFTWARE_LIBRARY/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 -threads 100 "$forward_read" "$reverse_read" "$output_dir/trimmed/${base_name_no_ext}_R1_trimmed.fastq.gz" "$output_dir/trimmed/${base_name_no_ext}_R1_unpaired.fastq.gz" "$output_dir/trimmed/${base_name_no_ext}_R2_trimmed.fastq.gz" "$output_dir/trimmed/${base_name_no_ext}_R2_unpaired.fastq.gz" ILLUMINACLIP:/media/anita/OTHER/SOFTWARE_LIBRARY/Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10:2:true SLIDINGWINDOW:4:15 MINLEN:36

    # STAR alignment
    STAR --runThreadN 100 --genomeDir /media/anita/OTHER/STAR_INDEX_HG38 --readFilesCommand zcat --readFilesIn "$output_dir/trimmed/${base_name_no_ext}_R1_trimmed.fastq.gz" "$output_dir/trimmed/${base_name_no_ext}_R2_trimmed.fastq.gz" --outSAMtype BAM Unsorted --outFileNamePrefix "$output_dir/star/${base_name_no_ext}_"
 
    # Sort SAM file by query name using Picard
    java -jar /media/anita/OTHER/SOFTWARE_LIBRARY/bin/picard.jar SortSam INPUT="$output_dir/star/${base_name_no_ext}_Aligned.out.bam" OUTPUT="$output_dir/star/${base_name_no_ext}_Aligned.sortedByName.out.bam" SORT_ORDER=queryname

    # MarkDuplicates
    java -jar /media/anita/OTHER/SOFTWARE_LIBRARY/bin/picard.jar MarkDuplicates I="$output_dir/star/${base_name_no_ext}_Aligned.sortedByName.out.bam" O="$output_dir/marked_duplicates/${base_name_no_ext}_marked_duplicates.bam" M="$output_dir/marked_duplicates/${base_name_no_ext}_marked_dup_metrics.txt" ASSUME_SORT_ORDER=queryname

    # HTSeq-count
    htseq-count -f bam -r name --stranded reverse -i gene_name "$output_dir/marked_duplicates/${base_name_no_ext}_marked_duplicates.bam" /media/anita/OTHER/GENOME_DIR/hg19/HG19.gtf > "$output_dir/htseq/${base_name_no_ext}_htseq_counts.txt"
    
done

