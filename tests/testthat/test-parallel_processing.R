test_that("parallel_process works correctly", {
  # Define a simple function to square numbers
  square <- function(x) x^2
  
  # Create some test data
  data <- 1:10
  
  # Run the parallel process
  result <- parallel_process(square, data)
  
  # Check that the result is correct
  expect_equal(result, lapply(data, square))
})