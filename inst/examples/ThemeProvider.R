library(muiTreeView)
library(muiMaterial)
library(shiny)

# The tree view shares muiMaterial's MUI runtime, so a
# muiMaterial::ThemeProvider() styles it: selection, focus and checkbox
# colors follow the theme palette. Tree items inherit their text color from
# their parent: set `color = "text.primary"` on the container (or put
# CssBaseline() inside the ThemeProvider()) so the text follows the theme.
items <- list(
  list(id = "fruits", label = "Fruits", children = list(
    list(id = "apple", label = "Apple"),
    list(id = "pear", label = "Pear")
  )),
  list(id = "vegetables", label = "Vegetables", children = list(
    list(id = "carrot", label = "Carrot")
  ))
)

themedTree <- function() {
  RichTreeView(
    items = items,
    checkboxSelection = TRUE,
    multiSelect = TRUE,
    defaultExpandedItems = list("fruits"),
    defaultSelectedItems = list("apple")
  )
}

LightThemeProvider <- ThemeProvider(
  theme = list(palette = list(primary = list(main = "#2e7d32"))),
  Paper(
    sx = list(p = 2, color = "text.primary"),
    Typography("Light, green primary", variant = "h6"),
    themedTree()
  )
)

DarkThemeProvider <- ThemeProvider(
  theme = list(
    palette = list(mode = "dark", primary = list(main = "#ce93d8"))
  ),
  Paper(
    sx = list(p = 2, color = "text.primary"),
    Typography("Dark, purple primary", variant = "h6"),
    themedTree()
  )
)

ui_ThemeProvider <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2),
    Stack(
      direction = list(xs = "column", sm = "row"),
      spacing = 2,
      LightThemeProvider,
      DarkThemeProvider
    )
  )
)

server_ThemeProvider <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_ThemeProvider, server = server_ThemeProvider)
}
