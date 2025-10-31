test_that("TreeItemIcon() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItemIcon()), "shiny.tag")
  expect_equal(
    environment(TreeItemIcon()[["children"]][[2]])[["data"]][["name"]],
    "TreeItemIcon"
  )
  expect_equal(
    environment(TreeItemIcon("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
