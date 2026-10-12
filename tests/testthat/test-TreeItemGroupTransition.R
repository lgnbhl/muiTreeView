test_that("TreeItemGroupTransition() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemGroupTransition()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeItemGroupTransition()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemGroupTransition"
  )
  expect_equal(
    environment(TreeItemGroupTransition("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
