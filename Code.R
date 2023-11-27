library(shinylive)
library(plumber)

# app_dir <- system.file("examples", "01_hello", package = "shiny")
# out_dir <- tempfile("shinylive-export")
# shinylive::export(app_dir = "myapp", output_dir = "docs")
app_dir <- "myapp"
fs::is_dir(app_dir)
out_dir <- "docs"

export(app_dir, out_dir)
httpuv::runStaticServer("docs/", port=8008)