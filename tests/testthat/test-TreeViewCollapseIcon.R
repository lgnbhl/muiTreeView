test_that("TreeViewCollapseIcon() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeViewCollapseIcon()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeViewCollapseIcon()[["children"]][[2]])[["data"]][["name"]],
    "TreeViewCollapseIcon"
  )
  expect_equal(
    environment(TreeViewCollapseIcon("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
