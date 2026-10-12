test_that("TreeItemContent() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemContent()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(TreeItemContent()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemContent"
  )
  expect_equal(
    environment(TreeItemContent("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
