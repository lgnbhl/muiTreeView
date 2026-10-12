library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/tree-item-customization/
# TreeItemCheckbox() is the checkbox shown in each item when the tree has
# `checkboxSelection = TRUE`. It is an MUI Checkbox, rendered only when
# `visible = TRUE`.

# 1. Style the checkboxes of a real tree with `.MuiTreeItem-checkbox`.
StyledTreeItemCheckbox <- div(
  Typography("Style the checkboxes", variant = "h5"),
  RichTreeView(
    items = list(
      list(id = "fruits", label = "Fruits", children = list(
        list(id = "apple", label = "Apple"),
        list(id = "pear", label = "Pear")
      ))
    ),
    defaultExpandedItems = list("fruits"),
    defaultSelectedItems = list("apple"),
    checkboxSelection = TRUE,
    multiSelect = TRUE,
    sx = list(
      "& .MuiTreeItem-checkbox" = list(color = "success.main"),
      "& .MuiTreeItem-checkbox.Mui-checked" = list(color = "success.main")
    )
  )
)

# 2. Pass Checkbox props to every item checkbox with slotProps.
SlotPropsTreeItemCheckbox <- div(
  Typography("Small secondary checkboxes", variant = "h5"),
  SimpleTreeView(
    checkboxSelection = TRUE,
    slotProps = list(checkbox = list(size = "small", color = "secondary")),
    TreeItem(itemId = "apple", label = "Apple"),
    TreeItem(itemId = "pear", label = "Pear")
  )
)

# 3. Use it in a static, read-only tree.
StaticTreeItemCheckbox <- div(
  Typography("Static checkboxes", variant = "h5"),
  SimpleTreeViewRoot(
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(),
      TreeItemCheckbox(visible = TRUE, checked = TRUE),
      TreeItemLabel("Checked")
    )),
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(),
      TreeItemCheckbox(visible = TRUE, indeterminate = TRUE),
      TreeItemLabel("Indeterminate")
    )),
    TreeItemRoot(TreeItemContent(
      TreeItemIconContainer(),
      TreeItemCheckbox(visible = TRUE),
      TreeItemLabel("Unchecked")
    ))
  )
)

ui_TreeItemCheckbox <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(
      spacing = 3,
      StyledTreeItemCheckbox,
      SlotPropsTreeItemCheckbox,
      StaticTreeItemCheckbox
    )
  )
)

server_TreeItemCheckbox <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItemCheckbox, server = server_TreeItemCheckbox)
}
