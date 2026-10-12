test_that("TreeItemIconContainer() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemIconContainer()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeItemIconContainer()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemIconContainer"
  )
  expect_equal(
    environment(TreeItemIconContainer("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
