test_that("TreeItemLabel() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemLabel()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeItemLabel()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemLabel"
  )
  expect_equal(
    environment(TreeItemLabel("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
