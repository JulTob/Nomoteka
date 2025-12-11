library(shiny)

ui <- fluidPage(
    titlePanel("Name Vibe Checker:")
    
    textInput(
                inputId = "input_name",
                label   = "Type a name:",
                placeholder = "e.g. Alejandro, Marco, Hans..."
                )
    
    sidebarPanel(
                textInput("nombre", "Name:", ""),
                checkboxGroupInput(
                                    "paises",
                                    "Countries to compare:",
                                    choices = c("Spain", "Germany", "Italy"),
                                    selected = c("Spain", "Germany", "Italy")
                                    )
                )

    mainPanel(
                h3("Your name vibes score:"),
                textOutput("summary"),
                tableOutput("ranking_table"),
                plotOutput("entropy_plot", height = "350px")
                )

    )

server <- function(input, output, session) {
    # Aquí irá la lógica reactiva
}

shinyApp(ui, server)

