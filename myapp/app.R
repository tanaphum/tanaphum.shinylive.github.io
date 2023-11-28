#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  includeCSS("www/style.css"),
  fluidRow(
    column(11  ,
           h3("Tanaphum Wichaita"),
           p("research software engineer"),
           div(class = "contact",
               uiOutput("moreControls")
               ),
    ),
    column(1,    
           tags$img(class="avatar",src="img/pic_small.jpg" )
           ),

  ),
    # Application title
    h1("Work"),
    
    # includeScript("https://unpkg.com/github-calendar@latest/dist/github-calendar.min.js"),
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$moreControls <- renderUI({
    lapply(1:10, function(i) {
      # <div class="contact-item" title="location">
      #   <i class="fa-solid fa-location-dot"></i>
      #     <span>{{ contact.location }}</span>
      #     </div>
      tags$span(paste0('Hi, this is output B#', i))
    })
  })

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
