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

#' @rdname RichTreeViewRoot
#' @export
RichTreeViewRoot <- component('RichTreeViewRoot')

#' @rdname SimpleTreeViewRoot
#' @export
SimpleTreeViewRoot <- component('SimpleTreeViewRoot')

#' @rdname TreeItemCheckbox
#' @export
TreeItemCheckbox <- component('TreeItemCheckbox')

#' @rdname TreeItemContent
#' @export
TreeItemContent <- component('TreeItemContent')

#' @rdname TreeItemGroupTransition
#' @export
TreeItemGroupTransition <- component('TreeItemGroupTransition')

#' @rdname TreeItemIconContainer
#' @export
TreeItemIconContainer <- component('TreeItemIconContainer')

#' @rdname TreeItemLabel
#' @export
TreeItemLabel <- component('TreeItemLabel')

#' @rdname TreeItemLabelInput
#' @export
TreeItemLabelInput <- component('TreeItemLabelInput')

#' @rdname TreeItemProvider
#' @export
TreeItemProvider <- component('TreeItemProvider')

#' @rdname TreeItemRoot
#' @export
TreeItemRoot <- component('TreeItemRoot')

#' @rdname TreeViewCollapseIcon
#' @export
TreeViewCollapseIcon <- component('TreeViewCollapseIcon')

#' @rdname TreeViewExpandIcon
#' @export
TreeViewExpandIcon <- component('TreeViewExpandIcon')
