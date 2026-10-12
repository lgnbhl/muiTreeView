test_that("RichTreeViewRoot() returns shiny.tag, correct name and value", {
  expect_equal(class(RichTreeViewRoot()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(RichTreeViewRoot()[["children"]][[2]])[["data"]][["name"]],
    "RichTreeViewRoot"
  )
  expect_equal(
    environment(RichTreeViewRoot("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
