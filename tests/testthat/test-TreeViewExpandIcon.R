test_that("TreeViewExpandIcon() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeViewExpandIcon()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeViewExpandIcon()[["children"]][[2]])[["data"]][["name"]],
    "TreeViewExpandIcon"
  )
  expect_equal(
    environment(TreeViewExpandIcon("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
