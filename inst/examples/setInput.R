library(muiTreeView)
library(muiMaterial)
library(shiny)

# setInput(inputId, jsAccessor) sends a value from a tree view callback to
# Shiny as input[[inputId]]. `jsAccessor` picks the callback argument: the
# tree callbacks have the signature (event, value, ...), so use 1 for the
# second argument (indices start at 0).
items <- list(
  list(id = "fruits", label = "Fruits", children = list(
    list(id = "apple", label = "Apple"),
    list(id = "pear", label = "Pear")
  )),
  list(id = "vegetables", label = "Vegetables", children = list(
    list(id = "carrot", label = "Carrot"),
    list(id = "leek", label = "Leek")
  ))
)

SetInputTree <- RichTreeView(
  items = items,
  multiSelect = TRUE,
  checkboxSelection = TRUE,
  # function(event, itemIds): all selected ids
  onSelectedItemsChange = setInput("selected", 1),
  # function(event, itemIds): all expanded ids
  onExpandedItemsChange = setInput("expanded", 1),
  # function(event, itemId): the clicked id
  onItemClick = setInput("clicked", 1),
  # function(event, itemId): the focused id
  onItemFocus = setInput("focused", 1)
)

ui_setInput <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Typography("Send tree events to Shiny", variant = "h5"),
    SetInputTree,
    verbatimTextOutput("values")
  )
)

server_setInput <- function(input, output, session) {
  output$values <- renderPrint({
    str(list(
      selected = input$selected,
      expanded = input$expanded,
      clicked = input$clicked,
      focused = input$focused
    ))
  })
}

if (interactive()) {
  shinyApp(ui = ui_setInput, server = server_setInput)
}
