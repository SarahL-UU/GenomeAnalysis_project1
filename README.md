# GenomeAnalysis_paper1
Project for the course Genome Analysis (spring 2023) at Uppsala University.

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

### Analyses and softwares
| Analysis  | Software  | Estimated time  |
| ------------- | ------------- | ------------- |
| Quality check of Illumina data  | FastQC  | 2h  |
| Trim Illumina reads  | Trimmomatic  | 4h  |
| Quality check of Illumina data  | FastQC  | 2h  |
| DNA assembly  | Canu  | 7h  |
| DNA assembly  | Spades  | 4h  |
| Assembly evaluation of Canu  | Quast  | 2h  |
| Assembly evaluation of Spades  | Quast  | 2h  |
| Annotation  | Prokka  | 2h  |
| Alignment  | BWA  | 4h  |
| Differential Expression  | Htseq  | 15h  |
| Find plasmids in NCBI Genbank database | Blastn | 2h |
| Essential genes, Tn-seq analysis | Transit | 6h |
| SNP calling | BCFtools | 4h |

### Time plan and deadlines 
2023-03-29: Project plan <br />
2023-03-31: FastQC + Trim <br />
2023-04-13: Assembly + Evaluation + Annotation <br />
**2023-04-14:** Finish up previous steps <br />
2023-04-18: Alignment <br />
2023-04-19: Differential expression <br />
2023-04-25: Synteny comparison <br />
2023-04-26: Plasmid identification <br />
**2023-05-02:** Mandatory analyses should be done <br />
2023-05-10: SNP calling + Tn-analysis <br />
2023-05-11: Finish up results and conclusions <br />
2023-05-16: Finish up results and conclusions <br />
**2023-05-17:** Upload presentation slides and github-wiki <br />
**2023-05-23:** Present results! <br />

### Data management plan
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
- 001-Intermittent_files
     - Genomics_analyses
     - RNA-seq_analyses
     - Tn-seq_analyses
- 002-Results
     - Genomics_analyses
     - RNA-seq_analyses
     - Tn-seq_analyses
