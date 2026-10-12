library(muiTreeView)
library(muiMaterial)
library(shiny)

# asMuiTree() turns a data.frame into the nested `items` list expected by
# RichTreeView(). Each column given in `levels` becomes a level of the tree.
df <- data.frame(
  continent = c("Europe", "Europe", "Europe", "Asia", "Asia"),
  country = c("Switzerland", "Switzerland", "France", "Japan", "Japan"),
  city = c("Bern", "Zurich", "Paris", "Tokyo", "Osaka"),
  code = c("BRN", "ZRH", "PAR", "TYO", "OSA")
)

# 1. Default: all columns are levels, and ids are generated as
# "<label>-<random number>", so they change on every run.
DefaultAsMuiTree <- div(
  Typography("All columns as levels", variant = "h5"),
  RichTreeView(items = asMuiTree(df[, c("continent", "country", "city")]))
)

# 2. Choose the levels and give stable ids with `levels_id` (one id column
# per level; ids must not contain spaces). Stable ids are needed to set
# defaultExpandedItems / defaultSelectedItems and to read the selection in
# Shiny.
df$continent_id <- tolower(df$continent)
df$country_id <- tolower(df$country)

stableItems <- asMuiTree(
  df,
  levels = c("continent", "country", "city"),
  levels_id = c("continent_id", "country_id", "code")
)

StableIdsAsMuiTree <- div(
  Typography("Stable ids with levels_id", variant = "h5"),
  RichTreeView(
    items = stableItems,
    defaultExpandedItems = list("europe", "switzerland"),
    defaultSelectedItems = "ZRH",
    onSelectedItemsChange = setInput("asMuiTreeSelected", 1)
  ),
  verbatimTextOutput("asMuiTreeSelectedValue")
)

# 3. Add extra fields to every item of a level with `...`: name the argument
# after the level column. Here every country item gets `disabled = TRUE`,
# read by isItemDisabled.
ExtraFieldsAsMuiTree <- div(
  Typography("Extra fields per level", variant = "h5"),
  RichTreeView(
    items = asMuiTree(
      df,
      levels = c("continent", "country"),
      levels_id = c("continent_id", "country_id"),
      country = list(disabled = TRUE)
    ),
    defaultExpandedItems = list("europe"),
    isItemDisabled = JS("(item) => !!item.disabled")
  )
)

# Inspect the structure created by asMuiTree()
str(stableItems[[1]], max.level = 3)

ui_asMuiTree <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, DefaultAsMuiTree, StableIdsAsMuiTree, ExtraFieldsAsMuiTree)
  )
)

server_asMuiTree <- function(input, output, session) {
  output$asMuiTreeSelectedValue <- renderPrint(input$asMuiTreeSelected)
}

if (interactive()) {
  shinyApp(ui = ui_asMuiTree, server = server_asMuiTree)
}
