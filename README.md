
<!-- README.md is generated from README.Rmd. Please edit that file -->

# muiTreeView

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/muiTreeView)](https://CRAN.R-project.org/package=muiTreeView)
[![R-CMD-check](https://github.com/lgnbhl/muiTreeView/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lgnbhl/muiTreeView/actions/workflows/R-CMD-check.yaml)
[![](https://img.shields.io/badge/@mui/x--tree--view-%5E8.16.0-blue.svg)](https://mui.com/x/react-tree-view/)
[![](https://img.shields.io/badge/react-18.3.1-blue.svg)](https://mui.com/x/react-tree-view/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Follow-E4405F?style=social&logo=linkedin)](https://www.linkedin.com/in/FelixLuginbuhl)
<!-- badges: end -->

**muiTreeView** gives access to [MUI X Tree
View](https://mui.com/x/react-tree-view/) React components, which lets
users navigate hierarchical lists of data with nested levels that can be
expanded and collapsed.

## Install

You can install the development version of muiTreeView like so:

``` r
remotes::install_github("lgnbhl/muiTreeView")
```

**Read the full documentation with examples
[here](https://lgnbhl.github.io/muiTreeView/articles/introduction.html).**

## Basic examples

``` r
library(muiTreeView)

df <- data.frame(
  pkg = c("muiTreeView", "muiTreeView", "muiTreeView"),
  functions = c("SimpleTreeView", "RichTreeView", "RichTreeView"),
  args = c("items", "items", "onItemSelectionToggle")
)

treeItems <- muiTreeView::asMuiTree(df)

RichTreeView(
  items = treeItems,
  checkboxSelection = TRUE,
  multiSelect = TRUE # FALSE for single select
)
```

<img src="https://raw.githubusercontent.com/lgnbhl/muiTreeView/refs/heads/main/man/figures/checkboxMultiSelect.png" alt="RichTreeView" style="padding:1px;border:thin solid black;"/>

### Contribute

If you have any issue, question or want to contribute with a pull
request, don’t hesitate to write me on
<https://github.com/lgnbhl/muiTreeView>

For updates follow [Felix
Luginbuhl](https://linkedin.com/in/FelixLuginbuhl) on LinkedIn.
