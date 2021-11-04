library(ggplot2)

pokemon <- read.csv(file.choose())
pokemon


ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Attack , y = Defense, color = Type.1))

ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Sp..Atk , y = Sp..Def )) +
  facet_wrap(~ Type.1, nrow = 3)

ggplot(pokemon, aes(x=HP)) + 
  geom_histogram(binwidth = 10, aes(fill=Type.1), color="Black")

