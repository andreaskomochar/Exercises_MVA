#5.vaje:14.11.2014

library(rgl)
data(iris)

plot3d(iris[, 1:3], type = "s", col = as.numeric(iris$Species), size = 3, alpha = 0.75)# s plot3d rišemo v trirazsežnem prostoru; type je s krogci; prve tri spremenljivke


X <- iris[, 1:3]
head(X)#imamo tri spr.
library(psych)
pca <- principal(r = X, nfactors = 3, rotate = "none")

pca

#ANOVA in prijatelji
#t-test za 1 vzorec
#populacijska arit.sredina = 100

a <- c(65,78,88,55,48,95,66,57,79,81)
t.test(a, mu = 100)

#t-test za 2 neodvisna vzorca #primer 1
a <- c(175, 168, 190, 156, 181, 182, 175, 174, 179)
b <- c(185,169,173,173,188,186,175,174,179,180)

#Fisherjev F-test
#preverimo predpostavko o homogenosti varinac (enakost)
var.test(a,b)#da ugotovimo pri var.equal kakšna je razpršenost
t.test(a,b, paired = FALSE, var.equal = TRUE)# ali sta razprešenosti dveh vzorcev enaki
#pogledamo rezultate: p-value je višja od 0,05 zato Ho ne bomo zavrnili = ar.sredini sta med seboj enaki

#t-test za 2 neodvisna vzorca #primer 2
a <- c(175, 168,168, 190, 156, 181, 182, 175, 174, 179)
b <- c(120, 180, 125, 188, 130, 190, 110, 185, 112, 188)
var.test(a, b)#p vrednost je zelo majhna; varianca vzorca a je razlièna od vzorca b
t.test(a, b, paired = FALSE, var.equal = FALSE)# var.equal je zato false ker sta si varianci razlièni
#komentar: t test je povedal da sta ar.sredini enaki (Ma = Mb); zavrnemo takrat ko je p-value manjša od 0,05


#t-test za ponovljene meritve
a <- c(13.9, 13.5, 12.8,15.6,17.2,19.2,12.6,15.3,14.4,11.3)
b <- c(12.7, 13.6, 12.0, 15.2, 16.8, 20.0, 12.0, 15.9, 16.0,11.1) 

t.test(a, b, paired = TRUE)#sprejmemo Ho; ar.sredine pred in po treningu nista statistièno razlièni..ni bil uèinkovit



#ENOSMERNA ANOVA
a <- c(65,48,66,75,70,55)
b <- c(64,44,70,70,68,59)
c <- c(60,50,65,69,69,57)
d <- c(62,46,68,72,67,56)

#odvisna spremenljivka
podatki <- c(a,b,c,d)#združimo podatke

#neodvisna spremenljivka
skupina <- factor(rep(letters[1:4], each = 6))#letters-angleška abeceda; each-najprej 6 a-jev, nato...; factor-da bo azdeva lepše delala

#Bartlettov test
bartlett.test(podatki, skupina)
#komentar pri preverjanju pogoja: pri pogoju sprejmemo Ho, ker so variance med posameznimi skupinami enake

#preverjamo domnevo:
fit <- lm(formula = podatki ~ skupina)

#pripravimo povzetek anove
anova(fit)
#v vrstici:vir razpršenosti   SS    df     MS     F    Pr
#v stolpcu: skupina          8.46   3      2.81   0.03  0.99
#           ostanki
#KOMENTAR: ARITMETIÈNE SREDINE V KOLIÈINI PORABLJENE ENERGIJE V POSAMEZNI TRGOVINI MED SEBOJ ENAKE

#DVOSMERNA ANOVA

dohodki = c(15,18,22,23,24,22,25,15,15,14,18,22,15,19,21,23,15,14,17,18,23,15,26,18,14,12,15,11,10,8,26,12,23,15,18,19,17,15,20,10,15,14,18,19,20,14,18,10,12,23,14,22,19,17,11,21,23,11,18,14)
mesec <- gl(12,5)#vsak mesec se ponovi 5x
leto <- gl(5,1, length(dohodki))# na 5 let, 1x se ponovi

#sestavimo linearni model
fit <- aov(dohodki ~ mesec + leto)# + pomeni dodaj še eno spremenljivko
anova(fit) #naredi povzetek
#komentar: prihodki se ne razlikujejo ne glede na leto, ne glede na mesec...p veèja od 0,05

