#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -J Spades_Nanopore_and_Illumina
#SBATCH -o Spades_Nanopore_and_Illumina.log
#SBATCH -e Spades_Nanopore_and_Illumina.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load spades/3.15.5

#shrotcuts
Illumina_trimmed=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Trimmed_Illumina_WGS
OutDir=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/Nanopore_and_Illumina/

spades.py \
-k 33 \
-1 $Illumina_trimmed/E745-1.L500_SZAXPI015146-56_1_clean.forward_paired.fq.gz \
-2 $Illumina_trimmed/E745-1.L500_SZAXPI015146-56_2_clean.reverse_paired.fq.gz \
--threads 1 \
--nanopore /home/sarahl/GenomeAnalysis_project1/000-Data/Genomics_data/Nanopore/*fasta.gz \
-o $OutDir/Nanopore_and_Illumina \
