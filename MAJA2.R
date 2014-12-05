ploscinaKvadrata <-  0
ploscinaKroga <-  0
n <- 1000000

for (i in 1:n) {
x  <-  runif(1, min=0,max=1)
y  <-  runif(1,min=0,max=1)
if ((x^2 + y^2 ) <=1) {
  ploscinaKroga  <- ploscinaKroga + 1
}
ploscinaKvadrata  <- ploscinaKvadrata + 1
}

pi <-  4*(ploscinaKroga/n)
pi
