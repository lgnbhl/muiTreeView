# muiTreeView 0.2.0

* Upgrade to MUI X Tree View v9 (`@mui/x-tree-view` 9.0.2), matching the MUI v9 runtime shipped by muiMaterial.
* The tree view now shares muiMaterial's MUI Material, system and emotion runtime instead of bundling its own copy, so `muiMaterial::ThemeProvider()` and theme-aware `sx` values now apply to tree view components.
* `muiTreeViewDependency()` now also attaches `muiMaterial::muiMaterialDependency()`, so tree views render on pages without other muiMaterial components.
* Require muiMaterial >= 0.2.1 and warn at attach time if an older version is installed.
* Wrap the remaining free-tier components: `RichTreeViewRoot()`, `SimpleTreeViewRoot()`, `TreeItemCheckbox()`, `TreeItemContent()`, `TreeItemGroupTransition()`, `TreeItemIconContainer()`, `TreeItemLabel()`, `TreeItemLabelInput()`, `TreeItemProvider()`, `TreeItemRoot()`, `TreeViewCollapseIcon()` and `TreeViewExpandIcon()`.
* Add a test that every wrapped component exists in the bundled JavaScript.
* Add runnable usage examples for every exported function in `inst/examples/`, e.g. `source(system.file("examples/RichTreeView.R", package = "muiTreeView"))`.
* Reorganize the documentation to mirror the official MUI X Tree View docs, with links to the original pages: one article per Simple and Rich Tree View topic (items, selection, expansion, customization, label editing), Tree Item customization, accessibility, data frames with `asMuiTree()`, Shiny, navigation with reactRouter and theming. The "introduction" article is replaced by "Overview".

# muiTreeView 0.1.1

* rename function `createTree()` as `asMuiTree()`.

# muiTreeView 0.1.0

* initial commit
