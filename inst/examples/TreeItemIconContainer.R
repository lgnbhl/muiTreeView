library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/tree-item-customization/
# TreeItemIconContainer() is the 16px wide box holding the expand/collapse
# icon of a tree item.

# 1. Style the icon container of a real tree with `.MuiTreeItem-iconContainer`.
StyledTreeItemIconContainer <- div(
  Typography("Style the icon container", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("fruits"),
    sx = list(
      "& .MuiTreeItem-iconContainer" = list(
        width = 24,
        color = "primary.main",
        "& svg" = list(fontSize = 24)
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
    )
  )
)

# 2. Use it in a static, read-only tree, with the default icons.
StaticTreeItemIconContainer <- div(
  Typography("Static icon containers", variant = "h5"),
  SimpleTreeViewRoot(
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(TreeViewExpandIcon()),
      TreeItemLabel("Collapsed parent")
    )),
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(TreeViewCollapseIcon()),
      TreeItemLabel("Expanded parent")
    )),
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(),
      TreeItemLabel("Leaf (empty container keeps the alignment)")
    ))
  )
)

ui_TreeItemIconContainer <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StyledTreeItemIconContainer, StaticTreeItemIconContainer)
  )
)

server_TreeItemIconContainer <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItemIconContainer, server = server_TreeItemIconContainer)
}
