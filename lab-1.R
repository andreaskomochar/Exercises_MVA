x <- 1:5
y <- c("a","b","c","d","e")
z <- c( T,T,T,F,F)
D <- data.frame(a=x,b=y,c=z)

df <- read.table(file = "pizza.txt", header = TRUE, sep =  " ")
head(df)
tail(df)
dim(df)
nrow(df)
ncol(df)

apply(X = df, MARGIN =  2, FUN = mean)
apply(X = df, MARGIN =  2, FUN = sd)
apply(X = df, MARGIN =  2, FUN = sum)

apply(X = df, MARGIN =  1, FUN = sum)

df2 <- df[, -1]

names(df2)
names(df2) <- toupper(names(df2))

write.table(x = df2, file = "df2.csv", sep = ",", row.names= FALSE)

a <- 1:20
set.seed(2014)
b <- runif(n=16, min = 0, max = 1) #nakljuèna normalna porazdelitev DN!!
B <- matrix(data = b, ncol = 4)

seznam <- list(a,b,B,df2)
seznam[[1]][5]
seznam[[3]][3,2] 

b 
hist(b, main = "", xlab = "Kategorija", ylab = "Frekvenca", 
     las = 1, col = "green")
abline(h = 3, col = "red", lty = 2, lwd = 3)

b
c <- rnorm(n=16)

pdf("test1.pdf")
plot(x= b,y= c, xlab = "X", ylab = "Y", las = 1, pch = 16,
     col = "red")
abline(h = 1, lty = 3,lwd = 3)
abline(v = 0.2, lty = 4,)
dev.off()


#IF

x <- 999
if (x == 999) {
  x <- NA
}

set.seed(123)
x <- sample(1:10, 5)
ifelse(x>5, x^2, 0)

#FOR

for (i in 1:5) {
  print(i)
}

#FUNKCIJE

MojaFunkcija <- function() {
  print("Pozdravljen svet")
}

MojaFunkcija <- function(a, b) {
  rezultat <- a + b
  return(rezultat)
}

cov(b, c)
