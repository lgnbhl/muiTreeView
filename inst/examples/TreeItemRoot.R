library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/tree-item-customization/
# TreeItemRoot() is the outer <li> element of a tree item; it contains the
# item content and its children group.

# 1. Style the root of every item of a real tree with `.MuiTreeItem-root`,
# e.g. to separate the top-level items.
StyledTreeItemRoot <- div(
  Typography("Separate top-level items", variant = "h5"),
  SimpleTreeView(
    sx = list(
      "& > .MuiTreeItem-root" = list(
        borderBottom = "1px solid",
        borderColor = "divider",
        py = 0.5
      )
    ),
    TreeItem(
      itemId = "fruits",
      label = "Fruits",
      TreeItem(itemId = "apple", label = "Apple")
    ),
    TreeItem(
      itemId = "vegetables",
      label = "Vegetables",
      TreeItem(itemId = "carrot", label = "Carrot")
    ),
    TreeItem(itemId = "bread", label = "Bread")
  )
)

# 2. Use it in a static, read-only tree: one TreeItemRoot() per item.
StaticTreeItemRoot <- div(
  Typography("Static items", variant = "h5"),
  SimpleTreeViewRoot(
    TreeItemRoot(TreeItemContent(TreeItemIconContainer(), TreeItemLabel("Item 1"))),
    TreeItemRoot(TreeItemContent(TreeItemIconContainer(), TreeItemLabel("Item 2"))),
    TreeItemRoot(TreeItemContent(TreeItemIconContainer(), TreeItemLabel("Item 3")))
  )
)

ui_TreeItemRoot <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StyledTreeItemRoot, StaticTreeItemRoot)
  )
)

server_TreeItemRoot <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItemRoot, server = server_TreeItemRoot)
}
