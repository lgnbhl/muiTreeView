#' Mui X Tree View JS dependency
#'
#' @return HTML dependency object.
#'
#' @export
muiTreeViewDependency <- function() {
  htmltools::htmlDependency(
    name = "muiTreeView",
    version = "0.1.0",
    package = "muiTreeView",
    src = "www/muiTreeView",
    script = "x-tree-view.js"
  )
}
