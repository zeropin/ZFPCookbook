# ZNF343-analysis-workflow in R

## ModeMap analysis of ZNF343 ChIP-exo data

This code and data repository serves as supplemental info for our preprint paper "**Why Do Long Zinc Finger Proteins have Short Motifs?**" (https://www.biorxiv.org/content/10.1101/637298v1) and we intend to use this workflow to demo the feasibility and necessity to use iterative analysis protocol to extract longer motif information of tandem zinc finger proteins. It contains all codes and major results related to ZNF343 ChIP-exo motif analysis, including the data analysis workbook in .Rmd, .html and pdf formats respectively. You can preview our analysis workflow through link (https://zeropin.github.io/Iterative-motif-analysis-of-ZNF343.html) and (https://zeropin.github.io/Correlation-analysis-of-ZNF343-s-extended-motifs.html). The code was previously writeen in python, and now rewriten in R. The original ChIP-exo data were downloaded from NCBI GEO database(https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM2466539), but were not included in this repository.

TFCookbook and TECookbook packages are needed to run this analysis workflow.

You can pull and install these two packages respectively through R command:
```r
remotes::install_github("zeropin/TFCookbook")

remotes::install_github("zeropin/TECookbook")
```

![](https://github.com/zeropin/ZFPCookbook/blob/master/ZNF343/images/Figure%205%20(ZNF343).png)
*The putative consensus site of ZNF343 is GAAGCG, and it has 18 single variants. Each of them can serve as anchor site to derive the extended motifs by counting the ChIP-exo reads in the adjacent region of anchors within ChIP-exo peaks. The hiechical clustering tree and heatmap can be generated based on pairwise similaries, or correlation coefficients between extended motifs, including the HT-SELEX result. Clearly, only the GAAGCn-type hexamer can serve as good "anchors" to produce the extended motif highly similar to the published HT-SELEX result, most likely because the recognition of accessory fingers depends on the presence of consensus core site, i.e. conditional recogntion of tandem ZFPs, which also demostrates the **feasibility and necessity** of iterative motif analysis for long ZFPs using pre-identified core site.*


Zheng Zuo (zeropin@live.cn)
