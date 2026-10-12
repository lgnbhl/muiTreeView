library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/react-tree-view/rich-tree-view/customization/
# TreeViewExpandIcon() is the default icon of a collapsed parent item. It
# accepts the props of an MUI SvgIcon (fontSize, color, sx...).
StandaloneTreeViewExpandIcon <- div(
  Typography("As a standalone icon", variant = "h5"),
  Stack(
    direction = "row", spacing = 2, alignItems = "center",
    TreeViewExpandIcon(),
    TreeViewExpandIcon(fontSize = "large", color = "primary"),
    TreeViewExpandIcon(sx = list(color = "error.main", fontSize = 40))
  )
)

# Use it as the expand icon of a tree through `slots`, and style it with
# `slotProps`. Here the expand icon is also used for expanded items, rotated.
SlotsTreeViewExpandIcon <- div(
  Typography("In a tree, through slots", variant = "h5"),
  RichTreeView(
    items = list(
      list(id = "fruits", label = "Fruits", children = list(
        list(id = "apple", label = "Apple"),
        list(id = "pear", label = "Pear")
      ))
    ),
    slots = list(
      expandIcon = JS("jsmodule['@mui/x-tree-view'].TreeViewExpandIcon"),
      collapseIcon = JS("jsmodule['@mui/x-tree-view'].TreeViewExpandIcon")
    ),
    slotProps = list(
      expandIcon = list(sx = list(color = "primary.main")),
      collapseIcon = list(sx = list(color = "primary.main", transform = "rotate(90deg)"))
    )
  )
)

ui_TreeViewExpandIcon <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, StandaloneTreeViewExpandIcon, SlotsTreeViewExpandIcon)
  )
)

server_TreeViewExpandIcon <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeViewExpandIcon, server = server_TreeViewExpandIcon)
}
