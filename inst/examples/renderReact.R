library(muiTreeView)
library(muiMaterial)
library(shiny)

# reactOutput() (UI) and renderReact() (server) render a tree view that
# depends on reactive values, e.g. to rebuild the tree from filtered data.
df <- data.frame(
  continent = c("Europe", "Europe", "Europe", "Asia", "Asia", "Africa"),
  country = c("Switzerland", "Switzerland", "France", "Japan", "Japan", "Kenya"),
  city = c("Bern", "Zurich", "Paris", "Tokyo", "Osaka", "Nairobi")
)

ui_renderReact <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Typography("Tree built on the server", variant = "h5"),
    checkboxGroupInput(
      inputId = "continents",
      label = "Continents",
      choices = unique(df$continent),
      selected = unique(df$continent),
      inline = TRUE
    ),
    reactOutput("tree"),
    verbatimTextOutput("selected")
  )
)

server_renderReact <- function(input, output, session) {
  output$tree <- renderReact({
    filtered <- df[df$continent %in% input$continents, ]
    if (nrow(filtered) == 0) {
      return(Typography("Select at least one continent.", color = "text.secondary"))
    }
    filtered$continent_id <- filtered$continent
    filtered$country_id <- filtered$country
    RichTreeView(
      items = asMuiTree(
        filtered,
        levels = c("continent", "country", "city"),
        levels_id = c("continent_id", "country_id", "city")
      ),
      defaultExpandedItems = as.list(unique(filtered$continent)),
      onSelectedItemsChange = setInput("selected", 1)
    )
  })
  output$selected <- renderPrint(input$selected)
}

if (interactive()) {
  shinyApp(ui = ui_renderReact, server = server_renderReact)
}
