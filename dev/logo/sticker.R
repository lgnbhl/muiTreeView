# Hex logo, built like the logos of the other packages (see muiChat/dev/logo/sticker.R).
# Run from the package root: source("dev/logo/sticker.R")
# Icon: Material Icons "park" (Apache 2.0): a tree, for the tree view.
# Colour: MUI azure (#007FFF), the hex fill shared by the MUI wrappers (muiMaterial,
# muiCharts, muiChat); the icon tells them apart. It stays clear of the other
# stickers of felixluginbuhl.com (aos purple, scroller navy).

library(hexSticker)
library(showtext)

# hexSticker rasterises an SVG subplot at low density: give it a large PNG.
icon <- tempfile(fileext = ".png")
rsvg::rsvg_png("dev/logo/tree-icon.svg", icon, width = 1200, height = 1200)

font_add_google(name = "Exo 2", regular.wt = "600")
showtext_auto()

hexSticker::sticker(
  subplot = icon,
  s_x = 1,
  s_y = 1.3,
  s_width = 0.4,
  package = "muiTreeView",
  p_color = "white",
  p_family = "Exo 2",
  p_size = 20,
  p_x = 1,
  p_y = 0.7,
  spotlight = FALSE,
  h_size = 0,
  h_fill = "#007FFF",
  h_color = "#007FFF",
  filename = "man/figures/logo.png"
)

magick::image_read("man/figures/logo.png") |>
  magick::image_trim() |>
  magick::image_scale("800") |>
  magick::image_write("man/figures/logo.png", format = "png")
