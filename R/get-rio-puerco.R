
library(arcgislayers)
library(here)
library(sf)
library(tidyverse)

gpkg <- here("data", "rio-puerco.gpkg")

bb8 <- read_sf(
  dsn = gpkg,
  layer = "survey"
) |> st_buffer(1350)

nhd <- file.path(
  "https://hydro.nationalmap.gov/arcgis/rest/services",
  "NHDPlus_HR",
  "MapServer"
) |> arc_open()

rio_puerco <- nhd |> 
  get_layer(3) |> 
  arc_select(
    fields = c("gnis_id", "gnis_name"),
    filter_geom = st_bbox(bb8),
    where = "gnis_name = 'Rio Puerco'"
  ) |> 
  rename_with(str_to_lower) |> 
  rename_with(str_remove, pattern = "gnis_") |> 
  st_transform(st_crs(bb8))

write_sf(
  rio_puerco,
  dsn = gpkg,
  layer = "rio puerco"
)