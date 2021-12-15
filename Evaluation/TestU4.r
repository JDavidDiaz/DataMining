install.packages('cluster')

dataset = read.csv('iris.csv')

set.seed(123)

# Finding the optimal number of clusters by Elbow Method
wcss = vector()

for (i in 1:10) wcss[i] = sum(kmeans(dataset[, -5], i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of Clusters',
     ylab = 'WCSS'
)

# Applying kmeans function to the feature columns
set.seed(123)
kmeans = kmeans( x = dataset[, -5] , centers = 3)

y_kmeans = kmeans$cluster
table(y_kmeans)

# Visualizing the kmeans clusters
library(cluster)
clusplot(dataset[, -5],
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 0,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris Flowers')
)

# Comparing the clusters
dataset$cluster.kmean = y_kmeans
cm = table(dataset$species, dataset$cluster.kmean)
cm

# Sepal-Length vs. Sepal-Width (kmeans cluster) )(scatter plot)
dataset$cluster.kmean <- as.factor(dataset$cluster.kmean)
library(ggplot2)
ggplot(data = dataset)+
  geom_point(aes(x = sepal_length, y = sepal_width, 
                 color = cluster.kmean) , size = 10)+ 
  labs(x = 'Sepal Length', y = 'Sepal Width')+
  ggtitle("kmeans Cluster")

# Petal-Length vs. Petal-Width (kmeans cluster)(scatter plot)
ggplot(data = dataset)+
  geom_point(aes(x = petal_length, y = petal_width, 
                 color = cluster.kmean) , size = 10)+ 
  labs(x = 'Petal Length', y = 'Petal Width')+
  ggtitle("kmeans Cluster")