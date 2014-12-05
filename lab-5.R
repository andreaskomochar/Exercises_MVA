#Razvrščanje v skupine  

izpit <- c(85, 65, 58, 92, 75)
vaje <- c(7, 6, 6, 10, 9)

#Naredimo matriko X
X <- cbind(izpit, vaje)

#Matrika različnosti
D <- dist(x = X, method = "euclidean", diag = TRUE)
D

#Na osnovi te matrike združimo v skupine s pomočjo funkcije hclust
#Complete linkage(max metoda), Single linkage(min metoda)
hc <- hclust(D, method = "complete")

plot(hc,ad.table main = "", xlab = "SKUPINA", ylab = "Razdalja" ,sub = "", hang = -1)

######################################################################################
setwd("C:/Users/Andreas/Desktop/MVA/Vaje")

podatki <- read.table("europe.csv", sep = ",", header = T, row.names = 1)
head(podatki)

Z <- scale(podatki)

head(Z)

D <- dist(Z, method = "euclidean", diag = T)
D

hc <- hclust(D, method = "complete")

plot(hc, hang = -1)

