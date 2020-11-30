# Title     : TP8
# Objective : DBSCAN
# Created by: Hamza HRAMCHI
# Created on: 02/11/2020

library(dbscan)
data.multishapes<- read.table("multishapes.txt",header=TRUE)
plot(data.multishapes$x,data.multishapes$y)
db <- dbscan(data.multishapes,eps=0.15,minPts=5) # esp : rayon identifie les eps voisin, minPts : identifier les bruits ( (-) --> - de bruits )
db
# Extraire eps
kNNdist(data.multishapes, k = 5) # K : minPts, pour identifier le meilleur epsilon en calculant la distance moyenne avec ces 5 plus proches voisins
# eps correspond au coud de la courbe, extrait visuellement à partir de la courbe
kNNdistplot(data.multishapes, k = 5)
# afficherClusters(data.multishapes,length(db$cluster),db$cluster,"x","y")

