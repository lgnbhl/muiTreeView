test_that("SimpleTreeViewRoot() returns shiny.tag, correct name and value", {
  expect_equal(class(SimpleTreeViewRoot()), c("muiTreeView", "shiny.tag"))
  expect_equal(
    environment(SimpleTreeViewRoot()[["children"]][[2]])[["data"]][["name"]],
    "SimpleTreeViewRoot"
  )
  expect_equal(
    environment(SimpleTreeViewRoot("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
