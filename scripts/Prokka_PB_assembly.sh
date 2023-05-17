#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:15:00
#SBATCH -J Prokka_PB_assembly
#SBATCH -o Prokka_PB_assembly.log
#SBATCH -e Prokka_PB_assembly.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load prokka/1.45-5b58020

prokka \
--outdir /home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Annotation/PacBio \
--force \
/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/PacBio/E_faecium_assembly_pacbio.contigs.fasta
