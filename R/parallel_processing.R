#' Perform parallel processing
#'
#' This function applies a given function to data in parallel.
#'
#' @param func The function to apply.
#' @param data The data to process.
#' @param cores The number of cores to use (default is 2).
#' @return The result of the parallel computation.
#' @export
parallel_process <- function(func, data, cores = 2) {
  future::plan(future::multiprocess, workers = cores)
  result <- furrr::future_map(data, func)
  return(result)
}