# Title     : TP2 | ML
# Objective : Regression polynomiale
# Created by: Hamza HRAMCHI
# Created on: 30/09/2020

# ------ 1st part ------
set.seed(0)
generate <- function (n) {
  bruit <- rnorm(n, 0.5);
  x <- runif(n, -10, 10)
  y <- (0.1*x^3 - 0.5*x^2 - x + 10) + bruit;
  return (matrix(c(x, y), nrow = n, ncol = 2))
}
generate(15)
plot(generate(15), xlab = "X", ylab = "Y")

# ------ 2nd part ------
# --- Générer 5 modèles de régression avec M appartient à {1,2,3,6,12}

model1 <- lm(y ~ poly(x, 1))
print(model1)
model2 <- lm(y ~ poly(x, 2))
print(model2)
model3 <- lm(y ~ poly(x, 3))
print(model3)
model6 <- lm(y ~ poly(x, 6))
print(model6)
model12 <- lm(y ~ poly(x, 12))
print(model12)

# --- Un vecteur z contenant une séquence de 300 valeursa allant de -10 à 10
z <- seq(from = -10, to = 10, length.out = 300)