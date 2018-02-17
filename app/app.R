## app.R ##

library(shiny)
library(shinydashboard)
library(markdown)
library(rmutil)
library(shinyWidgets)

# Helper functions
source("bab_distributions.R")
source("bab_models.R")
source("bab_plots.R")

# User interface
source("bab_ui.R")

# Computational server
source("bab_server.R")

# Launch
shinyApp(ui, server)
