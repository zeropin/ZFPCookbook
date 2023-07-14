aim: ZNF10.Repeat.plus.bedgraph ZNF10.Repeat.minus.bedgraph Control.Repeat.plus.bedgraph Control.Repeat.minus.bedgraph
clean:
	rm *Repeat*
ZNF10.Repeat.plus.bedgraph:ZNF10.Repeat.bed
	bedtools genomecov -i ZNF10.Repeat.bed -g hg38.Repeat.sizes -bg -strand + -5|LC_COLLATE=C sort -k1,1 -k2,2n >ZNF10.Repeat.plus.bedgraph
	#bedGraphToBigWig ZNF10.Repeat.plus.bedgraph hg38.Repeat.sizes ZNF10.Repeat.plus.bigwig
	#rm ZNF10.*.bedgraph
ZNF10.Repeat.minus.bedgraph:ZNF10.Repeat.bed
	bedtools genomecov -i ZNF10.Repeat.bed -g hg38.Repeat.sizes -bg -strand - -5|LC_COLLATE=C sort -k1,1 -k2,2n >ZNF10.Repeat.minus.bedgraph
	#bedGraphToBigWig ZNF10.Repeat.minus.bedgraph hg38.Repeat.sizes ZNF10.Repeat.minus.bigwig
	#rm ZNF10.*.bedgraph
ZNF10.Repeat.bed:ZNF10.bed
	liftOver ZNF10.bed Hg38ToRepeat.over.chain ZNF10.Repeat.bed ZNF10.noRepeat.bed -minMatch=0.5
	bedtools sort -i ZNF10.Repeat.bed > ZNF10.Repeat.sorted.bed
	mv ZNF10.Repeat.sorted.bed ZNF10.Repeat.bed
	rm ZNF10.noRepeat.bed
ZNF10.bed:SRR5197054.fasta
	bowtie2 -x ../../reference-genomes/hg38/GRCh38_noalt_as --very-sensitive-local -f SRR5197054.fasta -S ZNF10.sam -p 20 
	samtools view -bS -o ZNF10.bam ZNF10.sam
	samtools sort ZNF10.bam -o ZNF10.sorted.bam
	samtools index ZNF10.sorted.bam
	bamToBed -i ZNF10.sorted.bam>ZNF10.bed
SRR5197054.fasta:
	fastq-dump --fasta SRR5197054

Control.Repeat.plus.bedgraph:Control.Repeat.bed
	bedtools genomecov -i Control.Repeat.bed -g hg38.repeat.sizes -bg -strand + -5|LC_COLLATE=C sort -k1,1 -k2,2n >Control.Repeat.plus.bedgraph
Control.Repeat.minus.bedgraph:Control.Repeat.bed
	bedtools genomecov -i Control.Repeat.bed -g hg38.repeat.sizes -bg -strand - -5|LC_COLLATE=C sort -k1,1 -k2,2n >Control.Repeat.minus.bedgraph
Control.Repeat.bed:Control.bed
	liftOver Control.bed ../../../Development/TECookbook/Hg38ToRepeat.over.chain Control.Repeat.bed Control.noRepeat.bed -minMatch=0.5
	bedtools sort -i Control.Repeat.bed > Control.Repeat.sorted.bed
	mv Control.Repeat.sorted.bed Control.Repeat.bed
	rm Control.noRepeat.bed
Control.bed:
	bowtie2 -x ../../reference-genomes/hg38/GRCh38_noalt_as --very-sensitive-local -f SRR5197033.fasta -S Control.sam -p 20
	samtools view -bS -o Control.bam Control.sam
	samtools sort Control.bam -o Control.sorted.bam
	samtools index Control.sorted.bam
	bamToBed -i Control.sorted.bam>Control.bed
	rm *.sam *.bam
	rm *.fasta
SRR5197033.fasta:
	fastq-dump --fasta SRR5197033
