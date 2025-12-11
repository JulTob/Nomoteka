# R/mod_entropy.R

EntropyUI <- function(id) {
    ns <- NS(id)

    sidebarLayout(
        sidebarPanel(
            h3("Name Entropy Analyzer 🔬✨"),
            p("Escribe un nombre y compara cómo suena frente a varios países."),
            textInput(
                inputId   = ns("nombre"),
                label     = "Name to analyze:",
                placeholder = "e.g. Alejandro, Marco, Hans..."
            ),
            checkboxGroupInput(
                ns("paises"),
                "Countries to compare:",
                choices  = c("Spain", "Germany", "Italy"),
                selected = c("Spain", "Germany", "Italy")
            ),
            hr(),
            p("Más opciones llegarán pronto…")
        ),

        mainPanel(
            h2("Results"),
            textOutput(ns("summary")),

            h3("Ranking"),
            tableOutput(ns("ranking_table")),

            h3("Entropy Chart"),
            plotOutput(ns("entropy_plot"), height = "350px"),

            h3("European Map (heat by name similarity)"),
            plotOutput(ns("europe_map"), height = "400px"),
            p("Aquí irá el mapa de Europa coloreado según la entropía del nombre.")
        )
    )
}

EntropyServer <- function(id) {
    moduleServer(id, function(input, output, session) {

        output$summary <- renderText({
            "Aquí aparecerá un resumen del análisis."
        })

        output$ranking_table <- renderTable({
            data.frame(
                Country = c("Spain", "Germany", "Italy"),
                Entropy = c(NA, NA, NA)
            )
        })

        output$entropy_plot <- renderPlot({
            plot.new()
            title("Plot coming soon!")
        })

        output$europe_map <- renderPlot({
            plot.new()
            title("Map coming soon!")
        })
    })
}
