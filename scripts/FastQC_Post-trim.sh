#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:15:00
#SBATCH -J FastQC_Illumina
#SBATCH -o FastQC_Illumina.log
#SBATCH -e FastQC_Illumina.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL


#Load modules
module load bioinfo-tools
module load FastQC/0.11.9

#Quality check genomics
fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Quality_check_DNA_data/Illumina/Post-trimming \
/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Trimmed_Illumina_WGS/*

#Quality check transcriptomics
fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Quality_check_RNA_data/RNA-Seq_BH/Post_trim \
/home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Trimmed_Illumina_RNA/RNA-Seq_BH/*

fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Quality_check_RNA_data/RNA-Seq_Serum/Post_trim \
/home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Trimmed_Illumina_RNA/RNA-Seq_Serum/*
