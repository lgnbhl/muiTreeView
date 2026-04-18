component <- function(name, module = '@mui/x-tree-view') {
  function(...) {
    tag <- shiny.react::reactElement(
      module = module,
      name = name,
      props = shiny.react::asProps(...),
      deps = muiTreeViewDependency()
    )
    class(tag) <- c("muiTreeView", class(tag))
    tag
  }
}

#' @rdname SimpleTreeView
#' @export
SimpleTreeView <- component('SimpleTreeView')

#' @rdname RichTreeView
#' @export
RichTreeView <- component('RichTreeView')

#' @rdname TreeItem
#' @export
TreeItem <- component('TreeItem')

#' @rdname TreeItemIcon
#' @export
TreeItemIcon <- component('TreeItemIcon')
