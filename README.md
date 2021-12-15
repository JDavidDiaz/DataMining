# Data Mining Unit_4:

In the branch named _"Unit 4"_ we have the following Test:

## Index

[Test](https://github.com/JDavidDiaz/DataMining/blob/Unit_4/Evaluation/TestU4.r)   

# Test U4

Implement the K-Means grouping model with the Iris.csv dataset using kmeans() method in R. Once the grouping model is obtained, do the analysis corresponding data display.

## 1.- Importing the dataset
```r
install.packages('cluster')
dataset = read.csv('iris.csv')
```
## 2.- Finding the optimal number of clusters by Elbow Method
In the Elbow method, we are varying the number of clusters ( K ) from 1 – 10. For each value of K, we are calculating WCSS ( Within-Cluster Sum of Square ). WCSS is the sum of squared distance between each point and the centroid in a cluster. When we plot the WCSS with the K value, the plot looks like an Elbow. The K value corresponding to this point is the optimal K value or an optimal number of clusters.
```r
wcss = vector()

for (i in 1:10) wcss[i] = sum(kmeans(dataset[, -5], i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of Clusters',
     ylab = 'WCSS'
)
```
## 3.- Applying kmeans function to the feature columns
k-means clustering is a method of vector quantization, that aims to partition n observations into k clusters in which each observation belongs to the cluster with the nearest mean (cluster centers or cluster centroid), serving as a prototype of the cluster.
```r
set.seed(123)
kmeans = kmeans( x = dataset[, -5] , centers = 3) # k centers = 3 (Elbow Point)

y_kmeans = kmeans$cluster
table(y_kmeans)
```
the kmeans has grouped the data into three clusters 1, 2 & 3 having 50, 62 & 38 observations respectively.
## 4.- Visualizing the kmeans clusters
```r
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
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_4/Evaluation/t4_1.jpg) 
## 5.- Comparing the clusters
```r
dataset$cluster.kmean = y_kmeans
cm = table(dataset$species, dataset$cluster.kmean)
cm
```
[(50 + 48 + 36)/150] = 89% of the k-means cluster output matched with the actual Species clusters. versicolor(Cluster 2) & virginica(Cluster 3) have some overlapping features
## 6.- Visualizing the kmeans clusters with ggplot
Comparing the visualization of the sepal lenght vs the sepal width with a scatter plot
```r
dataset$cluster.kmean <- as.factor(dataset$cluster.kmean)
library(ggplot2)
ggplot(data = dataset)+
  geom_point(aes(x = sepal_length, y = sepal_width, 
                 color = cluster.kmean) , size = 10)+ 
  labs(x = 'Sepal Length', y = 'Sepal Width')+
  ggtitle("kmeans Cluster")
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_4/Evaluation/t4_2.jpg)    
Comparing the visualization of the petal lenght vs the petal width with a scatter plot
```r
ggplot(data = dataset)+
  geom_point(aes(x = petal_length, y = petal_width, 
                 color = cluster.kmean) , size = 10)+ 
  labs(x = 'Petal Length', y = 'Petal Width')+
  ggtitle("kmeans Cluster")
```
![imagen](https://github.com/JDavidDiaz/DataMining/blob/Unit_4/Evaluation/t4_3.jpg)  
# **Collaborators:**

Diaz Urias Jorge David

Lopez Medrano Julio Antonio