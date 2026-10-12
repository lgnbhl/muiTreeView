test_that("muiTreeViewDependency() attaches muiMaterial before the tree view", {
  deps <- muiTreeViewDependency()
  expect_length(deps, 2)
  expect_equal(deps[[1]]$name, muiMaterial::muiMaterialDependency()$name)
  expect_equal(deps[[2]]$name, "muiTreeView")
  expect_equal(
    deps[[2]]$version,
    as.character(utils::packageVersion("muiTreeView"))
  )
})
