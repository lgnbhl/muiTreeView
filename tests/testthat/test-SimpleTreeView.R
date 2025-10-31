test_that("SimpleTreeView() returns shiny.tag, correct name and value", {
  expect_equal(class(SimpleTreeView()), "shiny.tag")
  expect_equal(
    environment(SimpleTreeView()[["children"]][[2]])[["data"]][["name"]],
    "SimpleTreeView"
  )
  expect_equal(
    environment(SimpleTreeView("Test")[["children"]][[2]])[["data"]][[
      "props"
    ]][["value"]][["children"]],
    "Test"
  )
})
