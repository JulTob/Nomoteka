library(shiny)
library(bslib)

# Cargamos módulos
source("R/mod_entropy.R")
source("R/mod_generator.R")

tema_nomoteka <- bs_theme(
    version   = 5,
    bootswatch = "minty",
    base_font  = "sans-serif",
    heading_font = "serif",
    primary   = "#6C5CE7",
    secondary = "#00CEC9",
    success   = "#55EFC4",
    info      = "#81ECEC",
    warning   = "#FAB1A0",
    danger    = "#FF7675"
)

ui <- navbarPage(
    "Nomoteka",
    theme = tema_nomoteka,

    tabPanel("Entropy Analyzer",
        EntropyUI("entropy")
    ),

    tabPanel("Name Generator",
        GeneratorUI("generator")
    )
)

server <- function(input, output, session) {
    EntropyServer("entropy")
    GeneratorServer("generator")
}

shinyApp(ui, server)
