library(muiTreeView)
library(muiMaterial)
library(shiny)

# triggerEvent(inputId) notifies Shiny that a callback fired, without sending
# its arguments. Use it with observeEvent() when you only need to react to the
# event (use setInput() when you need the value).
TriggerEventTree <- SimpleTreeView(
  onExpandedItemsChange = triggerEvent("expansionChanged"),
  onSelectedItemsChange = triggerEvent("selectionChanged"),
  TreeItem(
    itemId = "fruits",
    label = "Fruits",
    TreeItem(itemId = "apple", label = "Apple"),
    TreeItem(itemId = "pear", label = "Pear")
  ),
  TreeItem(
    itemId = "vegetables",
    label = "Vegetables",
    TreeItem(itemId = "carrot", label = "Carrot")
  )
)

ui_triggerEvent <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Typography("React to tree events", variant = "h5"),
    TriggerEventTree,
    verbatimTextOutput("log")
  )
)

server_triggerEvent <- function(input, output, session) {
  log <- reactiveVal(character())
  add_to_log <- function(msg) {
    log(c(log(), paste(format(Sys.time(), "%H:%M:%S"), msg)))
  }
  observeEvent(input$expansionChanged, add_to_log("an item was expanded or collapsed"))
  observeEvent(input$selectionChanged, add_to_log("the selection changed"))
  output$log <- renderText(paste(log(), collapse = "\n"))
}

if (interactive()) {
  shinyApp(ui = ui_triggerEvent, server = server_triggerEvent)
}
