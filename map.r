library(RColorBrewer)
library(leaflet)
library(dplyr)

crimes <- read.csv("C:\\Users\\samee\\Desktop\\CSCI 565 DM\\DM Project\\train.csv") 

crime.map <- function(categories, n) {

    new.crimes <- filter(crimes, Category %in% categories) %>% droplevels() 
    
    pal <- colorFactor(brewer.pal(length(unique(new.crimes$Category)), "Set1"),
                       domain = new.crimes$Category)

    leaflet(new.crimes[1:n,]) %>% 
        addProviderTiles("CartoDB.Positron") %>% 
        addCircleMarkers (lng =  ~X, lat =  ~Y, 
                          color = ~pal(Category),
                          opacity = .7, radius  = 1) %>%  
        addLegend(pal = pal, values = new.crimes$Category)
}

crime.map(c("SEX OFFENSES FORCIBLE", "PROSTITUTION","DRUNKENNESS"), n = 1000)