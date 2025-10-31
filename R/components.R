## Script generated automatically from 'inst/helpers/generate_docs_tests.R' ##

component <- function(name, module = '@mui/x-tree-view') {
  function(...) shiny.react::reactElement(
    module = module,
    name = name,
    props = shiny.react::asProps(...),
    deps = muiTreeDependency()
  )
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
