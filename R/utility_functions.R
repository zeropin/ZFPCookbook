countExo <- function(chrom, start, end, direction, exoReads = ZNF343_exo_reads_by_chrome_strand) {
  if (direction == "+") {
    upstream_count <- exoReads[chrom, "+"][[1]] %>%
      filter(between(edge, start - border_width, end)) %>%
      tally(wt = n)
    
    downstream_count <- exoReads[chrom, "-"][[1]] %>%
      filter(between(edge, start, end + border_width)) %>%
      tally(wt = n)
  }
  else if (direction == "-") {
    upstream_count <- exoReads[chrom, "-"][[1]] %>%
      filter(between(edge, start, end + border_width)) %>%
      tally(wt = n)
    
    downstream_count <- exoReads[chrom, "+"][[1]] %>%
      filter(between(edge, start - border_width, end)) %>%
      tally(wt = n)
  }
  
  return((upstream_count + downstream_count)[[1]])
}

anchorModel <- function(Anchor_pos) {
  # Finding all anchor sites within ZIM3 ChIP-exo peaks
  Anchor_pos <- Anchor_pos %>%
    as_tibble() %>%
    select(seqnames, start, end, strand) %>%
    mutate(exo_count = mapply(
      countExo,
      as.character(seqnames), start, end, strand
    ))
  
  # Extending the anchor position by fixed upstream and downstream distances
  Anchor_pos %<>%
    filter(exo_count > 0) %>%
    mutate(
      start = if_else(strand == "+",
                      start - upstream_flank, start - downstream_flank
      ),
      end = if_else(strand == "+",
                    end + downstream_flank, end + upstream_flank
      ),
      Energy = -log(exo_count)
    )
  
  # Extracting full sequences surrounding the anchor sites
  Anchor_pos$Sequence <- BSgenome::getSeq(Hsapiens,
                                          names = Anchor_pos$seqnames,
                                          start = Anchor_pos$start,
                                          end = Anchor_pos$end,
                                          strand = Anchor_pos$strand
  ) %>% as.character()
  
  return(TFCookbook::buildEnergyModel(Anchor_pos))
}


addAnchorMatrix <- function(energyMatrix, anchor, position, height){
  energyMatrix[,position:(position+nchar(anchor)-1)] <- -height*TFCookbook::anchorMatrix(anchor)
  
  return(energyMatrix)
}