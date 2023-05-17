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
NOTE! All fastq files in the 000-Data folder are symbolic links to save on disk space

/home/sarahl/GenomeAnalysis_project1/000-Data <br />
├── Genomics_data<br />
│   ├── Illumina<br />
│   ├── Nanopore<br />
│   └── PacBio<br />
└── Transcriptomics_data<br />
    ├── RNA-Seq_BH<br />
    ├── RNA-Seq_Serum<br />
    │   └── untrimmed -> /proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/untrimmed<br />
    ├── Tn-Seq_BHI<br />
    ├── Tn-Seq_HSerum<br />
    └── Tn-Seq_Serum<br />
    
/home/sarahl/GenomeAnalysis_project1/001-Analyses <br />
├── Genomic_analyses <br />
│   ├── Annotation<br />
│   │   └── PacBio<br />
│   ├── Assemblies<br />
│   │   ├── Nanopore_and_Illumina<br />
│   │   └── PacBio<br />
│   │       └── Plasmids<br />
│   ├── MUMmer<br />
│   ├── Quality_check_DNA_data<br />
│   │   ├── Illumina<br />
│   │   │   ├── Post-trimming<br />
│   │   │   └── Pre-trimming<br />
│   ├── Quality_check_Quast<br />
│   │   ├── Nanopore_and_Illumina<br />
│   │   ├── PacBio<br />
│   ├── Synteny<br />
│   │   └── PacBio<br />
│   └── Trimmed_Illumina_Fastq<br />
└── Transcriptomics_analyses<br />
    ├── Differential_expression<br />
    │   ├── RNA-Seq_BH<br />
    │   └── RNA-Seq_Serum<br />
    ├── Quality_check_RNA_data<br />
    │   ├── RNA-Seq_BH<br />
    │   │   └── Post_trim<br />
    │   ├── RNA-Seq_Serum<br />
    │   │   └── Post_trim<br />
    │   ├── Tn-Seq_BHI<br />
    │   ├── Tn-Seq_HSerum<br />
    │   └── Tn-Seq_Serum<br />
    └── Trimmed_Illumina_RNA<br />
        ├── RNA-Seq_BH<br />
        └── RNA-Seq_Serum<br />
