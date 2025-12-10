#' ---
#' title: "Storm mapping with rnaturalearth and sf"
#' ---

library(rnaturalearth)
library(rnaturalearthdata)
library(sf)

# Get world countries (filled polygons instead of just coastlines)
world <- ne_countries(scale = "medium", returnclass = "sf")

# Read storms data
storms <- st_read(system.file("shape/storms_xyz.shp", package = "sf"))

# Create the map with blue ocean and peachpuff filled continents
plot(
  st_geometry(world),
  col = "peachpuff",
  border = "gray50",
  lwd = 0.5,
  xlim = c(-110, 5),
  ylim = c(8, 60),
  main = "Atlantic Storm Tracks",
  xaxs = "i",
  yaxs = "i",
  axes = TRUE,
  graticule = TRUE,
  bg = "#87CEEB"
) # light blue for ocean

# Add storm tracks on top
plot(
  st_geometry(storms),
  col = hcl.colors(71, "Spectral", alpha = 0.7),
  lwd = 2,
  add = TRUE
)
