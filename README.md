# Data Mining Unit_2:

In the branch named _"Unit 2"_ we have the following practices:

## Index

[Practice_1](https://github.com/JDavidDiaz/DataMining/blob/Unit_2/Practices/Practice_1.R)   
[Research_1 Gramática de las gráficas](https://github.com/JDavidDiaz/DataMining/blob/Unit_2/Investigations/Investigaci%C3%B3n_1%20-%20Gram%C3%A1tica%20de%20las%20gr%C3%A1ficas.pdf)   
[Research_2 Tipos de Distribución](https://github.com/JDavidDiaz/DataMining/blob/Unit_2/Investigations/Investigaci%C3%B3n-2_-Tipos-de-Distribuci%C3%B3n.pdf)


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

# **Collaborators:**

Diaz Urias Jorge David

Lopez Medrano Julio Antonio


