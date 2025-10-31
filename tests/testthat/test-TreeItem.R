test_that("TreeItem() returns shiny.tag, correct name and value", {
  expect_equal(class(TreeItem()), "shiny.tag")
  expect_equal(
    environment(TreeItem()[["children"]][[2]])[["data"]][["name"]],
    "TreeItem"
  )
  expect_equal(
    environment(TreeItem("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
