test_that("TreeItemRoot() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemRoot()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeItemRoot()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemRoot"
  )
  expect_equal(
    environment(TreeItemRoot("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
