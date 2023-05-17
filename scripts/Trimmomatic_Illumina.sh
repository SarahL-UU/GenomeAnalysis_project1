#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 05:00:00
#SBATCH -J Trimmomatic_Illumina
#SBATCH -o Trimmomatic_Illumina.log
#SBATCH -e Trimmomatic_Illumina.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

#Path variables
INPUT_DIR=/home/sarahl/GenomeAnalysis_project1/000-Data/genomics_data/Illumina
OUTPUT_DIR=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Trimmed_Illumina_WGS

#Load modules
module load bioinfo-tools
module load trimmomatic/0.39

#NB! Only use the Illumina genomic data, trim for both adapters and quality
#Paired end
java -jar $TRIMMOMATIC_ROOT/trimmomatic.jar PE -phred64 \
$INPUT_DIR/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz \
$INPUT_DIR/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
$OUTPUT_DIR/E745-1.L500_SZAXPI015146-56_1_clean.forward_paired.fq.gz \
$OUTPUT_DIR/E745-1.L500_SZAXPI015146-56_1_clean.forward_unpaired.fq.gz \
$OUTPUT_DIR/E745-1.L500_SZAXPI015146-56_2_clean.reverse_paired.fq.gz \
$OUTPUT_DIR/E745-1.L500_SZAXPI015146-56_2_clean.reverse_unpaired.fq.gz \
ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:36
