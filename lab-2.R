# ŠTEVILSKE KARAKTERISTIKE

setwd("C:/Users/Andreas/Desktop/MVA/Vaje")
library(stringr)
library(XML)

url <- "http://lib.stat.cmu.edu/DASL/Datafiles/WildHorses.html"
# Dokument preberemo vrstico po vrstico
html <- readLines(url)

html <- paste(html, collapse = "\n") #pretvori v eno vrstico
html <- str_extract(html, pattern = "<PRE>.*</PRE>*") #IZRBIŠEMO VSEBINO MED ZNAÄŒKAMA PRE

html <- gsub("<PRE>\n|\n\n</PRE>", "", html) #ODSTRANI <PRE>

podatki <- read.table(text = html, header = TRUE, sep = "\t") #Pretvori v tabelo

#Prikaz funkcije tapply
tapply(X = podatki$Adults, INDEX = podatki$Location, FUN = mean )

podatki2 <- readHTMLTable(doc = "http://en.wikipedia.org/wiki/Iris_flower_data_set",  
                          header = TRUE, colClasses = c(rep("numeric", 4), "character"))

str(podatki2) #Pregledamo strukturo

podatki3 <- podatki2[[1]]

str(podatki3)

podatki3$Species <- gsub("I\\..", "", podatki3$Species)
  
write.table(x = podatki3, file = "perunike.txt", col.names = TRUE, row.names = FALSE, quote = FALSE)

#Številske karakteristike
#Aritm. sredina

x <- c(10, 8, 4, 7, 1)
n <- length(x)
# Vektor enic
e <- rep(1,n)

x.sredina <- (1/n)*t(e) %*% x  
x.sredina

#Odklonske  vrednosti

x.odkloni <- x - e %*% x.sredina

#Razprsenost (varianca)

x.s2 <- (1/n) * t(x.odkloni) %*% x.odkloni

#Standardni odklon

x.sd <- as.vector(sqrt(x.s2))

#STANDARDIZIRANI ODKLONI

x.z <- x.odkloni / x.sd


# Še za Y
y <- c(10, 4, 7, 1, 3)
n <- length(y)
e <- rep(1,n)

y.sredina <- (1/n)*t(e) %*% y  
y.sredina

y.odkloni <- y - e %*% y.sredina

y.s2 <- (1/n) * t(y.odkloni) %*% y.odkloni
y.sd <- as.vector(sqrt(y.s2))
y.z <- y.odkloni / y.sd


#Kovarianca in korelacija

x <- cbind(x, y)
 #Vektor aritm. sredin
x.sredina <- (1/n)* t(e) %*% x

#Matrika odklonskih vrednosti
x.odkloni <- x- e %*% x.sredina

#Razpršenosti
x.s2 <- (1/n) * t(x.odkloni) %*% x.odkloni
x.s2 <- diag(x.s2) #Potrebujemo samo vrednosti na glavni diagonali

#Standardni odkloni 
x.s <- sqrt(x.s2)
s <- diag(x.s)

#Standardizirani odkloni
z <- x.odkloni %*% solve(s)

#Kovarianèna matrika

c <- (1/n) * t(x.odkloni) %*% x.odkloni

#Korelacijska matrika

r <- (1/n) * t(z) %*% z

data(iris)
head(iris)
podatki <- iris[, -5]

cov(podatki)
cor(podatki)




