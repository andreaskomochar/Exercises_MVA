#MATRIKE

x <- 1:6
m <- matrix(data = x, nrow = 3, ncol = 2)
n <- matrix(data = x, nrow = 3, ncol = 2, byrow = TRUE)

a <- 1:3
b <- 10:12

cbind(a,b)
A <- rbind(a,b)
7*A

B <- 5*A
dim(A)
dim(B)
A+B

C <- t(B)

G <-diag(x = c(1,2,3))


#NASLAVLJANJE ELEMENTOV V VEKTORJU IN MATRIKI

set.seed(20141010)
a <- sample(10)

a <- sample(16)
A <- matrix(data=a,ncol=4)

#PODATKOVNI OKVIR

x <-1:5
y <- c("a","b","c","d","e")
z <- c(T,T,T,F,T)
moj.df <- data.frame(x=x,y=y,z=z)

