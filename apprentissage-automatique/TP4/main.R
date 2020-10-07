# Title     : TP4
# Objective : Arbre de décision
# Created by: Hamza HRAMCHI
# Created on: 07/10/2020

library(rpart)

# ---------------------------------------------
# Exercice1 : Construire un arbre de décision
# ---------------------------------------------
data.tennis <- read.csv("tennis.csv")
#tree.tennis <- rpart(Jouer ~ Ciel + Temperature + Humidite + Vent, data.tennis)
tree.tennis <- rpart(Jouer ~ Ciel + Temperature + Humidite + Vent, data.tennis, control = rpart.control(minsplit = 1))
plot(tree.tennis)
text(tree.tennis)
plot(tree.tennis, uniform=T)# afficher l'arbre
text(tree.tennis , use.n=T,all=T, fancy=T)#ecrire les étiquettes
plot(tree.tennis , branch=0)
plot(tree.tennis , branch=.7 )
text(tree.tennis, use.n=T)
plot(tree.tennis , branch=.4 , uniform=T, compress=T)
text ( tree.tennis,all=T, use.n=T)
plot(tree.tennis,branch=.2 , uniform=T, compress=T,
     margin=.1 )
text(tree.tennis, all = T, use.n = T, fancy = T)





