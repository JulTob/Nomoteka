# R/mod_generator.R

GeneratorUI <- function(id) {
    ns <- NS(id)

    fluidPage(
        h2("Name Generator 🧪"),
        p("Genera nombres basados en distintas fuentes, incluyendo culturas reales",
          "y generadores de fantasía de GenLegend."),

        selectInput(
            ns("generator_source"),
            "Source:",
            choices = c(
                "Spain", "Germany", "Italy",
                "GenLegend — Elves",
                "GenLegend — Dwarves",
                "GenLegend — Catfolk",
                "GenLegend — Vampires"
            )
        ),

        actionButton(ns("generate"), "Generate Name"),
        br(), br(),

        h3("Generated Name"),
        textOutput(ns("generated_name")),

        hr(),
        p("Aquí añadiremos sliders para controlar aleatoriedad, entropía, variantes…")
    )
}

GeneratorServer <- function(id) {
    moduleServer(id, function(input, output, session) {

        output$generated_name <- renderText({
            "Aquí aparecerá un nombre generado."
        })

        # Más adelante: lógica de generación según input$generator_source, etc.
    })
}

