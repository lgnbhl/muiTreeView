library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/rich-tree-view/customization/
# TreeViewCollapseIcon() is the default icon of an expanded parent item. It
# accepts the props of an MUI SvgIcon (fontSize, color, sx...).
StandaloneTreeViewCollapseIcon <- div(
  Typography("As a standalone icon", variant = "h5"),
  Stack(
    direction = "row", spacing = 2, alignItems = "center",
    TreeViewCollapseIcon(),
    TreeViewCollapseIcon(fontSize = "large", color = "primary"),
    TreeViewCollapseIcon(sx = list(color = "error.main", fontSize = 40))
  )
)

# As a visual hint inside other components, e.g. a "show more" button
ButtonTreeViewCollapseIcon <- div(
  Typography("Inside another component", variant = "h5"),
  Button(variant = "outlined", endIcon = TreeViewCollapseIcon(), "Show more")
)

# Style the collapse icon of all expanded items with `slotProps`
SlotPropsTreeViewCollapseIcon <- div(
  Typography("In a tree, styled with slotProps", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("fruits"),
    slotProps = list(collapseIcon = list(sx = list(color = "secondary.main"))),
    TreeItem(
      itemId = "fruits",
      label = "Fruits",
      TreeItem(itemId = "apple", label = "Apple")
    )
  )
)

ui_TreeViewCollapseIcon <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(
      spacing = 3,
      StandaloneTreeViewCollapseIcon,
      ButtonTreeViewCollapseIcon,
      SlotPropsTreeViewCollapseIcon
    )
  )
)

server_TreeViewCollapseIcon <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeViewCollapseIcon, server = server_TreeViewCollapseIcon)
}
