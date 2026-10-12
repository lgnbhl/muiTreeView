library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/rich-tree-view/customization/
# RichTreeViewRoot() is the outer <ul> element of RichTreeView(). It sets the
# --TreeView-itemChildrenIndentation CSS variable used to indent nested items.

# 1. Style the root of a real RichTreeView with the `sx` prop (applied to the
# root) or the `.MuiRichTreeView-root` class.
StyledRichTreeViewRoot <- div(
  Typography("Style the root", variant = "h5"),
  RichTreeView(
    items = list(
      list(id = "fruits", label = "Fruits", children = list(
        list(id = "apple", label = "Apple"),
        list(id = "pear", label = "Pear")
      )),
      list(id = "bread", label = "Bread")
    ),
    defaultExpandedItems = list("fruits"),
    sx = list(
      p = 1,
      border = "1px solid",
      borderColor = "divider",
      borderRadius = 2,
      maxHeight = 150,
      overflowY = "auto"
    )
  )
)

# 2. Use it as the container of a static, read-only tree.
StaticRichTreeViewRoot <- div(
  Typography("Static tree", variant = "h5"),
  RichTreeViewRoot(
    sx = list(bgcolor = "action.hover", borderRadius = 2, p = 1),
    TreeItemRoot(TreeItemContent(TreeItemIconContainer(), TreeItemLabel("Item 1"))),
    TreeItemRoot(TreeItemContent(TreeItemIconContainer(), TreeItemLabel("Item 2")))
  )
)

ui_RichTreeViewRoot <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StyledRichTreeViewRoot, StaticRichTreeViewRoot)
  )
)

server_RichTreeViewRoot <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_RichTreeViewRoot, server = server_RichTreeViewRoot)
}
