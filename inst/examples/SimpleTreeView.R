library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/simple-tree-view/items/#basic-usage
# SimpleTreeView takes TreeItem() children instead of an `items` list.
BasicSimpleTreeView <- div(
  Typography("Basic usage", variant = "h5"),
  SimpleTreeView(
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
    ),
    TreeItem(itemId = "bread", label = "Bread")
  )
)

# https://mui.com/x/react-tree-view/simple-tree-view/expansion/
# https://mui.com/x/react-tree-view/simple-tree-view/selection/
# Ids passed to defaultExpandedItems / defaultSelectedItems must be in list().
# The selected ids are sent to Shiny as input$SimpleTreeViewSelected.
SelectionSimpleTreeView <- div(
  Typography("Expansion and selection", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("documents"),
    defaultSelectedItems = list("notes"),
    multiSelect = TRUE,
    checkboxSelection = TRUE,
    onSelectedItemsChange = setInput("SimpleTreeViewSelected", 1),
    TreeItem(
      itemId = "documents",
      label = "Documents",
      TreeItem(itemId = "notes", label = "Notes"),
      TreeItem(itemId = "images", label = "Images"),
      TreeItem(itemId = "videos", label = "Videos", disabled = TRUE)
    ),
    TreeItem(itemId = "trash", label = "Trash")
  ),
  verbatimTextOutput("SimpleTreeViewSelectedValue")
)

# https://mui.com/x/react-tree-view/simple-tree-view/customization/
# Style the whole tree with sx, targeting the item slots by class name and the
# item state by data attribute (data-selected, data-focused, data-disabled...).
StyledSimpleTreeView <- div(
  Typography("Styling", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("styled"),
    sx = list(
      "& .MuiTreeItem-label" = list(fontWeight = 500),
      "& .MuiTreeItem-content[data-selected]" = list(
        bgcolor = "success.light",
        color = "success.contrastText"
      )
    ),
    TreeItem(
      itemId = "styled",
      label = "Styled tree",
      TreeItem(itemId = "styled-1", label = "Click to select me"),
      TreeItem(itemId = "styled-2", label = "Or me")
    )
  )
)

ui_SimpleTreeView <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(
      spacing = 3,
      BasicSimpleTreeView,
      SelectionSimpleTreeView,
      StyledSimpleTreeView
    )
  )
)

server_SimpleTreeView <- function(input, output, session) {
  output$SimpleTreeViewSelectedValue <- renderPrint(input$SimpleTreeViewSelected)
}

if (interactive()) {
  shinyApp(ui = ui_SimpleTreeView, server = server_SimpleTreeView)
}
