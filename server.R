#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ggplot2)
library(ggmap)
library(leaflet)
#mydata <- read.csv("/Users/zhangzhao/Desktop/1/5147/1.csv", header = TRUE, sep = ",", quote = "\"",
 #                  dec = ".", fill = TRUE, comment.char = "")
mydata <- read.csv("/Users/zhangzhao/Desktop/1/5147/1.csv", header = TRUE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
                                     output$Go_map <- renderLeaflet({
                                      leaflet(data = mydata) %>%
                                        addTiles()%>%
                                        addMarkers(~Longitude,~Latitude,
                                                   popup =~as.character(Crash_severity),
                                                  clusterOptions  = markerClusterOptions())
                                     })
                                       output$Bu_map <- renderLeaflet({
                                         leaflet(data = mydata) %>%
                                           addTiles()%>%
                                           addCircles(~Longitude,~Latitude,
                                                      popup =~as.character(Crash_severity),
                                                      )
                                    })
                                    
          
  
})
