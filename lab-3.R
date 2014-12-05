#PCA
#1.Krčenje podatkovne tabele
#2.Izdelava nekoleriranih spremenljivk
#3.Graf.prikaz podatkov

library(RColorBrewer)

showmatrix <- function(x, ...) {
  image(t(x[nrow(x):1,]), xaxt ="none", yaxt = "none",
        col = rev(colorRampPalette(brewer.pal(7, "Blues")) (100)),...)    
}

load("face.rda")
dim(faceData)

showmatrix(faceData)

#Surovo matriko transformiramo v odklonske vrednosti

Z <- scale(faceData, center = TRUE, scale = FALSE)
showmatrix(Z)
#Konstruiramo kvadratno matriko(korelacijsko)
R <- cor(Z)

#Izra?unamo lastne vrednosti in lastne vektorje
E <- eigen(R)
str(E) #Struktura E
lastne.vrednosti <- E$values #Mo? posamezne osi v novem prostoru
lastni.vektorji <- E$vectors #Definirajo osi novega prostora
round(lastne.vrednosti,3)

#Koliko glavnih komponent obdr?imo:
#1.Kaiserjev kriterij
#2.Catellov diagram drobirja(scree plot)

plot(lastne.vrednosti)

#Delež razpršenosti, ki ga pojasni posamezna glavna komponenta
cumsum(round(lastne.vrednosti / sum(lastne.vrednosti), 3))

n <- 1:5

Z1 <- t(lastni.vektorji[,n] %*% (t(lastni.vektorji[,n]) %*%t(Z)))
showmatrix(Z)
showmatrix(Z1)

###################################################################
#Preberemo podatke
X <- read.table(file = "pizza.txt", header = TRUE)
#Standardiziramo matriko
Z <- scale(X,center = TRUE, scale = TRUE)

#Konstruiramo korelacijsko matriko
R <- cor(Z)

#Matrika lastnih vektorjev in lastnih vrednosti
E <- eigen(R)
V <- E$vectors
L <- diag(E$values)
plot(diag(L))

Y <- Z %*% V
Y1 <- Y[, 1:2]
plot(Y1)
abline(v = 0)
abline(h =0)

#Funkcija principal() iz paketa psych

data(iris)
X <- iris[,1:4]
library(psych)

principal(r = X, nfactors = 4,rotate = "none")
pca <- principal(r = X, nfactors = 2,rotate = "none")

str(pca)
#Izločimo dose?ke na prvih dveh komponentah

pca1 <- pca$scores
plot(pca1)
plot(pca1, col = iris$Sepal.Length, pch = 16)
abline(v = 0)
abline(h = 0)

##############################################3
X <- read.table(file = "pizza.txt", header = TRUE)
dim(X)
principal(r = X, nfactors = 7, rotate = "none")
pca2 <- principal(r = X, nfactors = 2, rotate = "none")

