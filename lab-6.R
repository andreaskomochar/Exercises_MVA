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

#######################################################################################














