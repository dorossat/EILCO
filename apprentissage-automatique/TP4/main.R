# Title     : TP4
# Objective : Arbre de décision
# Created by: Hamza HRAMCHI
# Created on: 07/10/2020

library(rpart)

# ---------------------------------------------
# Exercice1 : Construire un arbre de décision
# ---------------------------------------------
data.tennis <- tennis
# rpart permet de créer differents types d'arbres de décisions
tree.tennis <- rpart(Jouer ~ Ciel + Temperature + Humidite + Vent, data.tennis, control = rpart.control(minsplit = 1))
# rpart.control : nbre min d'observations pour continuer de partager les observations
#( trancher sur un attribut) ou s arreter et attribuer la feuille à la classe la plus majoritaire
tree.tennis
plot(tree.tennis) # pour ploter les branches
text(tree.tennis) # pour ajouter du texte sur les branches
plot(tree.tennis, uniform=T) # afficher l'arbre
text(tree.tennis , use.n=T, all=T, fancy=T) # écrire les étiquettes, fancy : mettre les classes comme noeud dans un cercle
plot(tree.tennis , branch=0)
plot(tree.tennis , branch=.7 )
text(tree.tennis, use.n=T)
plot(tree.tennis , branch=.4 , uniform=T, compress=T)
text (tree.tennis,all=T, use.n=T)
plot(tree.tennis,branch=.2 , uniform=T, compress=T, margin=.1 )
text(tree.tennis, all = T, use.n = T, fancy = T)

# Predection des stituations
data.test <- tennis_test

# Matrice de confusion
prediction <- predict(tree.tennis, data.tennis, "class")
prediction
m_confusion <- table(prediction, data.tennis$Jouer)
m_confusion
# Mettre minsplit à 5 et calculer le nouveau taux d'erreur de l'arbre
cnt.tennis <- rpart.control(minsplit = 5)
tree.tennis <-rpart(Jouer ~ Ciel +Temperature +Humidite + Vent,data.tennis, control = cnt.tennis)
plot(tree.tennis)
text(tree.tennis)
prediction <- predict(tree.tennis, data.tennis, "class")
table(prediction, data.tennis$Jouer)

# Evaluation :  lorsqu on augmente le minsplit on aura un taux d erreur superieur + ca empeche le développement de l'arbre ;
#               en effet le minsplit permet de brancher et aller jusqu'au bout soit de s arreter
#               si le minsplit est tres faible , la taille de l'arbre devient trop complexe et on aura le surapprentissage + le taux d'erreur sur apprentissage
#               sera faible mais sur les donnees de validation sera élevé

# -----------------------------------------------------------------------------------------------------------

# exo2 : but : faire un arbre le plus développé possible mais élager et trouver un arbre qui générlise le mieux

data("car.test.frame")
data.cars <- car.test.frame
first_rows <- head(data.cars) # Les premières lignes de data frame
nb_observations <- dim(data.cars)  # Le nombre d'observations
type_attribut <- str(data.cars) # Type de chaque attributs
first_rows
nb_observations

data.cars["Nissan Maxima V6",] # Caractéristiques de la Nissan Maxima V6
levels(data.cars$Type) # les classes
table(data.cars$Type) # or summary(data.cars$Type) : effectif de voiture
plot(table(data.cars$Type)) # Graphique
barplot(table(data.cars$Type)) # affichage sous forme de battons
plot(data.cars$Weight,data.cars$Disp) # pour verifier les dependances ou les tendances entre les attributs
plot(data.cars$Type, data.cars$Country)
plot(data.cars$Reliability, data.cars$Mileage)
plot(data.cars$Price, data.cars$Disp)
plot(data.cars$Price, data.cars$HP)
# ...

# Arbre de décision
cnt.cars <- rpart.control(minsplit=1)
tree.cars <- rpart(Type~Price + Country + Reliability+Mileage+Weight+Disp.+HP, data.cars, control=cnt.cars)
plot(tree.cars)
text(tree.cars)

# Arbre complexe + pas lisible

# L'arbre produit sera élagué
tree.cars.pruned <- prune(tree.cars, cp = 0.1) # prune : élager l'arbre | cp: la complexité ou pénalité
# l arbre devient plus élagé lorsqu on augmente le cp et lorqu'on le diminue on a plus de branches et donc arbre plus développé
plot(tree.cars.pruned)
text(tree.cars.pruned)

# cp = 0.3 --> un noeud root


tree.cars$cptable # pr la 1 ere colonne: pr tts les valeurs > à la val de 1 ere colonne, on aura les données correspondantes aux autres colonnes
#pr isoler la meilleure valeur de cp à partir de l'erreur min
ind.min <- which.min(tree.cars$cptable[,4])
ind.min
cp.min <- tree.cars$cptable[ind.min,1]
cp.min

# Optimal cp = 0.04, car erreur erreur diminue er augumente quand on dépasse ce cp

tree.cars.pruned <- prune(tree.cars, cp = cp.min)
plot(tree.cars.pruned)
text(tree.cars.pruned)

#
err.app <- tree.cars$cptable[,3]*(45/60) # diviser 45 erreurs sur 60 pour retourner à la valeur réélle de l'erreur et enlever le fait de normalisation. erreur sur ens d'apprentissage
err.test <- tree.cars$cptable[,4]*(45/60) + tree.cars$cptable[,5] # erreur sur ensemble de test
nbNodes <- tree.cars$cptables[,2]+1
plot(nbNodes,err.app,col="red")
lines(nbNodes,err.app,col="red",lty=2)
points(nbNodes,err.test,col="green")
lines(nbNodes,err.test,col="green",lty=2)

tree.cars.opt <- prune(tree.cars, cp = 0.04)
plot(tree.cars.opt)
text(tree.cars.opt)

nombre_noeud <- tree.cars$cptable[,2] + 1
nombre_noeud

plot(nombre_noeud, err.app)
lines(nombre_noeud, err.app)

plot(nombre_noeud, err.test)
lines(nombre_noeud, err.test)

