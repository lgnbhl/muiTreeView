test_that("createTree works as expected", {
  df <- data.frame(
    pkg = c("muiTreeView", "muiTreeView"),
    functions = c("SimpleTreeView", "RichTreeView")
  )

  treeItems <- muiTreeView::createTree(df)

  treeItems2 <- list(
    list(
      label = 'muiTreeView',
      id = 'muiTreeView',
      children = list(
        list(
          label = 'SimpleTreeView', id = 'SimpleTreeView'
        ),
        list(
          label = 'RichTreeView', id = 'RichTreeView'
        )
      )
    )
  )
  expect_equal(treeItems, treeItems2)
})
