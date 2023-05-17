#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J Blastn_Pacbio
#SBATCH -o Blastn_Pacbio.log
#SBATCH -e Blastn_Pacbio.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load blast/2.13.0+

BLASTDB=/home/sarahl/GenomeAnalysis_project1/scripts/Blast
input_file=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/PacBio
outdir=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Synteny/PacBio

#Create the E_faecium database
makeblastdb -in $BLASTDB/E_faecium_E745_complete.fasta -out $BLASTDB/E_faecium_db -dbtype nucl

#Run the assembly against the E_faecium database
blastn -db $BLASTDB/E_faecium_db \
-outfmt 6 \
-query $input_file/E_faecium_assembly_pacbio.contigs.fasta \
-out $outdir/Pacbio_results.out
