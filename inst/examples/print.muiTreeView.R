library(muiTreeView)

# Every muiTreeView component has the class "muiTreeView". Printing one in an
# interactive session renders it in the RStudio/Positron viewer (or the web
# browser), so you can try components without writing a Shiny app.
tree <- RichTreeView(
  items = asMuiTree(
    data.frame(
      category = c("Fruits", "Fruits", "Vegetables"),
      item = c("Apple", "Pear", "Carrot")
    )
  )
)

class(tree)

# Auto-printing at the console calls print.muiTreeView(), which opens the
# viewer in interactive sessions.
if (interactive()) {
  tree
}

# browse = FALSE prints the underlying HTML instead of opening the viewer.
# This is also what happens in non-interactive sessions (e.g. Rscript).
print(tree, browse = FALSE)

# Wrap the component in muiMaterial layout components to preview it with a
# theme, then print the result.
if (interactive()) {
  library(muiMaterial)
  muiMaterialPage(
    ThemeProvider(
      theme = list(palette = list(primary = list(main = "#9819d2"))),
      Box(sx = list(p = 2), tree)
    )
  )
}
