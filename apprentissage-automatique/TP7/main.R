# Title     : TP7
# Objective : Clustering hiérarchique descendant
# Created by: Hamza HRAMCHI
# Created on: 02/11/2020
irisN <- read.csv ("iris.csv", header = T)

iris.hclust <- hclust(dist((irisN [,1:4])))
plot (iris.hclust)
rect.hclust(iris.hclust,5)
rect.hclust(iris.hclust, 5, border = c ("blue", "green", "red", "pink", "black"))
rect.hclust(iris.hclust, 5, which = c (2,5))
iris.hclust.5 <- rect.hclust (iris.hclust, 5)

plot (iris.hclust)
identify (iris.hclust)

plot (iris.hclust)
iris.hclust.id <- identify (iris.hclust)
iris.hclust.id
