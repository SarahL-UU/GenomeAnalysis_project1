#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 24:00:00 
#SBATCH -J Trimmomatic_Illumina_RNA
#SBATCH -o Trimmomatic_Illumina_RNA.log
#SBATCH -e Trimmomatic_Illumina_RNA.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

#Path variables
INPUT_DIR=/home/sarahl/GenomeAnalysis_project1/000-Data/Transcriptomics_data
OUTPUT_DIR=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Trimmed_Illumina_RNA

#Load modules
#module load bioinfo-tools
#module load trimmomatic/0.39

#Paired end
for dir in "$INPUT_DIR"/RNA-*
do
        echo $dir
        for R1 in "$dir"/*1.fastq.gz
        do
                #set up all variables without the paths
                R1_filename_only=$(basename -- "$R1")
                R2_filename_only=${R1_filename_only//1.fastq.gz/2.fastq.gz}
                dir_name=$(basename -- "$dir")
                
                #Create variables without the path
                R1paired=${R1_filename_only//.fastq.gz/_clean.forward_paired.fq.gz}
                R1unpaired=${R1_filename_only//.fastq.gz/_clean.forward_unpaired.fq.gz}
                R2paired=${R2_filename_only//.fastq.gz/_clean.reverse_paired.fq.gz}
                R2unpaired=${R2_filename_only//.fastq.gz/_clean.reverse_unpaired.fq.gz}

                #Run trimmomatic
                java -jar /sw/bioinfo/trimmomatic/0.39/rackham/trimmomatic.jar PE -phred33 \
                $INPUT_DIR/$dir_name/$R1_filename_only \
                $INPUT_DIR/$dir_name/$R2_filename_only \
                $OUTPUT_DIR/$dir_name/$R1paired \
                $OUTPUT_DIR/$dir_name/$R1unpaired \
                $OUTPUT_DIR/$dir_name/$R2paired \
                $OUTPUT_DIR/$dir_name/$R2unpaired \
                ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10 \
                LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:36
        done
done
