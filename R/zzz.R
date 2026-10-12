# Minimum muiMaterial version whose JavaScript bundle ships the MUI Material +
# system + emotion runtime that this package's bundled @mui/x-tree-view expects.
# The tree view is NOT bundled with its own @mui/material / @mui/system / emotion:
# it relies on the shared instance provided by muiMaterial's bundle (see
# muiTreeViewDependency() and js/webpack.config.js externals). If muiMaterial ships
# an @mui/material major that x-tree-view is not compatible with, the tree view fails at
# runtime in the browser (blank output / console errors) with nothing on the R
# side to explain it. Bump this whenever the bundled @mui/x-tree-view major changes
# to require a newer muiMaterial.
.MUIMATERIAL_MIN_VERSION <- "0.2.1"

# Warn (once, at attach) if the installed muiMaterial predates the version known
# to ship a compatible MUI runtime. Kept out of muiTreeViewDependency() so it fires
# once per session rather than on every tree view render.
.check_muimaterial_compat <- function() {
  if (!requireNamespace("muiMaterial", quietly = TRUE)) {
    return(invisible())
  }
  installed <- utils::packageVersion("muiMaterial")
  if (installed < .MUIMATERIAL_MIN_VERSION) {
    packageStartupMessage(
      "muiTreeView: installed 'muiMaterial' (", installed, ") is older than the ",
      "minimum compatible version (", .MUIMATERIAL_MIN_VERSION, "). The tree view ",
      "shares muiMaterial's bundled MUI Material/system/emotion runtime, so an ",
      "older muiMaterial can break rendering in the browser. Please update ",
      "muiMaterial."
    )
  }
  invisible()
}

.onAttach <- function(libname, pkgname) {
  .check_muimaterial_compat()
}
