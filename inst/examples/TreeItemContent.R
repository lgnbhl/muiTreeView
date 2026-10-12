library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/tree-item-customization/
# TreeItemContent() is the clickable row of a tree item. Its state is exposed
# as data attributes: data-selected, data-focused, data-disabled,
# data-expanded and data-editing.

# 1. Style the content slot of a real tree with the `.MuiTreeItem-content`
# class (works for SimpleTreeView and RichTreeView).
StyledTreeItemContent <- div(
  Typography("Style the content of every item", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("fruits"),
    sx = list(
      "& .MuiTreeItem-content" = list(py = 1, borderRadius = 4),
      "& .MuiTreeItem-content:hover" = list(bgcolor = "action.selected"),
      "& .MuiTreeItem-content[data-selected]" = list(
        bgcolor = "primary.main",
        color = "primary.contrastText"
      )
    ),
    TreeItem(
      itemId = "fruits",
      label = "Fruits",
      TreeItem(itemId = "apple", label = "Apple"),
      TreeItem(itemId = "pear", label = "Pear")
    )
  )
)

# 2. Build a static, read-only tree from the slot components. Set the depth
# with the --TreeView-itemDepth CSS variable, and the state with data
# attributes.
StaticTreeItemContent <- div(
  Typography("Static rows", variant = "h5"),
  SimpleTreeViewRoot(
    sx = list("--TreeView-itemChildrenIndentation" = "16px"),
    TreeItemRoot(TreeItemContent(
      style = list("--TreeView-itemDepth" = 0),
      TreeItemIconContainer(),
      TreeItemLabel("Default row")
    )),
    TreeItemRoot(TreeItemContent(
      `data-selected` = TRUE,
      style = list("--TreeView-itemDepth" = 0),
      TreeItemIconContainer(),
      TreeItemLabel("data-selected")
    )),
    TreeItemRoot(TreeItemContent(
      `data-disabled` = TRUE,
      style = list("--TreeView-itemDepth" = 0),
      TreeItemIconContainer(),
      TreeItemLabel("data-disabled")
    )),
    TreeItemRoot(TreeItemContent(
      style = list("--TreeView-itemDepth" = 1),
      TreeItemIconContainer(),
      TreeItemLabel("Depth 1")
    ))
  )
)

ui_TreeItemContent <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StyledTreeItemContent, StaticTreeItemContent)
  )
)

server_TreeItemContent <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItemContent, server = server_TreeItemContent)
}
