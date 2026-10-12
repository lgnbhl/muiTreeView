library(muiTreeView)
library(muiMaterial)
library(shiny)

# muiTreeViewDependency() returns the HTML dependencies needed by the tree
# view: muiMaterial's MUI runtime first, then the MUI X Tree View bundle.
# Every muiTreeView component attaches them automatically, so you only need
# this function when building HTML by hand.
deps <- muiTreeViewDependency()
vapply(deps, function(dep) paste(dep$name, dep$version), character(1))

# 1. Render a component of '@mui/x-tree-view' directly with shiny.react,
# e.g. to try a component that has no R wrapper yet. Pass the dependencies
# so the bundle is loaded.
ReactElementDependency <- div(
  Typography("shiny.react::reactElement()", variant = "h5"),
  shiny.react::reactElement(
    module = "@mui/x-tree-view",
    name = "SimpleTreeView",
    props = shiny.react::asProps(
      TreeItem(itemId = "a", label = "Rendered with reactElement()")
    ),
    deps = muiTreeViewDependency()
  )
)

ui_muiTreeViewDependency <- muiMaterialPage(
  CssBaseline(),
  Box(sx = list(p = 2, maxWidth = 500), ReactElementDependency)
)

server_muiTreeViewDependency <- function(input, output, session) {}

if (interactive()) {
  shinyApp(ui = ui_muiTreeViewDependency, server = server_muiTreeViewDependency)
}

# 2. Load the bundle in a plain HTML page to use it from your own JavaScript:
# the components are then available under window.jsmodule['@mui/x-tree-view'].
# React itself is provided by shiny.react, so attach its dependencies first.
# Note: inline <script> tags do not run inside muiMaterialPage() or other
# React-rendered content, hence the plain htmltools page.
customJsPage <- htmltools::attachDependencies(
  tags$div(
    tags$h3("Components exported by @mui/x-tree-view"),
    tags$pre(id = "exports"),
    tags$script(HTML(
      "const treeView = window.jsmodule['@mui/x-tree-view'];
       document.getElementById('exports').textContent =
         Object.keys(treeView).filter((k) => /^[A-Z]/.test(k)).join('\\n');"
    ))
  ),
  c(
    list(shiny.react::reactDependency(), shiny.react::shinyReactDependency()),
    muiTreeViewDependency()
  )
)

if (interactive()) {
  htmltools::browsable(customJsPage)
}
