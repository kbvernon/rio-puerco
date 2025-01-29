
library(here)
library(sf)
library(terra)

survey_area <- read_sf(
  dsn = here("data", "rio-puerco.gpkg"),
  layer = "survey"
) |> st_buffer(1350)

# location of the virtual raster pointing to the
# USGS one arc second elevation data (~30 m resolution)
elevation_source <- file.path(
  "https://prd-tnm.s3.amazonaws.com/StagedProducts",
  "Elevation/1/TIFF",
  "USGS_Seamless_DEM_1.vrt"
)

# connect to vrt
rr <- rast(elevation_source, vsi = TRUE)

feature <- vect(survey_area) |> 
  project(crs(rr)) |> 
  ext() |> 
  vect(crs = crs(rr))

rr <- crop(
  rr,
  feature,
  snap = "out",
  mask = TRUE,
  filename = tempfile(fileext = ".tif"),
  datatype = "FLT4S",
  gdal = c("COMPRESS=DEFLATE", "ZLEVEL=9"),
  overwrite = TRUE
)

template <- rast(
  ext(st_bbox(survey_area)),
  res = c(30, 30),
  crs = crs(vect(survey_area))
)

project(
  rr,
  template,
  filename = here("data", "elevation.tif"),
  overwrite = TRUE
)
