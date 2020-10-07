# Title     : TP3
# Objective : K plus proches voisins
# Created by: Hamza HRAMCHI
# Created on: 07/10/2020

# Chargement et analyse de ma base
data <- read.csv("iris.csv", header = TRUE)
head(data)
summary(data)
str(data)
# La taille de la data
length(data)
# Le nombre d'attributs
taille <- length(names(data))
# Le nom de l'attribut cible
cible <- table(data$Species)