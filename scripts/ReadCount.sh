#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 15:00:00
#SBATCH -J ReadCounts
#SBATCH -o ReadCounts.log
#SBATCH -e ReadCounts.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load htseq/2.0.2

annotation_file=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Annotation/PacBio/Few_parameters
InputDir=/proj/genomeanalysis2023/nobackup/work/sarahl/RNA_mapping/

for InputFile in $InputDir/**/trim_paired*_pass.paired.aligned.sam.sorted.bam
do
  	echo ${InputFile}
        File_prefix=$(basename -- "$InputFile" _pass.paired.aligned.sam.sorted.bam)
        htseq-count -f auto -r pos -s yes -t CDS -i ID \
        ${InputFile} $annotation_file/PROKKA_04132023.clean.gff > "$File_prefix"_ReadCounts.csv
done


