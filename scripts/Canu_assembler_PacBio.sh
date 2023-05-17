#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J Canu_assembler_PacBio
#SBATCH -o Canu_assembler_PacBio.log
#SBATCH -e Canu_assembler_PacBio.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL


#Load modules
module load bioinfo-tools
module load canu/2.2

canu -p E_faecium_assembly_pacbio \
-d /home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/PacBio \
genomeSize=3.3m useGrid=false maxThreads=4 -pacbio-raw \
/home/sarahl/GenomeAnalysis_project1/000-Data/Genomics_data/PacBio/*fastq.gz 
