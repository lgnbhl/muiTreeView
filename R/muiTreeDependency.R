#' Mui X Tree View JS dependency
#'
#' @return A list of HTML dependency objects (\code{htmltools::htmlDependency})
#'   that load the bundled MUI X Tree View JavaScript and its shared MUI Material
#'   runtime. The muiMaterial dependency is listed first so its bundle (which
#'   provides react, react-dom, \code{@mui/material}, \code{@mui/system} and the
#'   emotion runtime that the tree view consumes as externals) loads before the
#'   tree view script. Attach it to custom HTML when building a tree view by hand.
#'
#' @examples
#' # Inspect the dependencies attached to every muiTreeView element.
#' muiTreeViewDependency()
#'
#' @export
muiTreeViewDependency <- function() {
  list(
    muiMaterial::muiMaterialDependency(),
    htmltools::htmlDependency(
      name = "muiTreeView",
      version = as.character(utils::packageVersion("muiTreeView")),
      package = "muiTreeView",
      src = "www/muiTreeView",
      script = "x-tree-view.js"
    )
  )
}
