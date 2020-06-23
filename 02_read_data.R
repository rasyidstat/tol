library(jsonlite)
library(tidyverse)
library(lubridate)
library(sf)
library(rvest)
library(mapview)

test <- read_sf(paste0("data/", "tol_operasi_230120.geojson") )

mapview(test)

tl <- list(
  name = c(
    "bakauheni_terbanggi_211116.geojson",
    "gerbang_tol_indonesia.geojson",
    "gt_261219.geojson",
    "tol_kontruksi_230120.geojson",
    "tol_operasi_230120.geojson"
  )
)


