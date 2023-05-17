#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J Plasmid_identification
#SBATCH -o Plasmid_identification.log
#SBATCH -e Plasmid_identification.err
#SBATCH --mail-user Sarah.Lideus.4744@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load samtools
module load blast/2.13.0+

DIR=/home/sarahl/GenomeAnalysis_project1/001-Analyses/Genomic_analyses/Assemblies/PacBio
BLASTDB=/home/sarahl/GenomeAnalysis_project1/scripts/Blast

#(create an index for the fasta file with all the contigs)
samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta 

#(extract the single contig you need)
samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000002 > $DIR/Plasmids/tig00000002.fasta 

samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000003 > $DIR/Plasmids/tig00000003.fasta

samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000004 > $DIR/Plasmids/tig00000004.fasta

samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000005 > $DIR/Plasmids/tig00000005.fasta

samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000006 > $DIR/Plasmids/tig00000006.fasta

samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000007 > $DIR/Plasmids/tig00000007.fasta

samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000009 > $DIR/Plasmids/tig00000009.fasta

samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000010 > $DIR/Plasmids/tig00000010.fasta

samtools faidx $DIR/E_faecium_assembly_pacbio.contigs.fasta tig00000011 > $DIR/Plasmids/tig00000011.fasta

for contig in $DIR/Plasmids/*
do
        #Run the assembly against the E_faecium database
        blastn -db $BLASTDB/E_faecium_db \
        -outfmt 6 \
        -query "$contig" \
        -out "$contig".blast.out
done
