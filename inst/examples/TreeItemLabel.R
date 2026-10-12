library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/tree-item-customization/
# TreeItemLabel() is the label slot of a tree item. It uses the theme's body1
# typography.

# 1. Style the label slot of a real tree with the `.MuiTreeItem-label` class.
StyledTreeItemLabel <- div(
  Typography("Style the labels", variant = "h5"),
  RichTreeView(
    items = list(
      list(id = "fruits", label = "Fruits", children = list(
        list(id = "apple", label = "Apple"),
        list(id = "pear", label = "A pear with a very long label that gets cut off")
      ))
    ),
    defaultExpandedItems = list("fruits"),
    sx = list(
      maxWidth = 300,
      "& .MuiTreeItem-label" = list(
        fontFamily = "monospace",
        whiteSpace = "nowrap",
        textOverflow = "ellipsis"
      )
    )
  )
)

# 2. Use it in a static, read-only tree.
StaticTreeItemLabel <- div(
  Typography("Static labels", variant = "h5"),
  SimpleTreeViewRoot(
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(),
      TreeItemLabel("Plain label")
    )),
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(),
      TreeItemLabel(sx = list(color = "secondary.main", fontWeight = "bold"), "Styled label")
    ))
  )
)

ui_TreeItemLabel <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StyledTreeItemLabel, StaticTreeItemLabel)
  )
)

server_TreeItemLabel <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItemLabel, server = server_TreeItemLabel)
}
