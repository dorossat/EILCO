# Title     : R script
# Objective : Discover R langage
# Created by: Hamza HRAMCHI
# Created on: 28/09/2020

# -------------- Basics of R langage ----------------
a <- 5
a
b <- a
b
v <- c(1, 2, 5, 9)
mode(v)
length(v)

# -------------- Input/Output -----------------------
print("Enter numeric number : ")
scan()
print("Enter numeric number for a : ")
a <- scan()
print("Enter numeric number for b : ")
b <- scan()
c <- a+b
print("c = a + b : ")
print(c)
c
# --------------  Functions  -------------------------
carre <- function(x) { return (x*x) }
carre(3)

# --------------   Vectors   -------------------------
print('# --------------   Vectors   -------------------------')
v1 <- vector("numeric", 10)
print(v1)
v2 <- vector("logical", 8)
print(v2)
v3 <- c(1,3,4,8)
print(v3)
v4 <- rep(1, 10)
print(v4)
v5 <- seq(1, 10)
print(v5)
v6 <- (1:10)
print(v6)
v7 <- seq(1, 10, 3)
print(v7)