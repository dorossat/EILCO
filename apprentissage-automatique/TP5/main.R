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
set.seed(0)
data <- read.csv ("iris.csv" , header=TRUE)
print(data)
# Normaliser les données
# -- Mélanger l'ordre des lignes
v <- round(runif(150,min=0,max=1),digits=2)
iris <- iris[order(v),]
head(iris)
normalize <- function(v) {
  max <- max(v)
  min <- min(v)
  v <- (v - min) / (max - min)
  return(v)
}

# -- Appliquons la normalisation
irisNormalise <- as.data.frame(lapply(iris[, 1:4], normalize))
irisNormalise <- cbind(irisNormalise, iris$Species)
colnames(irisNormalise) <- c("SepalLength","SepalWidth","PetalLength","PetalWidth","Species")
irisNormalise

# Séparer les données en échantillon d'apprentissage iris.app et un échantillon
# de test iris.test
extract <- sample(1:150,105)
iris.app <- irisNormalise[extract,] # 70% => 105
iris.test <- irisNormalise[-extract,] # 30% => 45

# Ajouter 3 colonnes booléennes
iris.app$setosa     <- iris.app$Species=="setosa"
iris.app$virginica  <- iris.app$Species=="virginica"
iris.app$versicolor <- iris.app$Species=="versicolor"

iris.app$Species<-NULL # Supprimer la colonne Species

# Le réseau de neurones avec une couche de 3 neurones cachés
ne.iris<- neuralnet(setosa+versicolor+virginica ~ SepalLength + SepalWidth + PetalLength+PetalWidth , data=iris.app, hidden=c(5,2))
plot(ne.iris)

# La prédection de l'échantillon de test iris.test avec la fonction compute
prediction <- compute(ne.iris,iris.test[,-5])
colnames(prediction$net.result) <- c("Iris-setosa","Iris-versicolor","Iris-virginica")
prediction$net.result
prediction$neurons

# Recuperer les labels à partir des valeurs prédites du réseau de neurones
names(which.max(prediction$net.result[1,]))
labels.predicted=rep(0.45)
for (i in 1:45)
  labels.predicted[i]=names(which.max(prediction$net.result[i,]))

# Comparer les labels prédits et les étiquettes dans iris.test
labels.predicted
labels.predicted= as.factor(labels.predicted)
labels.predicted
table(iris.test[,5],labels.predicted)


# ----------------------------------
# Exercice 3 : Réseau de neurones
#              pour la régression
# ----------------------------------
data.gasoline <- read.csv ("gasoline.csv" , header=TRUE)





