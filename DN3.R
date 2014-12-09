library(vegan)

#Jaccardova razdalja s paketom vegan
podatki <- read.table("jaccard.txt")

D <-vegdist(podatki,method="jaccard") 
D <- as.matrix(D)

hc <- hclust(D, method = "complete")
hc
plot(hc, hang = -1)








