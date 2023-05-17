#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J Quast_Nanopore_and_Illumina
#SBATCH -o Quast_Nanopore_and_Illumina.log
#SBATCH -e Quast_Nanopore_and_Illumina.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load quast/5.0.2
module load python/3.10.8

quast.py \
-o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Quality_check_Quast/Nanopore_and_Illumina \
--min-contig 500 \
--threads 1 \
/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/Nanopore_and_Illumina/contigs.fasta
