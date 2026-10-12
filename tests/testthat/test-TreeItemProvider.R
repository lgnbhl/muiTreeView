test_that("TreeItemProvider() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemProvider()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeItemProvider()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemProvider"
  )
  expect_equal(
    environment(TreeItemProvider("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
