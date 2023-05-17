#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 15:00:00
#SBATCH -J Diff_expression_PacBio_ref
#SBATCH -o Diff_expression_PacBio_ref.log
#SBATCH -e Diff_expression_PacBio_ref.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load htseq/2.0.2

annotation_file=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Annotation/PacBio/               
OutputDir=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/Differential_expression/PacBio_ref
InputDir=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Transcriptomics_analyses/RNA_mapping/PacBio_ref

for file in $InputDir/**/trim_paired*_pass.paired.aligned.sam.sorted.bam
do
  	echo ${file}
        htseq-count -f bam \
        -r name \
        -s yes \
        samout_filename=$(basename -- "$file") \
        -o $OutputDir/"$samout_filename".samout \
        ${file} \
        $annotation_file/PROKKA_04132023.clean.gff
done
