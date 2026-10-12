library(muiTreeView)
library(muiMaterial)
library(shiny)

# Items are a nested list: each item needs a unique `id` and a `label`;
# `children` holds the sub-items. See also asMuiTree() to build them from a
# data.frame.
items <- list(
  list(
    id = "fruits",
    label = "Fruits",
    children = list(
      list(id = "apple", label = "Apple"),
      list(id = "pear", label = "Pear"),
      list(id = "mango", label = "Mango (out of stock)", disabled = TRUE)
    )
  ),
  list(
    id = "vegetables",
    label = "Vegetables",
    children = list(
      list(id = "carrot", label = "Carrot"),
      list(id = "leek", label = "Leek", disabled = TRUE)
    )
  ),
  list(id = "bread", label = "Bread"),
  list(id = "cheese", label = "Cheese")
)

# https://mui.com/x/react-tree-view/rich-tree-view/items/#basic-usage
BasicRichTreeView <- div(
  Typography("Basic usage", variant = "h5"),
  RichTreeView(items = items)
)

# https://mui.com/x/react-tree-view/rich-tree-view/items/#item-identifier
# Use getItemId / getItemLabel when your data uses other field names.
CustomFieldsRichTreeView <- div(
  Typography("Custom item fields", variant = "h5"),
  RichTreeView(
    items = list(
      list(key = "fruits", name = "Fruits", children = list(
        list(key = "apple", name = "Apple"),
        list(key = "pear", name = "Pear")
      ))
    ),
    getItemId = JS("(item) => item.key"),
    getItemLabel = JS("(item) => item.name"),
    defaultExpandedItems = list("fruits")
  )
)

# https://mui.com/x/react-tree-view/rich-tree-view/items/#disabled-items
DisabledRichTreeView <- div(
  Typography("Disabled items", variant = "h5"),
  RichTreeView(
    items = items,
    defaultExpandedItems = list("fruits", "vegetables"),
    isItemDisabled = JS("(item) => !!item.disabled")
  )
)

# https://mui.com/x/react-tree-view/rich-tree-view/selection/
# Checkbox selection, multi selection and selection propagation. The selected
# ids are sent to Shiny as input$RichTreeViewSelected.
SelectionRichTreeView <- div(
  Typography("Selection", variant = "h5"),
  RichTreeView(
    items = items,
    checkboxSelection = TRUE,
    multiSelect = TRUE,
    defaultSelectedItems = list("bread"),
    selectionPropagation = list(descendants = TRUE, parents = TRUE),
    onSelectedItemsChange = setInput("RichTreeViewSelected", 1)
  ),
  verbatimTextOutput("RichTreeViewSelectedValue")
)

# https://mui.com/x/react-tree-view/rich-tree-view/expansion/
# The expanded ids are sent to Shiny as input$RichTreeViewExpanded.
ExpansionRichTreeView <- div(
  Typography("Expansion", variant = "h5"),
  RichTreeView(
    items = items,
    # Only the arrow icon toggles the expansion, not the whole row
    expansionTrigger = "iconContainer",
    itemChildrenIndentation = 24,
    onExpandedItemsChange = setInput("RichTreeViewExpanded", 1)
  ),
  verbatimTextOutput("RichTreeViewExpandedValue")
)

# https://mui.com/x/react-tree-view/rich-tree-view/editing/
# Double-click an item to edit its label. onItemLabelChange receives two
# arguments (itemId, newLabel), so it is forwarded to Shiny with JS().
# Like every value sent from the browser, input$RichTreeViewLabel is untrusted:
# validate the id and label on the server before storing them.
EditingRichTreeView <- div(
  Typography("Label editing", variant = "h5"),
  RichTreeView(
    items = items,
    isItemEditable = TRUE,
    onItemLabelChange = JS(
      "(itemId, label) => Shiny.setInputValue('RichTreeViewLabel', {itemId, label})"
    )
  ),
  verbatimTextOutput("RichTreeViewLabelValue")
)

ui_RichTreeView <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(
      spacing = 3,
      BasicRichTreeView,
      CustomFieldsRichTreeView,
      DisabledRichTreeView,
      SelectionRichTreeView,
      ExpansionRichTreeView,
      EditingRichTreeView
    )
  )
)

server_RichTreeView <- function(input, output, session) {
  output$RichTreeViewSelectedValue <- renderPrint(input$RichTreeViewSelected)
  output$RichTreeViewExpandedValue <- renderPrint(input$RichTreeViewExpanded)
  output$RichTreeViewLabelValue <- renderPrint(input$RichTreeViewLabel)
}

if (interactive()) {
  shinyApp(ui = ui_RichTreeView, server = server_RichTreeView)
}
