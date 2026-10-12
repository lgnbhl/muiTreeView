library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/api/tree-view/tree-item-provider/
# TreeItemProvider() gives an item's children access to the tree's context.
# It is meant for custom tree items written in JavaScript with the
# useTreeItem() hook. From R, it can host a custom, static row inside a real
# tree view. The row is displayed but not interactive (no selection or
# expansion).
#
# Warning: do not wrap TreeItem() in TreeItemProvider(): TreeItem() already
# provides its own context, and nesting both freezes the page.
ProviderTreeItemProvider <- div(
  Typography("Custom static row inside a tree", variant = "h5"),
  SimpleTreeView(
    TreeItem(itemId = "fruits", label = "Fruits"),
    TreeItemProvider(
      itemId = "section-title",
      id = "section-title",
      TreeItemRoot(
        TreeItemContent(
          sx = list(cursor = "default", "&:hover" = list(bgcolor = "transparent")),
          TreeItemIconContainer(),
          TreeItemLabel(
            sx = list(typography = "overline", color = "text.secondary"),
            "Section title"
          )
        )
      )
    ),
    TreeItem(itemId = "vegetables", label = "Vegetables")
  )
)

ui_TreeItemProvider <- muiMaterialPage(
  CssBaseline(),
  Box(sx = list(p = 2, maxWidth = 500), ProviderTreeItemProvider)
)

server_TreeItemProvider <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItemProvider, server = server_TreeItemProvider)
}
