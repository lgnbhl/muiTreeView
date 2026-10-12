library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/tree-item-customization/
# TreeItemGroupTransition() wraps the children of a tree item. It is an MUI
# Collapse, so it accepts the Collapse props (`in`, `timeout`...).

# 1. Style the children group of a real tree with
# `.MuiTreeItem-groupTransition`, e.g. to draw a guide line.
StyledTreeItemGroupTransition <- div(
  Typography("Guide lines for nested items", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("fruits", "citrus"),
    sx = list(
      "& .MuiTreeItem-groupTransition" = list(
        ml = "15px",
        pl = "4px",
        borderLeft = "1px dashed",
        borderColor = "divider"
      )
    ),
    TreeItem(
      itemId = "fruits",
      label = "Fruits",
      TreeItem(itemId = "apple", label = "Apple"),
      TreeItem(
        itemId = "citrus",
        label = "Citrus",
        TreeItem(itemId = "lemon", label = "Lemon"),
        TreeItem(itemId = "orange", label = "Orange")
      )
    )
  )
)

# 2. Change the expand/collapse animation duration of every item with
# slotProps.
SlotPropsTreeItemGroupTransition <- div(
  Typography("Slower animation", variant = "h5"),
  SimpleTreeView(
    slotProps = list(groupTransition = list(timeout = 1000)),
    TreeItem(
      itemId = "fruits",
      label = "Click me",
      TreeItem(itemId = "apple", label = "Apple"),
      TreeItem(itemId = "pear", label = "Pear")
    )
  )
)

# 3. Use it in a static, read-only tree (`in` = TRUE shows the children).
StaticTreeItemGroupTransition <- div(
  Typography("Static group", variant = "h5"),
  SimpleTreeViewRoot(
    TreeItemRoot(
      TreeItemContent(
        TreeItemIconContainer(TreeViewCollapseIcon()),
        TreeItemLabel("Fruits")
      ),
      TreeItemGroupTransition(
        `in` = TRUE,
        sx = list(pl = 3),
        TreeItemRoot(TreeItemContent(TreeItemIconContainer(), TreeItemLabel("Apple"))),
        TreeItemRoot(TreeItemContent(TreeItemIconContainer(), TreeItemLabel("Pear")))
      )
    )
  )
)

ui_TreeItemGroupTransition <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(
      spacing = 3,
      StyledTreeItemGroupTransition,
      SlotPropsTreeItemGroupTransition,
      StaticTreeItemGroupTransition
    )
  )
)

server_TreeItemGroupTransition <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItemGroupTransition, server = server_TreeItemGroupTransition)
}
