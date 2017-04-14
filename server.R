#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(ggplot2)

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
mpgData <- mtcars
mpgCyl4 <- subset(mpgData,cyl==4)
mpgCyl6 <- subset(mpgData,cyl==6)
mpgCyl8 <- subset(mpgData,cyl==8)
cylC<-c(4,6,8)
meanmpg<-c(mean(mpgCyl4$mpg),mean(mpgCyl6$mpg),mean(mpgCyl8$mpg))
meanTabl<-cbind(cylC,meanmpg)
colnames(meanTabl)<-c("No. of Cylinders","Mean Mpg")

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("mpg ~", input$nCyl)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  test1 <- reactive({     
    if(input$nCyl=="Cyl4") mpgData<-mpgCyl4
    if(input$nCyl=="Cyl6") mpgData<-mpgCyl6
    if(input$nCyl=="Cyl8") mpgData<-mpgCyl8
    input$nCyl
  }) 
  
  test2 <- reactive({
    input$plottyp
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$mpgPlot <- renderPlot({
    if(test1()=="Cyl4") {
        if(test2()=="wt") {
          ggplot(data=mpgCyl4,aes(x=wt,y=mpg))+geom_point()+geom_smooth(method='lm',se=FALSE)
        } else {
          ggplot(data=mpgCyl4,aes(x=hp,y=mpg))+geom_point()+geom_smooth(method='lm',se=FALSE)
        }
    } else {
        if(test1()=="Cyl6"){
          if(test2()=="wt") {
            ggplot(data=mpgCyl6,aes(x=wt,y=mpg))+geom_point()+geom_smooth(method='lm',se=FALSE)
          } else {
            ggplot(data=mpgCyl6,aes(x=hp,y=mpg))+geom_point()+geom_smooth(method='lm',se=FALSE)
          }
        } else {
          if(test2()=="wt") {
            ggplot(data=mpgCyl8,aes(x=wt,y=mpg))+geom_point()+geom_smooth(method='lm',se=FALSE)
          } else {
            ggplot(data=mpgCyl8,aes(x=hp,y=mpg))+geom_point()+geom_smooth(method='lm',se=FALSE)
          }
        }
    }

  })
  
  # a large table, reative to input$show_vars
  output$mytable1 = renderDataTable({
    meanTabl
    })
})