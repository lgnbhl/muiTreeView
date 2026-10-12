test_that("TreeItemCheckbox() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemCheckbox()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeItemCheckbox()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemCheckbox"
  )
  expect_equal(
    environment(TreeItemCheckbox("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
