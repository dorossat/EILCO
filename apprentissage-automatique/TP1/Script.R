# Title     : R script
# Objective : Discover R langage
# Created by: Hamza HRAMCHI
# Created on: 28/09/2020

# -------------- Basics of R langage -----------------------------
a <- 5
a
b <- a
b
v <- c(1, 2, 5, 9)
mode(v)
length(v)

# -------------- Input/Output --------------------------------------
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
# --------------  Functions  ----------------------------------------
carre <- function(x) { return (x*x) }
carre(3)

# --------------   Vectors   ----------------------------------------
cat('# --------------   Vectors   -------------------------')
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

# ---------------- La taille ---------------------------------------------
load("test.RData")
print("La taille de : objets")
length(objets)

print("La taille de : performanceF")
length(performanceF)
# ...
tailleF
tailleG

#---------------- Afficher les noms associés aux différentes mesures ----.
names(tailleG)
names(tailleF)
# ...

# ---------------- Union function ---------------------------------------
union(tailleF, tailleG)
# ...

# ---------------- Factors ---------------------------------------
vent <- factor(c("fort", "faible", "moyen", "faible", "faible", "fort"))
vent

# ---------------- Matrix ---------------------------------------
m1 <- matrix(1:6, nrow = 2, ncol = 3)
m2 <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE)
m3 <- matrix(c(40, 80, 45, 21, 55 ,32), nrow = 2, ncol = 3)

# ---------------- Lists ---------------------------------------
athletes <- list(Didier=c(630, 625, 628, 599, 635, 633, 622),
                 Jules=c(610, 590, 595, 582, 601, 603),
                 Pierre=c(644, 638, 639, 627, 642, 633, 639),
                 Matthieu=c(622, 625, 633, 641, 610),
                 Georges=c(561, 572, 555, 569, 653, 549, 558, 561),
                 Khaled=c(611, 621, 619, 618, 623, 614, 623),
                 Guillaume=c(599, 601, 612, 609, 607, 608, 594),
                 Hermann=c(624, 630, 631, 629, 634, 618, 622),
                 Carlos=c(528, 531, 519, 533, 521), Keith=c(513))
# ---------------- Data frame ---------------------------------------
resultats <- data.frame(taille=c(185,178,165,171,172),
                        poids=c(82,81,55,65,68),
                        QI=c(110,108,125,99,124),
                        sexe=c("M","M","F","F","F"),
                        row.names=c("Paul","Matthieu",
                                    "Camille","Mireille","Capucine"))