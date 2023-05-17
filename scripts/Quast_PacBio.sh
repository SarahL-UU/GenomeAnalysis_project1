#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J Quast_PacBio
#SBATCH -o Quast_PacBio.log
#SBATCH -e Quast_PacBio.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load quast/5.0.2
module load python/3.10.8

quast.py \
-o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Quality_check_Quast/PacBio \
--min-contig 500 \
--threads 1 \
/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/PacBio/E_faecium_assembly_pacbio.contigs.fasta
