# Title     : TP6
# Objective : Algorithme des k moyennes
# Created by: Hamza HRAMCHI
# Created on: 14/10/2020

# -------------------------
# Exercice 1 : Introduction
# -------------------------

# -- La fonction kmeans()
normalize = function(v){
  max=max(v)
  min=min(v)
  v=(v-min)/(max-min)
  return(v)
}

iris <- read.csv ("iris.csv", header = T)
iris <- iris[,-1]
irisN <- as.data.frame(lapply(iris[, 1:4], normalize))
irisN <- cbind(irisN, iris$Species)
colnames(irisN) <- c("SepalLength" , "SepalWidth", "PetalLength", "PetalWidth", "Species")
head(irisN)

kmeans (irisN [,1:4], 3)

iris.3means <-kmeans (irisN [,1:4], 3)
iris.3means$cluster
iris.3means$centers
iris.3means$withinss
iris.3means$tot.withinss # inertie inter-classe
iris.3means$ betweenss
iris.3means$size

# -- Visualization
plot (irisN$PetalLength, irisN$PetalWidth)

# -- Colorer les points puis visualiser les groupes
s_data1=subset(irisN,iris.3means$cluster==1)
points(s_data1$PetalLength,s_data1$PetalWidth,col=2,pch=19)
s_data2=subset(irisN,iris.3means$cluster==2)
points(s_data2$PetalLength,s_data2$PetalWidth,col=3,pch=19)
s_data3=subset(irisN,iris.3means$cluster==3)
points(s_data3$PetalLength,s_data3$PetalWidth,col=4,pch=19)
