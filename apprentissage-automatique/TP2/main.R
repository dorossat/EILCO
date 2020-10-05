# Title     : TP2 | ML
# Objective : Regression polynomiale
# Created by: Hamza HRAMCHI
# Created on: 30/09/2020

# ------ 1st part ------
set.seed(0)
generate <- function (n) {
  bruit <- rnorm(n, 0.5)
  x <- runif(n, -10, 10)
  y <- (0.1*x^3 - 0.5*x^2 - x + 10) + bruit
  return (matrix(c(x, y), nrow = n, ncol = 2))
}
f <- generate(15)
# plot(f, xlab = "X", ylab = "Y")

# ------ 2nd part ------
# --- Générer 5 modèles de régression avec M appartient à {1,2,3,6,12}


x <- f[,1]
y <- f[,2]

model1 <- lm(y ~ poly(x, 1))
model2 <- lm(y ~ poly(x, 2))
model3 <- lm(y ~ poly(x, 3))
model6 <- lm(y ~ poly(x, 6))
model12 <- lm(y ~ poly(x, 12))

# --- Un vecteur z contenant une séquence de 300 valeursa allant de -10 à 10
z <- seq(from = -10, to = 10, length.out = 300)

# --- Réaliser des prédictions sur z avec la fonction predict sur chacun des 5 modèles
pred1 <- predict(model1, data.frame(x = z))
pred2 <- predict(model2, data.frame(x = z))
pred3 <- predict(model3, data.frame(x = z))
pred6 <- predict(model6, data.frame(x = z))
pred12 <- predict(model12, data.frame(x = z))

# --- Afficher chacunes des prédections sur le plot avec la fonction lines
plot1 <- lines(z, pred1, col = "green", lty = 1)
plot2 <- lines(z, pred2, col = "blue", lty = 1)
plot3 <- lines(z, pred3, col = "orange", lty = 1)
plot6 <- lines(z, pred6, col = "yellow", lty = 1)
plot12 <- lines(z, pred12, col = "red", lty = 1)
# The best one : Model3
# Le phénomène est : SurApprentissage

# ------ 3d part ------
test <- generate(100)
plot(test, xlab = "X", ylab = "Y")
