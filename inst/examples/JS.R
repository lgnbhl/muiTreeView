library(muiTreeView)
library(muiMaterial)
library(shiny)

# JS() marks a string as JavaScript code, evaluated in the browser. Use it
# for props that expect a function or a React component.
#
# Security: only pass fixed code to JS(). Never build the string with
# paste0()/glue() from input$..., URL parameters, files or databases: that is
# code injection (XSS). Put the data in the items/props instead and read it
# inside the function, as `item.stock` does below. Likewise, never wrap
# untrusted text in HTML() (e.g. as a label): plain strings are escaped,
# HTML() is not.
items <- list(
  list(id = "fruits", label = "Fruits", stock = 12, children = list(
    list(id = "apple", label = "Apple", stock = 10),
    list(id = "pear", label = "Pear", stock = 2),
    list(id = "mango", label = "Mango", stock = 0)
  ))
)

JSTree <- RichTreeView(
  items = items,
  defaultExpandedItems = list("fruits"),
  # A function computing the label of each item from its fields
  getItemLabel = JS("(item) => `${item.label} (${item.stock} in stock)`"),
  # A function disabling the items that are out of stock
  isItemDisabled = JS("(item) => item.stock === 0"),
  # A callback with several arguments, sent to Shiny as one object
  onItemExpansionToggle = JS(
    "(event, itemId, isExpanded) =>
       Shiny.setInputValue('expansion', {itemId, isExpanded})"
  ),
  # A React component (here, a function returning text) used as an icon
  slots = list(endIcon = JS("() => '•'"))
)

ui_JS <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Typography("JavaScript props", variant = "h5"),
    JSTree,
    verbatimTextOutput("expansion")
  )
)

server_JS <- function(input, output, session) {
  output$expansion <- renderPrint(input$expansion)
}

if (interactive()) {
  shinyApp(ui = ui_JS, server = server_JS)
}
