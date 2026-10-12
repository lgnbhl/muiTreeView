test_that("TreeItemLabelInput() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemLabelInput()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeItemLabelInput()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemLabelInput"
  )
  expect_equal(
    environment(TreeItemLabelInput("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
