# Data Mining Unit_2:

In the branch named _"Unit 2"_ we have the following practices:

## Index

[Practice_1](https://github.com/JDavidDiaz/DataMining/blob/Unit_2/Practices/Practice_1.R)   
[Research_1 Gramática de las gráficas](https://github.com/JDavidDiaz/DataMining/blob/Unit_2/Investigations/Investigaci%C3%B3n_1%20-%20Gram%C3%A1tica%20de%20las%20gr%C3%A1ficas.pdf)   
[Research_2 Tipos de Distribución](https://github.com/JDavidDiaz/DataMining/blob/Unit_2/Investigations/Investigaci%C3%B3n-2_-Tipos-de-Distribuci%C3%B3n.pdf)
[Evaluation_2]()

# Practice 1

1. Read the csv and analyze the data with R
3. Generate three graphs with R that tell the story of the data, the first being a scatter plot of points,
the second is a faceted graph and the third is a graph that tells us something statistical such as the distribution of the data and that contains the theme layer.
This practice should be documented in its respective branch (branch) of your working repository on github

## Code

```r
library(ggplot2)

# CSV reading
pokemon <- read.csv(file.choose())
pokemon

# First Plot (Scatter Dot Plot)
# Pokemon attack and defense based on their main type 
ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Attack , y = Defense, color = Type.1))

# Second Plot (Faceted Plot)
# Pokemon Special attack and special defense based on their main type
ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Sp..Atk , y = Sp..Def )) +
  facet_wrap(~ Type.1, nrow = 3)

# Distribution of the data
# Total pokemons on the dataframe according to their HP categorized by their main type
ggplot(pokemon, aes(x=HP)) + 
  geom_histogram(binwidth = 10, aes(fill=Type.1), color="Black")
```

# Evaluation 2

1. Read the csv and analyze the data with R
3. Generate three graphs with R that tell the story of the data, the first being a scatter plot of points,
the second is a faceted graph and the third is a graph that tells us something statistical such as the distribution of the data and that contains the theme layer.
This practice should be documented in its respective branch (branch) of your working repository on github

## Code

```r
# We lookup for the csv file in this line
movies <- read.csv(file.choose())

# Filter the movies by Genre and Studios so we can make a more detailed plot
genres <- movies[movies$Genre %in% c("action", "adventure", "animation", "comedy", "drama"),]
studios <- genres[genres$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB"),]

# Importing the necessary libraries so we can use gg plot and extrafont packages to pimp the graph
library(extrafont)
loadfonts(device = "win")
library(ggplot2)

#
plot <- ggplot(data = studios, aes(x = Genre, y=Gross...US))
plot + geom_boxplot()

# 
p <- plot + geom_jitter() + geom_boxplot()
p

#
p2 <- plot + geom_jitter(aes(size = Budget...mill., color=Studio)) + geom_boxplot()
p2

#
p3 <- plot + geom_jitter(aes(size = Budget...mill., color=Studio)) + geom_boxplot(outlier.colour = NA)
p3

#
p4 <- plot + geom_jitter(aes(size = Budget...mill., color=Studio)) + geom_boxplot(alpha=0.6, outlier.colour = NA)
p4 

#
p5 <- p4 +xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre") + theme(plot.title = element_text(hjust = 0.5))
p5

#
p6 <- p5 + theme(axis.title.x = element_text(color = "blue", size = 20), axis.title.y = element_text(color = "blue", size = 20),
               axis.text.x  = element_text(size = 10), axis.text.y  = element_text(size = 10),
               plot.title   = element_text(size = 15), legend.title = element_text(size = 15), 
               text = element_text(family = "Courier"))
p6

#
p6$labels$size <- "Budget $M"
p6$labels$colour <- "Studio's"
p6
```

# **Collaborators:**

Diaz Urias Jorge David

Lopez Medrano Julio Antonio