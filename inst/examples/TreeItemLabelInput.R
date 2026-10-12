library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/rich-tree-view/editing/
# TreeItemLabelInput() is the text input shown in place of the label while an
# item is being edited. Editing is enabled with `isItemEditable` on
# RichTreeView(); double-click an item (or press Enter) to edit it.

# 1. Style the input of a real tree with `.MuiTreeItem-labelInput`, and send
# the new labels to Shiny.
StyledTreeItemLabelInput <- div(
  Typography("Style the label input", variant = "h5"),
  RichTreeView(
    items = list(
      list(id = "fruits", label = "Fruits (editable)", children = list(
        list(id = "apple", label = "Apple (editable)"),
        list(id = "pear", label = "Pear (read-only)", editable = FALSE)
      ))
    ),
    defaultExpandedItems = list("fruits"),
    # Only items without `editable = FALSE` can be edited. This is only a UI
    # restriction: the browser can send any value to Shiny, so the server
    # checks the item id again (see server_TreeItemLabelInput).
    isItemEditable = JS("(item) => item.editable !== false"),
    onItemLabelChange = JS(
      "(itemId, label) => Shiny.setInputValue('TreeItemLabelInputValue', {itemId, label})"
    ),
    sx = list(
      "& .MuiTreeItem-labelInput" = list(
        border = "2px solid",
        borderColor = "primary.main",
        borderRadius = 1,
        px = 1
      )
    )
  ),
  verbatimTextOutput("TreeItemLabelInputOutput")
)

# 2. Use it in a static, read-only tree.
StaticTreeItemLabelInput <- div(
  Typography("Static label input", variant = "h5"),
  SimpleTreeViewRoot(
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(),
      TreeItemLabelInput(value = "Label being edited", readOnly = TRUE)
    ))
  )
)

ui_TreeItemLabelInput <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StyledTreeItemLabelInput, StaticTreeItemLabelInput)
  )
)

server_TreeItemLabelInput <- function(input, output, session) {
  # Values coming from the browser are untrusted: accept only the editable ids
  # and a single string label before using them (e.g. saving to a database).
  editable_ids <- c("fruits", "apple")
  output$TreeItemLabelInputOutput <- renderPrint({
    value <- input$TreeItemLabelInputValue
    req(
      is.character(value$itemId), length(value$itemId) == 1,
      value$itemId %in% editable_ids,
      is.character(value$label), length(value$label) == 1
    )
    value
  })
}

if (interactive()) {
  shinyApp(ui = ui_TreeItemLabelInput, server = server_TreeItemLabelInput)
}
