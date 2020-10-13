# Title     : TP5
# Objective : Réseau de Neurones
# Created by: Hamza HRAMCHI
# Created on: 13/10/2020

library(neuralnet)

# ----------------------------------
# Exercice 1 : Exemple introductif
# ----------------------------------

# Générer 50 nombres aléatoires uniformément entre 0 et 100
train.input <- as.data.frame(runif(50, min = 0, max = 100))
train.output <- sqrt(train.input)
data.train <- cbind(train.input, train.output)
colnames(data.train) <- c("Input", "Output")
net.sqrt <- neuralnet(Output~ Input, data = data.train, hidden = 10, threshold = 0.01)
# threshold=le seuil pour le quel le reseau pour s'arreter, c'est le critere d'arret
net.sqrt$result.matrix  # net.sqrt contient une matrice des poids
# plot(net.sqrt)
# Erreur = 0.000272

data.test <- as.data.frame((1:10)^2)
prediction <- neuralnet::compute(net.sqrt,data.test)

# Les propriétés de l'objet net.results
print(prediction$net.result)

# Construction du tableau
table <- cbind(data.test,sqrt(data.test),as.data.frame(prediction$net.result))
colnames(table) <- c("Entrée","Sortie attendue","Sortie du réseau neural")
print(table)


# ------------------------------------
# Exercice 2 : Réseau de neurones pour
#              La classification
# ------------------------------------
# Charger les données "iris.csv"
data <- read.csv ("iris.csv" , header=TRUE)
print(data)
# Normaliser les données
iris=iris[order(v),]
head(iris)
v <- round(runif(150,min=0,max=1),digits=2)
normalize <- function(v) {
  max <- max(v)
  min <- min(v)
  v <- (v - min) / (max - min)
  return(v)
}
irisNormalise <- as.data.frame(lapply(iris[, 1:4], normalize))
irisNormalise <- cbind(irisNormalise, iris$Species)
colnames(irisNormalise) <- c("SepalLength","SepalWidth","PetalLength","PetalWidth","Species")
irisNormalise

#




