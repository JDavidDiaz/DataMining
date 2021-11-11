# We lookup for the csv file in this line
movies <- read.csv(file.choose())

# Filter the movies by Genre and Studios so we can make a more detailed plot
genres <- movies[movies$Genre %in% c("action", "adventure", "animation", "comedy", "drama"),]
studios <- genres[genres$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB"),]

# Importing the necessary libraries so we can use gg plot and extrafont packages to pimp the graph
library(extrafont)
loadfonts(device = "win")
library(ggplot2)

# We create a boxplot where we use Genre as the X axis and Gross % US as the Y axis 
plot <- ggplot(data = studios, aes(x = Genre, y=Gross...US))
plot + geom_boxplot()

# In the following instruction we apply the jitter technique to the boxplot so we can see a more clear amount of elements in the boxplot
p <- plot + geom_jitter() + geom_boxplot()
p

# Here we increase the size of the elements matching the amount of budget in mill that they have and also color them acording to the studio they belong to.
p2 <- plot + geom_jitter(aes(size = Budget...mill., color=Studio)) + geom_boxplot()
p2
