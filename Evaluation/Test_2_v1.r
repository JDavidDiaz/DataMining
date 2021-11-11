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

# The next instruction adds the outlier color to the graph
p3 <- plot + geom_jitter(aes(size = Budget...mill., color=Studio)) + geom_boxplot(outlier.colour = NA)
p3

# Here the transparency of the boxplot is added to make it easier to see if is overlayed with the elements (dots).
p4 <- plot + geom_jitter(aes(size = Budget...mill., color=Studio)) + geom_boxplot(alpha=0.6, outlier.colour = NA)
p4 

# Labels and titles added to the graph so there is some context added to it.
p5 <- p4 +xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre") + theme(plot.title = element_text(hjust = 0.5))
p5

# Some labels were modified to make their fonts, font color and font sizes more similar to the graph that we are trying to recreate.
p6 <- p5 + theme(axis.title.x = element_text(color = "blue", size = 20), axis.title.y = element_text(color = "blue", size = 20),
                 axis.text.x  = element_text(size = 10), axis.text.y  = element_text(size = 10),
                 plot.title   = element_text(size = 15), legend.title = element_text(size = 15), 
                 text = element_text(family = "Courier"))
p6

# Finally, the graph is recreated and labels that represent budget in millions and studios are modified to make them a bit more readable. 
p6$labels$size <- "Budget $M"
p6$labels$colour <- "Studio's"
p6