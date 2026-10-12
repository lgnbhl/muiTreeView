library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/simple-tree-view/customization/
# SimpleTreeViewRoot() is the outer <ul> element of SimpleTreeView().

# 1. Style the root of a real SimpleTreeView with the `sx` prop (applied to
# the root) or the `.MuiSimpleTreeView-root` class.
StyledSimpleTreeViewRoot <- div(
  Typography("Style the root", variant = "h5"),
  SimpleTreeView(
    sx = list(
      p = 1,
      bgcolor = "background.paper",
      boxShadow = 2,
      borderRadius = 2
    ),
    TreeItem(
      itemId = "fruits",
      label = "Fruits",
      TreeItem(itemId = "apple", label = "Apple")
    ),
    TreeItem(itemId = "bread", label = "Bread")
  )
)

# 2. Use it as the container of a static, read-only tree. Nested items are
# indented by --TreeView-itemChildrenIndentation x --TreeView-itemDepth.
StaticSimpleTreeViewRoot <- div(
  Typography("Static tree", variant = "h5"),
  SimpleTreeViewRoot(
    sx = list("--TreeView-itemChildrenIndentation" = "24px"),
    TreeItemRoot(TreeItemContent(
      style = list("--TreeView-itemDepth" = 0),
      TreeItemIconContainer(TreeViewCollapseIcon()),
      TreeItemLabel("Depth 0")
    )),
    TreeItemRoot(TreeItemContent(
      style = list("--TreeView-itemDepth" = 1),
      TreeItemIconContainer(TreeViewCollapseIcon()),
      TreeItemLabel("Depth 1")
    )),
    TreeItemRoot(TreeItemContent(
      style = list("--TreeView-itemDepth" = 2),
      TreeItemIconContainer(),
      TreeItemLabel("Depth 2")
    ))
  )
)

ui_SimpleTreeViewRoot <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StyledSimpleTreeViewRoot, StaticSimpleTreeViewRoot)
  )
)

server_SimpleTreeViewRoot <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_SimpleTreeViewRoot, server = server_SimpleTreeViewRoot)
}
