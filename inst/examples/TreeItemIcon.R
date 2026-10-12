library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/api/tree-view/tree-item-icon/
# TreeItemIcon() renders the icon a tree item shows for a given `status`:
# the expand icon (collapsed parent), the collapse icon (expanded parent) or
# the end icon (leaf). It must be rendered inside a tree view.
StatusTreeItemIcon <- div(
  Typography("Icon for each item status", variant = "h5"),
  SimpleTreeView(
    TreeItem(
      itemId = "collapsed",
      label = Stack(
        direction = "row", spacing = 1, alignItems = "center",
        TreeItemIcon(status = list(expandable = TRUE, expanded = FALSE)),
        span("expandable = TRUE, expanded = FALSE")
      )
    ),
    TreeItem(
      itemId = "expanded",
      label = Stack(
        direction = "row", spacing = 1, alignItems = "center",
        TreeItemIcon(status = list(expandable = TRUE, expanded = TRUE)),
        span("expandable = TRUE, expanded = TRUE")
      )
    )
  )
)

# The icons TreeItemIcon() picks from can be replaced with the `slots` prop of
# the tree (all items) or of a TreeItem() (one item). Slots expect React
# components, written here with JS().
SlotsTreeItemIcon <- div(
  Typography("Custom icons with slots", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("parent"),
    slots = list(
      expandIcon = JS("() => '+'"),
      collapseIcon = JS("() => '−'"),
      endIcon = JS("() => '•'")
    ),
    TreeItem(
      itemId = "parent",
      label = "Parent",
      TreeItem(itemId = "child-1", label = "Child 1"),
      TreeItem(itemId = "child-2", label = "Child 2")
    ),
    TreeItem(itemId = "other", label = "Other parent",
      TreeItem(itemId = "other-child", label = "Child")
    )
  )
)

ui_TreeItemIcon <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StatusTreeItemIcon, SlotsTreeItemIcon)
  )
)

server_TreeItemIcon <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItemIcon, server = server_TreeItemIcon)
}
