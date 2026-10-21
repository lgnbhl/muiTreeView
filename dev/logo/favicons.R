# Builds pkgdown/favicon/ from man/figures/logo.png: the same set of files as
# the other package sites (realfavicongenerator's names), so pkgdown links them.
# Run from the package root: Rscript dev/logo/favicons.R

library(magick)

dir.create("pkgdown/favicon", showWarnings = FALSE, recursive = TRUE)
logo <- image_read("man/figures/logo.png")

# The hex on a transparent square, so square icons keep its shape.
square <- function(size) {
  image_scale(logo, paste0("x", size)) |>
    image_background("none") |>
    image_extent(paste0(size, "x", size), gravity = "center", color = "none")
}
# Touch and app icons get a cream square behind (iOS and maskable icons
# fill transparency with black).
on_paper <- function(size, inner = 0.8) {
  image_blank(size, size, "#FAF6F1") |>
    image_composite(square(round(size * inner)), gravity = "center")
}

image_write(square(96), "pkgdown/favicon/favicon-96x96.png")
image_write(on_paper(180), "pkgdown/favicon/apple-touch-icon.png")
image_write(on_paper(192, 0.7), "pkgdown/favicon/web-app-manifest-192x192.png")
image_write(on_paper(512, 0.7), "pkgdown/favicon/web-app-manifest-512x512.png")
image_write(c(square(16), square(32), square(48)), "pkgdown/favicon/favicon.ico", format = "ico")

# favicon.svg: the logo as an embedded PNG, like the other sites.
png <- tempfile(fileext = ".png")
image_write(logo, png)
info <- image_info(logo)
writeLines(
  sprintf(
    '<svg xmlns="http://www.w3.org/2000/svg" width="%1$d" height="%2$d" viewBox="0 0 %1$d %2$d"><image width="%1$d" height="%2$d" href="data:image/png;base64,%3$s"/></svg>',
    info$width, info$height, base64enc::base64encode(png)
  ),
  "pkgdown/favicon/favicon.svg"
)
