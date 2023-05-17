#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J MUMmer
#SBATCH -o MUMmer.log
#SBATCH -e MUMmer.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load MUMmer/4.0.0rc1
module load gnuplot/5.2.7

Ref=/home/sarahl/GenomeAnalysis_project1/scripts/Blast/E_faecium_E745_complete.fasta
PacBio=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/PacBio/E_faecium_assembly_pacbio.contigs.fasta
Nanopore_Illumina_contigs=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/Nanopore_and_Illumina/contigs.fasta
Nanopore_Illumina_scaffolds=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/Nanopore_and_Illumina/scaffolds.fasta
OUTDIR=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/MUMmer

#PacBio assembly
mummer $Ref $PacBio > $OUTDIR/PacBio_MUMmer
mummerplot --prefix PacBio_MUMmer $OUTDIR/PacBio_MUMmer

#Nanopore+Illumina contigs
mummer $Ref $Nanopore_Illumina_contigs > $OUTDIR/Nanopore_Illumina_Contigs_MUMmer
mummerplot --prefix Nanopore_Illumina_Contigs_MUMmer $OUTDIR/Nanopore_Illumina_Contigs_MUMmer

#Nanopore+Illumina scaffolds
mummer $Ref $Nanopore_Illumina_scaffolds > $OUTDIR/Nanopore_Illumina_Scaffolds_MUMmer
mummerplot --prefix Nanopore_Illumina_Scaffolds_MUMmer $OUTDIR/Nanopore_Illumina_Scaffolds_MUMmer
