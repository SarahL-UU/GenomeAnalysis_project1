#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J RNA_mapping
#SBATCH -o RNA_mapping.log
#SBATCH -e RNA_mapping.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL


#Load modules
module load bioinfo-tools
module load bwa/0.7.17
module load samtools

INPUT_DIR_BH=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Trimmed_Illumina_RNA/RNA-Seq_BH
INPUT_DIR_Serum=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Trimmed_Illumina_RNA/RNA-Seq_Serum
OUTPUT_DIR_BH=/proj/genomeanalysis2023/nobackup/work/sarahl/RNA_mapping/RNA-Seq_BH
OUTPUT_DIR_Serum=/proj/genomeanalysis2023/nobackup/work/sarahl/RNA_mapping/RNA-Seq_Serum
Ref_genome=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/PacBio/E_faecium_assembly_pacbio.contigs.fasta

#Index the fasta file
bwa index $Ref_genome

for R1 in $INPUT_DIR_BH/*paired*_1_clean.forward_paired.fq.gz
do
        #set up all variables without the paths
        R1_filename=$(basename -- "$R1")
        R2_filename="${R1_filename_only//_1_clean.forward_paired.fq.gz/_2_clean.reverse_paired.fq.gz}"
        File_prefix=$(basename -- "$R1" _1_clean.forward_paired.fq.gz)
        echo "BH dict R1_filename $R1_filename"
        echo "BH dict R2 filename $R2_filename"
        echo "BH dict File name prefix $File_prefix"

        #Run BWA mem
        bwa mem $Ref_genome $INPUT_DIR_BH/"$File_prefix"_1_clean.forward_paired.fq.gz $INPUT_DIR_BH/"$File_prefix"_2_clean.reverse_paired.fq.gz > $SNIC_TMP/$File_prefix.paired.aligned.sam

        #Sort the alignment
        samtools sort $SNIC_TMP/$File_prefix.paired.aligned.sam -o $OUTPUT_DIR_BH/$File_prefix.paired.aligned.sam.sorted.bam

        #Index bam file
        samtools index $OUTPUT_DIR_BH/$File_prefix.paired.aligned.sam.sorted.bam $OUTPUT_DIR_BH/$File_prefix.paired.aligned.sam.sorted.bam.bai

        #Calculate statistics
        samtools flagstat $OUTPUT_DIR_BH/$File_prefix.paired.aligned.sam.sorted.bam > $OUTPUT_DIR_BH/$File_prefix.paired_statistics.txt
done

for R1 in $INPUT_DIR_Serum/*paired*_1_clean.forward_paired.fq.gz
do
        #set up all variables without the paths
        R1_filename=$(basename -- "$R1")
        R2_filename="${R1_filename_only//_1_clean.forward_paired.fq.gz/_2_clean.reverse_paired.fq.gz}"
        File_prefix=$(basename -- "$R1" _1_clean.forward_paired.fq.gz)
        echo "Serum dict R1_filename $R1_filename"
        echo "Serum dict R2 filename $R2_filename"
        echo "Serum dict File name prefix $File_prefix"

        #Run BWA mem
        bwa mem $Ref_genome $INPUT_DIR_Serum/"$File_prefix"_1_clean.forward_paired.fq.gz $INPUT_DIR_Serum/"$File_prefix"_2_clean.reverse_paired.fq.gz > $SNIC_TMP/$File_prefix.paired.aligned.sam

        #Sort the alignment
        samtools sort $SNIC_TMP/$File_prefix.paired.aligned.sam -o $OUTPUT_DIR_Serum/$File_prefix.paired.aligned.sam.sorted.bam

        #Index bam file
        samtools index $OUTPUT_DIR_Serum/$File_prefix.paired.aligned.sam.sorted.bam $OUTPUT_DIR_Serum/$File_prefix.paired.aligned.sam.sorted.bam.bai

        #Calculate statistics
        samtools flagstat $OUTPUT_DIR_Serum/$File_prefix.paired.aligned.sam.sorted.bam > $OUTPUT_DIR_Serum/$File_prefix.paired_statistics.txt
done
