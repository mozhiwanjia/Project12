#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(shinydashboard)

# Define UI for application that draws a histogram
#shinyUI(fluidPage(
  
                    # Application title
                    #titlePanel("Noosa Shire Car Crush"),
                    #navbarPage("Menu",
                     #          tabPanel("Data Explore"),
                      #         tabPanel("Map",
                       #                 tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
                        #       leafletOutput("map")  
                         #              ) 
                          #    )
             #)
 # )

dashboardPage(
  dashboardHeader(title = "Noosa Shire Area"),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "Maps", 
        tabName = "Car crash maps", 
        icon = icon("globe"),
        menuSubItem("Government", tabName = "m_all", icon = icon("map")),
        menuSubItem("Business", tabName = "m_pop", icon = icon("map"))
      ),
      menuItem(
        "Charts", 
        tabName = "charts", 
        icon = icon("bar-chart"),
        menuSubItem("Government", tabName = "c_water", icon = icon("line-chart")),
        menuSubItem("Business", tabName = "c_pop", icon = icon("bar-chart"))
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "m_all",
        box(
          title = "Government Focus",
          collapsible = TRUE,
          width = "100%",
          height = "1000px",
          leafletOutput("Go_map",width="100%",height="1000px")
        )
      ),
      tabItem(
        tabName = "m_pop",
        box(
          title = "Business Focus",
          collapsible = TRUE,
          width = "100%",
          height = "1000px",
          leafletOutput("Bu_map",width="100%",height="1000px")
      )),
      tabItem(
        tabName = "charts",
        h2("Second tab content")
      )
    )
  )
)
