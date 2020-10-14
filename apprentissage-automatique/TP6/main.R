# Title     : TP6
# Objective : Algorithme des k moyennes
# Created by: Hamza HRAMCHI
# Created on: 14/10/2020

# -------------------------
# Exercice 1 : Introduction
# -------------------------

# -- La fonction kmeans()
normalize <- function(v){
  max <- max(v)
  min <- min(v)
  v <- (v-min)/(max-min)
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
iris.3means$tot.withinss
iris.3means$betweenss
iris.3means$size

# -- Visualization
plot (irisN$PetalLength, irisN$PetalWidth)

# -- Colorer les points puis visualiser les groupes
s_data1 <- subset(irisN,iris.3means$cluster==1)
points(s_data1$PetalLength,s_data1$PetalWidth,col=2,pch=19)

s_data2 <- subset(irisN,iris.3means$cluster==2)
points(s_data2$PetalLength,s_data2$PetalWidth,col=3,pch=19)

s_data3 <- subset(irisN,iris.3means$cluster==3)
points(s_data3$PetalLength,s_data3$PetalWidth,col=4,pch=19)

# -- Trouver le meilleur K
avg_interclasse <- integer(9)
avg_intraclasse <- integer(9)

for(i in 2:10){
  iris.kmeans <- kmeans(irisN[,1:4], centers = i, nstart = 30) # Without Species
  avg_interclasse[i-1] <- iris.kmeans$tot.withinss
  avg_intraclasse[i-1] <- iris.kmeans$betweenss
}

dmatrix <- dist(irisN[,1:4])

plot(2:10,avg_interclasse,type="b", main="tot.Withinss en fonction de k", ylab="avg des sommes de tot.withinss", xlab="K")
plot(2:10,avg_intraclasse,type="b",main="Betweeness en fonction de k", ylab="avg des sommes de betweeness", xlab="K")

plot.new()
plot(2:10,avg_interclasse,type="b", main="tot.Withinss en fonction de k", ylab="avg des sommes de tot.withinss", xlab="K")
axis(2, ylim=c(0,10),col="blue",col.axis="blue",at=seq(0, 10, by=2))
par(new = T)
plot(2:10,avg_intraclasse,type="b",main="Betweeness en fonction de k", ylab="avg des sommes de betweeness", xlab="K")
axis( 4 ,col="red",col.axis="red",at=seq(20, 40, by=5))
axis( 1 , ylim=c(20,40),col="black",col.axis="black",at=seq(0, 12, by=2))

# -- Les deux courbes se croissent, value(K) = 3




