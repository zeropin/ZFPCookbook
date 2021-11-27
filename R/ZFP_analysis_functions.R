findFingers <- function(protein_sequence, type="C2H2"){
  if(type=="C2H2")
    return(stringr::str_match_all(string=protein_sequence, pattern="C..C............H...H"))
}


getContactResidues <- function(fingers, type="C2H2"){
  if(type=="C2H2")
    return(mapply(function(finger) paste0(substr(finger, 10, 10), substr(finger, 12, 12), substr(finger, 13, 13), substr(finger, 16, 16)), 
                  fingers))
}

predictMotif <- function(){
  
}