library(jsonlite)
library(tidyverse)
library(lubridate)
library(sf)
library(rvest)

url <- "http://gis.bpjt.pu.go.id/data/"
bpjt_list <- read_html(url)
bpjt_list <- bpjt_list %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  as_tibble() %>%
  rename(filename = value) %>%
  filter(grepl("geojson", filename)) %>%
  mutate(link = paste0(url, filename))

download_bpjt_list <- function(filename) {
  if (!file.exists(paste0("data/", filename)) ) {
    download.file(paste0(url, filename), paste0("data/", filename))
  }
}

# download all file
bpjt_list$filename %>%
  map(download_bpjt_list)
