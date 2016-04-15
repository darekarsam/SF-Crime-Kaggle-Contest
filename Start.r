df<-read.csv('C:\\Users\\samee\\Desktop\\CSCI 565 DM\\DM Project\\train - Copy.csv',header=TRUE, sep=',')
library(ggplot2)
bbox = c(-122.516441,37.702072,-122.37276,37.811818)

mapData <- get_map(location = bbox, source = "google",maptype = "satellite")
plot<-ggmap(mapData)+geom_point(data = df, aes(x=X, y=Y), color = "#27AE60", size = 0.5, alpha = 0.01) +
  labs(title = "Locations of Police Arrests Made in San Francisco from 2003 - 2015")

#c(lon = -122,lat = 37)
