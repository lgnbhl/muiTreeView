library(muiTreeView)
library(muiMaterial)
library(shiny)

# https://mui.com/x/api/tree-view/tree-item/
# TreeItem() is the item of SimpleTreeView(). `itemId` must be unique.
BasicTreeItem <- div(
  Typography("Nested items", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("parent"),
    TreeItem(
      itemId = "parent",
      label = "Parent",
      TreeItem(itemId = "child-1", label = "Child 1"),
      TreeItem(
        itemId = "child-2",
        label = "Child 2",
        TreeItem(itemId = "grandchild", label = "Grandchild")
      )
    )
  )
)

# The label accepts any UI element, e.g. icons and other MUI components.
RichLabelTreeItem <- div(
  Typography("Rich labels", variant = "h5"),
  SimpleTreeView(
    defaultExpandedItems = list("documents"),
    TreeItem(
      itemId = "documents",
      label = span(shiny::icon("folder"), " Documents"),
      TreeItem(itemId = "notes", label = span(shiny::icon("file"), " Notes")),
      TreeItem(
        itemId = "inbox",
        label = Stack(
          direction = "row",
          spacing = 1,
          alignItems = "center",
          span(shiny::icon("envelope"), " Inbox"),
          Chip(label = "12", size = "small", color = "primary")
        )
      )
    )
  )
)

# disabled, per-item sx styling and per-item slots
CustomTreeItem <- div(
  Typography("Disabled, styled and custom icon", variant = "h5"),
  SimpleTreeView(
    TreeItem(itemId = "disabled", label = "Disabled item", disabled = TRUE),
    TreeItem(
      itemId = "styled",
      label = "Turns green when selected",
      sx = list(
        "& .MuiTreeItem-content[data-selected]" = list(
          bgcolor = "success.light",
          color = "white"
        )
      )
    ),
    TreeItem(
      itemId = "custom-icon",
      label = "Item with its own icon",
      # `slots` expects a React component: write a small one with JS()
      slots = list(icon = JS("() => '★'"))
    )
  )
)

ui_TreeItem <- muiMaterialPage(
  CssBaseline(),
  Box(
    sx = list(p = 2, maxWidth = 500),
    Stack(spacing = 3, BasicTreeItem, RichLabelTreeItem, CustomTreeItem)
  )
)

server_TreeItem <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_TreeItem, server = server_TreeItem)
}
