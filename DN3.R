library(vegan)

#Jaccardova razdalja s paketom vegan
podatki <- read.table("jaccard.txt")

D <-vegdist(podatki,method="jaccard") 
D <- as.matrix(D)

hc <- hclust(D, method = "complete")
hc
plot(hc, hang = -1)


#######################################################
podatki <- read.table("jaccard.txt")

J_razdalja <- function(x,y) {
  
  M11 <- 0
  M01 <- 0
  M10 <- 0
  
  for (j in 1:10)  {
      if (podatki[x,j] == 1 & podatki[y,j] == 1) {
        M11 <- M11+1     
    }         
      else if (podatki[x,j] == 1 & podatki[y,j] == 0) {
        M10 <- M10+1}
    
      else if (podatki[x,j] == 0 & podatki[y,j] == 1) {
        M01 <- M01+1}    
    
  }
  

J <- (M01+M10)/(M01+M10+M11)

return(J)

}

D <- matrix(data = NA, nrow = 7, ncol = 7)
for (i in 1:7) {
  for (j in 1:7) {
    D[i,j] <- J_razdalja(i,j)
  
  }
}




