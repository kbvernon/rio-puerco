
library(FedData)
library(here)
library(sf)
library(tidyverse)
library(tigris)

gpkg <- here("data", "rio-puerco.gpkg")

chaco <- get_padus(
  "Chaco Culture National Historical Park",
  label = "chaco"
)[["Manager_Name"]] |> 
  mutate(name = "Chaco Canyon") |> 
  select(name) |> 
  group_by(name) |> 
  summarize() |> 
  st_transform(26913)

cities <- places("New Mexico", cb = TRUE) |> 
  rename_with(str_to_lower) |> 
  filter(name %in% c("Albuquerque", "Santa Fe")) |> 
  select(name) |> 
  st_transform(26913)

st_geometry(cities) <- "geom"

chaco |> 
  bind_rows(cities) |> 
  write_sf(dsn = gpkg, layer = "places")
