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

# Executes random restart hill climbing search and return the results
execute.random.restart.hill.climbing <- function(filename) {
  problem <- initialize.problem(filename)
  # Execute random restart hill climbing
  return(random.restart.hill.climbing(problem, iterations = 7,max_iterations = 1000, count_print = 50,filename = filename))
}

# Clear console
cat("\014")
graphics.off()

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

# ------------------------------------------- LOCAL BEAM SEARCH ---------------------------------------------------------------------------

# Executes local beam search and return the results (Beams = 3)
execute.local.beam.search.b3 <- function(filename) {
  problem <- initialize.problem(filename)
  # Execute local beam search
  return(local.beam.search(problem,max_iterations = 100, count_print = 50,beams = 3,filename = filename))
}

# Executes local beam search and return the results (Beams = 5)
execute.local.beam.search.b5 <- function(filename) {
  problem <- initialize.problem(filename)
  # Execute local beam search
  return(local.beam.search(problem,max_iterations = 100, count_print = 50,beams = 5,filename = filename))
}

# Executes local beam search and return the results (Beams = 10)
execute.local.beam.search.b10 <- function(filename) {
  problem <- initialize.problem(filename)
  # Execute local beam search
  return(local.beam.search(problem,max_iterations = 100, count_print = 50,beams = 10,filename = filename))
}

# Clear console
cat("\014")
graphics.off()

file <- "../data/knapsack-10.txt"

local_beam_b3_1 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_2 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_3 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_4 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_5 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_6 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_7 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_8 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_9 <- execute.local.beam.search.b3(filename = file)
local_beam_b3_10 <- execute.local.beam.search.b3(filename = file)

local_beam_b5_1 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_2 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_3 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_4 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_5 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_6 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_7 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_8 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_9 <- execute.local.beam.search.b5(filename = file)
local_beam_b5_10 <- execute.local.beam.search.b5(filename = file)

local_beam_b10_1 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_2 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_3 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_4 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_5 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_6 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_7 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_8 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_9 <- execute.local.beam.search.b10(filename = file)
local_beam_b10_10 <- execute.local.beam.search.b10(filename = file)


# Initialize a problem instance for the analysis
problem <- initialize.problem(filename = file)

# Analyze results
analisis1 <- local.analyze.results(list(local_beam_b3_1,local_beam_b3_2,local_beam_b3_3,local_beam_b3_4,local_beam_b3_5,
                           local_beam_b3_6,local_beam_b3_7,local_beam_b3_8,local_beam_b3_9,local_beam_b3_10),problem)

analisis2 <- local.analyze.results(list(local_beam_b5_1,local_beam_b5_2,local_beam_b5_3,local_beam_b5_4,local_beam_b5_5,
                           local_beam_b5_6,local_beam_b5_7,local_beam_b5_8,local_beam_b5_9,local_beam_b5_10),problem)

analisis3 <- local.analyze.results(list(local_beam_b10_1,local_beam_b10_2,local_beam_b10_3,local_beam_b10_4,local_beam_b10_5,
                           local_beam_b10_6,local_beam_b10_7,local_beam_b10_8,local_beam_b10_9,local_beam_b10_10),problem)

print(analisis3[2])
#analyze.media_desviacion(analisis3)
mediaTiempo <- 0.0
mediaCoste <- 0.0
desviacionTiempo <- 0.0
desviacionCoste <- 0.0


for (i in 1:nrow(analisis3)) {
  print(round(analisis3[[2]][i], digits = 2))
  mediaTiempo <- mediaTiempo + round(analisis3[[2]][i], digits = 2)
}
mediaTiempo <- mediaTiempo / nrow(analisis3)
print(mediaTiempo)

