# Clear environment
rm(list=ls())
# Set working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load required packages
library(readr)

# Include algorithm functions
source("../algorithms/blind/expand-node.R")
source("../algorithms/informed/hill-climbing-search.R")
source("../algorithms/informed/random-restart-hill-climbing.R")
source("../algorithms/informed/local-beam-search.R")

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

# ------------------------------------------- RANDOM RESTART HILL CLIMBING ---------------------------------------------------------------------------

# Executes hill climbing search and return the results
execute.random.restart.hill.climbing <- function(filename) {
  problem <- initialize.problem(filename)
  # Execute hill climbing
  return(random.restart.hill.climbing(problem, iterations = 7,max_iterations = 1000, count_print = 50,filename = filename))
}

file <- "../data/knapsack-10.txt"

random_restart_1 <- execute.random.restart.hill.climbing(filename = file)
random_restart_2 <- execute.random.restart.hill.climbing(filename = file)
random_restart_3 <- execute.random.restart.hill.climbing(filename = file)
random_restart_4 <- execute.random.restart.hill.climbing(filename = file)
random_restart_5 <- execute.random.restart.hill.climbing(filename = file)
random_restart_6 <- execute.random.restart.hill.climbing(filename = file)
random_restart_7 <- execute.random.restart.hill.climbing(filename = file)
random_restart_8 <- execute.random.restart.hill.climbing(filename = file)
random_restart_9 <- execute.random.restart.hill.climbing(filename = file)
random_restart_10 <- execute.random.restart.hill.climbing(filename = file)

# Initialize a problem instance for the analysis
problem <- initialize.problem(filename = file)

# Analyze results
local.analyze.results(list(random_restart_1,random_restart_2,random_restart_3,random_restart_4,random_restart_5,
                           random_restart_6,random_restart_7,random_restart_8,random_restart_9,random_restart_10),problem)

