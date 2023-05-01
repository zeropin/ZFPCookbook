This sub-repository contains the data analysis workflow of ZNF430 and its paralog ZNF100, which target THE1B and THE1A retroviruses in human genome respectively.

[TECookbook package](https://github.com/zeropin/TECookbook) is used for annotating ChIP-seq peaks locations and extracting putative binding sites within THE1B elements. Without using TECookbook, the binding sites data can be directly loaded from [precompiled data](data/ZNF430.full.sites.RData).

Some preprocessed datasets from [ENCODE database](https://www.encodeproject.org/) and [NCBI GEO database](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE200760) are used in the Aggregate signals workflow.

Briefly, it takes three steps to plot the aggregate H3K9me3 signals in Fig. 1G below: 

1) Extraction of all putative ZNF430 binding sites from THE1B elements annotated by RepeatMasker alignment file (hg38.fa.align, THE1B positions 197 to 222); 
2) Sorting of all full-length ZNF430 binding sites based on their number of mismatches to consensus sequence into three classes, i.e., strong, intermediate and weak;
3) Plotting aggregate H3K9me3 signals around each class of sites using the protocol provided by soGGi package[15] with distanceAround parameter as 4000.

Please contact me if you have any question.

Zheng Zuo

zeropin@live.cn

<img src="images/THE1 being silenced figure.png" style="zoom:60%;" />
