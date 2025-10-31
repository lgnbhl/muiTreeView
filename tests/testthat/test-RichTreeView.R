test_that("RichTreeView() returns shiny.tag, correct name and value", {
  expect_equal(class(RichTreeView()), "shiny.tag")
  expect_equal(
    environment(RichTreeView()[["children"]][[2]])[["data"]][["name"]],
    "RichTreeView"
  )
  expect_equal(
    environment(RichTreeView("Test")[["children"]][[2]])[["data"]][["props"]][[
      "value"
    ]][["children"]],
    "Test"
  )
})
