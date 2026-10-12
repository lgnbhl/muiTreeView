# Guard against R wrappers referencing components that do not exist in the
# bundled @mui/x-tree-view (e.g. after a JS major upgrade renames a component).
# The manifest is written by 'js/write-exports.js' as part of the JS build (yarn build) and lists every
# React component the bundle exports. The structural tests in
# test-<Component>.R files cannot catch this class of bug: they only assert the
# R-side tag, never JS-side existence.
test_that("every wrapped component exists in the bundled @mui/x-tree-view", {
  manifest <- system.file("components.txt", package = "muiTreeView")
  skip_if(
    identical(manifest, ""),
    "inst/components.txt not found (run 'yarn build' in js/)"
  )
  js_exports <- readLines(manifest)
  ns <- asNamespace("muiTreeView")
  checked <- 0L
  for (nm in getNamespaceExports("muiTreeView")) {
    fn <- get(nm, envir = ns)
    if (!is.function(fn)) next
    env <- environment(fn)
    # Component wrappers are closures produced by the component() factory,
    # identified by the `name` binding it captures; everything else exported
    # from the package (reexports, the dependency helper) is skipped.
    if (!is.environment(env) || !exists("name", env, inherits = FALSE)) next
    js_name <- get("name", envir = env)
    expect_true(
      js_name %in% js_exports,
      label = sprintf(
        "%s() wraps '%s', which is exported by the bundled @mui/x-tree-view,",
        nm, js_name
      )
    )
    checked <- checked + 1L
  }
  # If the factory ever changes shape, the loop above would silently check
  # nothing — make that failure loud.
  expect_gt(checked, 3L)
})
