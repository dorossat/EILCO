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
v1 <- vector("numeric", 10)
v2 <- vector("logical", 8)
v3 <- c(1,3,4,8)
v4 <- rep(1, 10)
v5 <- seq(1, 10)
v6 <- (1:10)
v7 <- seq(1, 10, 3)