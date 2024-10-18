test_that("convert_format works correctly", {
  # Create a sample sf object
  p1 <- sf::st_point(c(0,0))
  p2 <- sf::st_point(c(1,1))
  sfc <- sf::st_sfc(p1, p2)
  sf_obj <- sf::st_sf(geometry = sfc)
  
  # Convert to GeoJSON
  geojson_file <- convert_format(sf_obj, from = "shapefile", to = "geojson")
  
  # Check that the output is a GeoJSON file
  expect_true(grepl("\\.geojson$", geojson_file))
  
  # Check that the file exists
  expect_true(file.exists(geojson_file))
})
