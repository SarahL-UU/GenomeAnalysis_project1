# GenomeAnalysis_paper1
Project for the course Genome Analysis (spring 2023) at Uppsala University. The paper is **RNA-seq and Tn-seq reveal fitness determinants of vancomycin-resistant Enterococcus faecium during growth in human serum** by Zhang et al. BMC Genomics (2017) 18:893 DOI 10.1186/s12864-017-4299-9.

## Project plan 
### Overview of data
Aim: The aim of this project is to perform whole genom sequencing, RNA sequencing and transposon sequencing on the E. faecium E745 bacterium to investigate which mechnisms are important for surviving and growing in human blood vessels. 

| Sample  | Growth medium  | Data type | Tool |
| ------------- | ------------- | ------------- | ------------- |
| E. faecium E745  | NA  | WGS  | Illumina HiSeq 100 bp paired-end. |
| E. faecium E745  | NA  | WGS  | Pacific Biosciences RS II SMRT technology  |
| E. faecium E745  | NA  | WGS  | Oxford Nanopore Technologies MinION system with R7 flowcell  |
| E. faecium E745  | BHI broth | RNA-seq  | Illumina HiSeq 2500  |
| E. faecium E745  | Human serum  | RNA-seq  | Illumina HiSeq 2500  |
| E. faecium E745  | BHI broth | Tn-seq  | Illumina Hiseq 2500 50bp single end  |
| E. faecium E745  | Human serum  | Tn-seq  | Illumina HiSeq 2500 50bp single end  |
| E. faecium E745  | Heat-inactivated Human serum  | Tn-seq  | Illumina HiSeq 2500 50bp single end  |

### Analyses and softwares flowchart

![Flowchart_project_2](https://user-images.githubusercontent.com/128709613/228543258-9349c894-632f-4e3e-b417-c4927819a662.png)

### Time plan and deadlines 
2023-03-29: Project plan <br />
2023-03-31: FastQC + Trim <br />
2023-04-13: Assembly + Evaluation + Annotation <br />
**2023-04-14:** Finish up previous steps <br />
2023-04-18: Synteny comparison <br />
2023-04-19: RNA Alignment + Plasmid identification <br />
2023-04-25: Differential expression <br />
2023-04-26: Finish up analyses <br />
**2023-05-02:** Mandatory analyses should be done <br />
2023-05-10: SNP calling + Tn-analysis + Antib. resistance <br />
2023-05-11: Finish up results and conclusions <br />
2023-05-16: Finish up results and conclusions <br />
**2023-05-17:** Upload presentation slides and github-wiki <br />
**2023-05-23:** Present results! <br />

### Data management plan
NB! Kursive is symbolic links
- 000-Data
     - README.txt
     - Raw_Genomics_data
       - *Illumina*
       - *Nanopore*
       - *PacBio* 
     - Raw_Transcriptomics_data
       - *RNA-Seq_BH*
       - *RNA-Seq_Serum*
       - *Tn-Seq_BHI*
       - *Tn-Seq_HSerum*
       - *Tn-Seq_Serum*
- 001-Analyses
     - README.txt 
     - Genomics_analyses
       - README.txt 
       - Quality_check_DNA_data
       - Assemblies
         - PacBio
         - Nanopore
         - Nanopore_and_Illumina
       - Evaluations
         - Quast_results
         - Synteny_results 
       - Annotation
       - SNP_calling
       - Antibiotic_resistance
     - RNA-seq_analyses
       - README.txt 
       - Quality_check_RNA_data
       - Mapping
       - Annotation
       - Differential_analysis
     - Tn-seq_analyses
       - README.txt 
       - Essential_gene_analysis 

