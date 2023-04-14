#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 03:00:00
#SBATCH -J FastQC_Pre-trim
#SBATCH -o FastQC_Pre-trim.log
#SBATCH -e FastQC_Pre-trim.err

#Load modules
module load bioinfo-tools
module load FastQC/0.11.9

#Quality check genomics
fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Quality_check_DNA_data/Illumina /home/sarahl/GenomeAnalysis_project1/000-Data/genomics_data/Illumina/*

fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Quality_check_DNA_data/PacBio /home/sarahl/GenomeAnalysis_project1/000-Data/genomics_data/PacBio/*

fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Quality_check_DNA_data/Nanopore /home/sarahl/GenomeAnalysis_project1/000-Data/genomics_data/Nanopore/*


#Quality check transcriptomics
fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Quality_check_RNA_data/RNA-Seq_BH/ /home/sarahl/GenomeAnalysis_project1/000-Data/transcriptomics_data/RNA-Seq_BH/*

fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Quality_check_RNA_data/RNA-Seq_Serum/ /home/sarahl/GenomeAnalysis_project1/000-Data/transcriptomics_data/RNA-Seq_Serum/*

fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Quality_check_RNA_data/Tn-Seq_BHI/ /home/sarahl/GenomeAnalysis_project1/000-Data/transcriptomics_data/Tn-Seq_BHI/*

fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Quality_check_RNA_data/Tn-Seq_HSerum/ /home/sarahl/GenomeAnalysis_project1/000-Data/transcriptomics_data/Tn-Seq_HSerum/*

fastqc -o /home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Quality_check_RNA_data/Tn-Seq_Serum/ /home/sarahl/GenomeAnalysis_project1/000-Data/transcriptomics_data/Tn-Seq_Serum/*

