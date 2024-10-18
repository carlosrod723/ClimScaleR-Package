#' Downscale climate data
#'
#' This function downscales climate model simulations to a finer resolution.
#'
#' @param data A raster object containing climate data.
#' @param resolution Character string specifying the target resolution (e.g., "1km").
#' @return A raster object with downscaled climate data.
#' @export
downscale_data <- function(data, resolution) {
  # Convert resolution to numeric (assuming km)
  res_num <- as.numeric(sub("km", "", resolution))
  
  # Resample the raster to the new resolution
  downscaled <- raster::resample(data, raster::disaggregate(data, fact=res_num))
  
  return(downscaled)
}
