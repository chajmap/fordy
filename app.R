library(shiny)
source("ford.R")

df= read.table("ais.txt",header = T)
ui <- fluidPage(
  titlePanel("AIS časopisů dle kategorií FORD (Journal AIS for FORD cathegories)"),
  
  fluidRow(
     column(2, wellPanel(
       selectInput(inputId = "ford",
                   label = "Vyberte panel (Choose a panel)",
                   choices = levels(df$Ford))
     ),
     withTags({
       div(class="paticka", checked=NA,
           p("Created by Petr Chajma, chajmap@fzp.czu.cz"),
           a(href="https://chajma.shinyapps.io/rivbody2/", "Kalkulačka RIV")
       )
     })),
     column(5, tableOutput("AIS"))
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  data <- reactive({
    data.frame(cbind(
      ford(name = input$ford)
    )
    )
  })
  output$AIS <- renderTable({
    data()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

