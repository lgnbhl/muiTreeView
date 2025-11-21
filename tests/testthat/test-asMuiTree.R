test_that("createTree creates a list", {
  df <- data.frame(
    pkg = c("muiTreeView", "muiTreeView"),
    functions = c("SimpleTreeView", "RichTreeView")
  )

  treeItems <- muiTreeView::asMuiTree(df)
  
  # https://stackoverflow.com/a/13433689
  depth <- function(this,thisdepth=0){
    if(!is.list(this)){
      return(thisdepth)
    }else{
      return(max(unlist(lapply(this,depth,thisdepth=thisdepth+1))))    
    }
  }
  
  expect_true(is.list(treeItems))
  expect_equal(length(unlist(treeItems)), 6)
  expect_equal(depth(treeItems), 4)
  
})
