#' Convert spatial data format
#'
#' This function converts between different spatial data formats.
#'
#' @param data The spatial data to be converted.
#' @param from Character string specifying the input format.
#' @param to Character string specifying the output format.
#' @return The converted spatial data.
#' @export
convert_format <- function(data, from, to) {
  if (from == "shapefile" && to == "geojson") {
    converted <- sf::st_write(sf::st_read(data), dsn = tempfile(fileext = ".geojson"), driver = "GeoJSON")
  } else if (from == "geojson" && to == "shapefile") {
    converted <- sf::st_write(sf::st_read(data), dsn = tempfile(fileext = ".shp"), driver = "ESRI Shapefile")
  } else {
    stop("Unsupported conversion")
  }
  
  return(converted)
}
