library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("MPg v/s Other Variables from mtcars data"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("nCyl", "No. of Cylinders:",
                list("4" = "Cyl4", 
                     "6" = "Cyl6", 
                     "8" = "Cyl8")),
    
    selectInput("plottyp", "Plot mpg v/s ?",
                list("wt" = "wt", 
                     "hp" = "hp")),
    
    helpText("This application will plot mpg v/s another variables for",
             "selected number of cylinders. You may choose weight,",
              "displacement or hp as one of the other variables.",
              "For example, you can plot mpg v/s hp for all 4 cylinder engines"),
    
    
    checkboxInput("outliers", "Show outliers", FALSE)
  ),
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("mpgPlot"),
    tabsetPanel(
      tabPanel('Mean values',
               dataTableOutput("mytable1"))
    )
  )
))