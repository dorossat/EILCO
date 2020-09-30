# Title     : TP2 | ML
# Objective : Regression polynomiale
# Created by: Hamza HRAMCHI
# Created on: 30/09/2020

# ------ 1st part ------
set.seed(0)
generate <- function (n) {
  bruit <- rnorm(15, 0.5);
  x <- runif(n, -10, 10)
  y <- (0.1*x^3 - 0.5*x^2 - x + 10) + bruit;
  return (matrix(c(x, y), nrow = n, ncol = 2))
}
generate(15)
plot(generate(15), xlab = "X", ylab = "Y")

# ------ 2nd part ------
model1 <- lm(y ~ x)
print(model1)
modelM <- lm(y ~ poly(x, M)) #  avec M appartient à {1,2,3,6,12}