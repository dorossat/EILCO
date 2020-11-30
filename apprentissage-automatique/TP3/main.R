# Title     : TP3
# Objective : K plus proches voisins
# Created by: Hamza HRAMCHI
# Created on: 07/10/2020

#Exercice 1
data <- iris
head(data)
summary(data)
str(data)
table(data$Species)

#Construire un nv dataframe mélangé �partir du "data"
nb <- length(data$Id); nb # recuperer nbre de lignes de la première colonne
v <- runif(nb,min <- 0,max <- 1) #150 nbres aléatoires entre 0 et 1
v <- round(v,digits <- 2) #ne garder que 2 nbres après la virgule
dataR <- data[order(v),] # nv dataset mélangé
head(dataR)

#Normaliser les 4 attributs de "dataR" et les stocker dans un nouveau "dataN"
normalize  <-  function(v){
  max <- max(v)
  min <- min(v)
  v <- (v-min)/(max-min)
  return(v)
}

dataN <-  as.data.frame(lapply(dataR[, 2:5], normalize)) # as.data.frame permet de regrouper les colonnes dans un meme data car lapply retourne des colonnes séparées
dataN

#Apprentissage
dataTrain  <-  dataN[1:100,]
dataTest <- dataN[101:150,]
#les étiquettes sont fournis à part et pour les étiquettes de test on les fournit pas au modèle
labelTrain <- dataR[1:100, 6]   #y a pas d'étiquettes dans dataR
labelTest <- dataR[101:150, 6]

model <- knn(train <- dataTrain,test <- dataTest,cl <- labelTrain,k <- 3) ; model
#table pour voir l'erreur de prédiction
table(model)
table(labelTest)
#matrice de confusion pour mieux vérifier la qualité du modèle
conf <- table(model,labelTest) ; conf
# erreur <- somme des cases de la matrice à l'exception de la diagonale / somme'observations
e <- 0
for(i in 1:3){
  e <- e+sum(conf[i,-i]) # somme de tte la ligne à l'exception de la diagonale
}
e <- e/length(labelTest) ; e

K <- seq(1:10)
error <- rep(0,10)
for(i in K){
  model <- knn(train <- dataTrain,test <- dataTest,cl <- labelTrain,k <- i)
  conf <- table(model,labelTest)
  e <- 0
  for (j in 1:3){
    e <- e+sum(conf[j,-j])
    error[i] <- e/length(labelTest)

  }
}

error
plot(K,error)
lines(K,error)

#Exercice 2
#chaque ligne du data est une image
data <-  read.csv("mnist_test.csv",header <- F) # importer le fichier test car ca prend moins de temps pr lire les données
head(data)
str(data)
dim(data)
labels <- data[,1]
data <- data[,-1]

im  <-  matrix(data[5,],nrow <- 28,ncol <- 28)
im <- im[,order(28:1)]
im_numbers <-  apply(im,2,as.numeric)
image(1:28,1:28,im_numbers,col <- gray((0:255)/255))
labels[5]

dataTrain <- data[c(1:1000),-1]
dataTest <- data[c(1001:1200),-1]

labelTrain <- data[c(1:1000),c(1)]
labelTest <- data[c(1001:1200),c(1)]

model <- knn(train <- dataTrain,test <- dataTest,cl <- labelTrain,k <- 3)
model
conf <- table(model,labelTest)
conf