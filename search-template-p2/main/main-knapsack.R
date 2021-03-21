# Clear environment
rm(list=ls())
# Set working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load required packages
library(readr)

# Include algorithm functions
source("../algorithms/blind/expand-node.R")
source("../algorithms/informed/hill-climbing-search.R")

# Include functions for data analysis and result plot
source("../algorithms/results-analysis/analyze-results.R")

# Include the problem
source("../problem/knapsack-problem.R")

# Executes hill climbing search and return the results
execute.hill.climbing <- function(filename) {
  # Initialize problem
  problem <- initialize.problem(filename = filename)
  # Execute hill climbing
  return(hill.climbing.search(problem = problem))
}

# Clear console
cat("\014")
graphics.off()

file <- "../data/knapsack-10.txt"

# Execute hill climbing
hill_climbing_1 <- execute.hill.climbing(filename = file)
hill_climbing_2 <- execute.hill.climbing(filename = file)
hill_climbing_3 <- execute.hill.climbing(filename = file)
hill_climbing_4 <- execute.hill.climbing(filename = file)
hill_climbing_5 <- execute.hill.climbing(filename = file)
hill_climbing_6 <- execute.hill.climbing(filename = file)
hill_climbing_7 <- execute.hill.climbing(filename = file)
hill_climbing_8 <- execute.hill.climbing(filename = file)
hill_climbing_9 <- execute.hill.climbing(filename = file)
hill_climbing_10 <- execute.hill.climbing(filename = file)

# Initialize a problem instance for the analysis
problem <- initialize.problem(filename = file)

# Analyze results
local.analyze.results(list(hill_climbing_1, hill_climbing_2, hill_climbing_3, hill_climbing_4, hill_climbing_5, 
                           hill_climbing_6, hill_climbing_7, hill_climbing_8, hill_climbing_9, hill_climbing_10), problem)