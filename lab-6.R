library(stringr)

#Regularni izrazi

#Funkcija str_detect
moj.niz <- c("banana", "Jabolko","ananas")
str_detect(string = moj.niz, pattern = "a")
str_detect(string = moj.niz, pattern = "b")

#Preverimo ali se kakšen vzorec začne na črko a:
str_detect(string = moj.niz, pattern = "^a")
#Preverimo ali se kakšen vzorec konča na črko a:
str_detect(string = moj.niz, pattern = "a$")

#Ali niz vsebuje kateregakoli od samoglasnikov:
str_detect(string = moj.niz, pattern = "[aeiou]")


#Funkcija str_locate(vrne prvo pojavitev niza - vrne samo prvo ponovitev)
str_locate(string = moj.niz, pattern = "a")
str_locate(string = moj.niz, pattern = "s")

str_locate_all(string = moj.niz, pattern = "a") #(str_locate_all najde vse ponovitve)

#Funkcija str_extract
moj.niz <- c("jabolko 4x", "mleko 2x", "banana 6x")

#Hočemo najti samo številke:
str_extract(string = moj.niz, pattern = "\\d")

#Hočemo izvleči samo črkovne znake:
str_extract(string = moj.niz, pattern = "[a-z]") #Najde samo prve znake
str_extract(string = moj.niz, pattern = "[a-z]+") #Vrne celoten niz
str_extract(string = moj.niz, pattern = "\\w+")  #Isto kot prejšnja vrstica

str_extract(string = moj.niz, pattern = "\\d.") #Najde še znak ki se ponovi za številko

#Funkcija str_replace
moj.niz <- c("eno jabolko", "dve hruški", "tri banane")
str_replace(string = moj.niz, pattern = "[aeiou]", replacement = "*") #zamenja pri prvi ponovitvi
str_replace_all(string = moj.niz, pattern = "[aeiou]", replacement = "*") #zamenja vse

#Funkcija str_spli
moj.niz <- c("jabolko in banana", "marelica in hruška")
str_split(string = moj.niz, pattern = "in")

<<<<<<< HEAD
###########################################################################################
#Razvrscanje v skupine z podatki iz spletne strani
library(XML)

url <- ("http://sports.yahoo.com/nfl/stats/byteam?group=Offense&cat=Total")

stran <- readHTMLTable(url)
str(stran) #struktura strani
tabela <- stran[[7]] #Izločimo tabelo
tabela

as.numeric(str_extract(tabela[, 5], pattern = "[0-9.]+"))

PotegniVen <- function(x) {
  require(stringr)
  str_extract(string = x, pattern = "[0-9.]+")  
}

tabela1 <- apply(X = tabela, MARGIN = 2, FUN = PotegniVen)
tabela1

tabela3 <- apply(X = tabela2, MARGIN = 2, FUN = as.numeric )
tabela3

rownames(tabela3) <- tabela[, 1]

#Hierarhično razvrščanje v skupine
#Standardiziramo spremenljivke
X <- tabela3
Z <- scale(X)

#Izračunamo matriko različnosti
D <- dist(Z, method = "euclidean")


hc <- hclust(D, method = "complete")
plot(hc, hang = -1)

#Razreži drevo
razbitje <- cutree(hc, k = 2) #Razbitje v skupine
table(razbitje)

#Interpretacija razbitja
by(data = X, INDICES = razbitje, FUN = colMeans)

#################################################################################
#Večrazsežno lestvičenje - Multidimensional scaling
library(ggmap)
library(geosphere)
library(psych)

geo.city <- c("Atlanta", "Boston", "Dallas", "Indianapolis", "Los Angeles", 
              "Memphis", "St. Louis", "Spokane", "Tempa")

geo.data <- geocode(location = geo.city)
rownames(geo.data) <- geo.city

M <- matrix(data = NA, nrow = 9, ncol = 9)
dimnames(M) = list(geo.city, geo.city)


for (i in 1:9)  {
  for (j in 1:9)  {
    M[i,j] <- distHaversine(p1 = geo.data[i ,], p2 = geo.data[j ,] )
  }
}
M  
sum(M)  
write.table(M, file = "distance_matrix.csv", sep = ",")
=======
#######################################################################################











>>>>>>> 9a836208ab3705e599e6819bf3be63d06d561bf4



