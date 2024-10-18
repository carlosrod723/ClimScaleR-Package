test_that("downscale_data works correctly", {
  # Create a sample raster
  r <- raster::raster(nrows=10, ncols=10, xmn=0, xmx=10, ymn=0, ymx=10)
  r[] <- 1:100
  
  # Downscale the raster
  downscaled <- downscale_data(r, "2km")
  
  # Check that the resolution has changed
  expect_equal(raster::res(downscaled), c(0.5, 0.5))
  
  # Check that the extent remains the same
  expect_equal(raster::extent(downscaled), raster::extent(r))
})
