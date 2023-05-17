library(DESeq2)

trim_paired_ERR1797969_ReadCounts <- read_delim("Readcounts/trim_paired_ERR1797969_ReadCounts.csv", 
                                                +     delim = "\t", escape_double = FALSE, 
                                                +     col_names = FALSE, trim_ws = TRUE)

trim_paired_ERR1797970_ReadCounts <- read_delim("Readcounts/trim_paired_ERR1797970_ReadCounts.csv", 
                                                +     delim = "\t", escape_double = FALSE, 
                                                +     col_names = FALSE, trim_ws = TRUE)

trim_paired_ERR1797971_ReadCounts <- read_delim("Readcounts/trim_paired_ERR1797971_ReadCounts.csv", 
                                                +     delim = "\t", escape_double = FALSE, 
                                                +     col_names = FALSE, trim_ws = TRUE)

trim_paired_ERR1797972_ReadCounts <- read_delim("Readcounts/trim_paired_ERR1797972_ReadCounts.csv", 
                                                +     delim = "\t", escape_double = FALSE, 
                                                +     col_names = FALSE, trim_ws = TRUE)

trim_paired_ERR1797973_ReadCounts <- read_delim("Readcounts/trim_paired_ERR1797973_ReadCounts.csv", 
                                                +     delim = "\t", escape_double = FALSE, 
                                                +     col_names = FALSE, trim_ws = TRUE)

trim_paired_ERR1797974_ReadCounts <- read_delim("Readcounts/trim_paired_ERR1797974_ReadCounts.csv", 
                                                +     delim = "\t", escape_double = FALSE, 
                                                +     col_names = FALSE, trim_ws = TRUE)

read_counts_df=data.frame(Transcript=c(trim_paired_ERR1797969_ReadCounts$X1), 
                          + ERR1797969=c(trim_paired_ERR1797969_ReadCounts$X2), 
                          + ERR1797970=c(trim_paired_ERR1797970_ReadCounts$X2), 
                          + ERR1797971=c(trim_paired_ERR1797971_ReadCounts$X2), 
                          + ERR1797972=c(trim_paired_ERR1797972_ReadCounts$X2), 
                          + ERR1797973=c(trim_paired_ERR1797973_ReadCounts$X2), 
                          + ERR1797974=c(trim_paired_ERR1797974_ReadCounts$X2))

metaData=data.frame(id=c("ERR1797969", "ERR1797970", "ERR1797971", "ERR1797972", "ERR1797973", "ERR1797974"), Treatment=c("Serum", "Serum", "Serum", "BH", "BH", "BH"))

#Remove the extra lines at the end from PROKKA
read_counts_df <- read_counts_df[-c(3125,3126,3127,3128,3129),]

dds <- DESeqDataSetFromMatrix(countData=read_counts_df, 
                              colData=metaData, 
                              design=~Treatment, tidy = TRUE)
dds <- DESeq(dds)

res <- results(dds)

#inspect the results
head(results(dds, tidy=TRUE)) 
tail(results(dds, tidy=TRUE)) 
summary(res) 

#Normalised read counts
resNorm <- lfcShrink(dds, coef=2, type="normal")
resNorm <- resNorm[order(res$padj),]
head(resNorm)
plotMA(resNorm, ylim=c(-10,10), main="normal")

vsdata <- vst(dds, blind=TRUE)
plotPCA(vsdata, intgroup="Treatment") #using the DESEQ2 plotPCA fxn we can


res = res[order(abs(res$log2FoldChange), decreasing = TRUE),]
plotCounts(dds, gene=which.min(res$padj), intgroup="Treatment")
ntd <- normTransform(dds)


library("pheatmap")
select <- order(rowMeans(counts(dds,normalized=TRUE)),
                decreasing=TRUE)[1:20]
df <- as.data.frame(colData(dds)[,c("id","Treatment")])
pheatmap(assay(ntd)[select,], cluster_rows=TRUE, show_rownames=TRUE,
         cluster_cols=TRUE, annotation_col=df)


sum(res$padj < 0.001 & abs(res$log2FoldChange)>2, na.rm=TRUE)
