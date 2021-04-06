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

##########################################  GENERAL SETTINGS   ##########################################
file <- "../data/knapsack-5.txt"                                                                        #
iterations <- 15                                                                                     #
#########################################################################################################


#########################################################################################################
#                                             HILL CLIMBING                                             #
#########################################################################################################

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

# Execute Hill Climbing N times
hill_climbings <- list()
for (i in 1:iterations) {
  hill_climbings[[i]] <- execute.hill.climbing(filename = file)
}


# Initialize a problem instance for the analysis
problem <- initialize.problem(filename = file)

# Analyze results
analisis_hill_climbing <- local.analyze.results(hill_climbings, problem)
print(analisis_hill_climbing)

# Media y desvicion estandar del tiempo y el coste
print(paste0("La media de tiempo es [Hill Climbing] -> ", mean(as.numeric(analisis_hill_climbing[[2]])) , " segundos" ))
print(paste0("La media del coste es [Hill Climbing] -> ", mean(as.numeric(analisis_hill_climbing[[3]])) ))

print(paste0("La desviacion estandar del tiempo es [Hill Climbing] -> ", sd(analisis_hill_climbing[[2]]) , " segundos" ))
print(paste0("La desviacion estandar del coste es [Hill Climbing] -> ", sd(analisis_hill_climbing[[3]]) ))


#########################################################################################################
#                                      RANDOM RESTART HILL CLIMBING                                     #
#########################################################################################################

# Executes random restart hill climbing search and return the results
execute.random.restart.hill.climbing <- function(filename) {
  problem <- initialize.problem(filename)
  # Execute random restart hill climbing
  return(random.restart.hill.climbing(problem, iterations = 7,max_iterations = 1000, count_print = 50,filename = filename))
}

# Clear console
cat("\014")
graphics.off()

# Execute Random Restart HC N times
random_restarts <- list()
for (i in 1:iterations) {
  random_restarts[[i]] <- execute.random.restart.hill.climbing(filename = file)
}

# Initialize a problem instance for the analysis
problem <- initialize.problem(filename = file)

# Analyze results
analisis_restart <- local.analyze.results(random_restarts, problem)
print(analisis_restart)

# Media y desvicion estandar del tiempo y el coste
print(paste0("La media de tiempo es [Random Restart HC] -> ", mean(as.numeric(analisis_restart[[2]])) , " segundos" ))
print(paste0("La media del coste es [Random Restart HC] -> ", mean(as.numeric(analisis_restart[[3]])) ))

print(paste0("La desviacion estandar del tiempo es [Random Restart HC] -> ", sd(analisis_restart[[2]]) , " segundos" ))
print(paste0("La desviacion estandar del coste es [Random Restart HC] -> ", sd(analisis_restart[[3]]) ))

#########################################################################################################
#                                           LOCAL BEAM SEARCH                                           #
#########################################################################################################

# Executes local beam search and return the results (Beams = 3)
execute.local.beam.search <- function(filename, beams) {
  problem <- initialize.problem(filename)
  # Execute local beam search
  return(local.beam.search(problem,max_iterations = 100, count_print = 50,beams = beams,filename = filename))
}

# Clear console
cat("\014")
graphics.off()

# Execute Local Beam Search with different Beams N times 
local_beams_b3 <- list()
local_beams_b5 <- list()
local_beams_b10 <- list()
for (i in 1:iterations) {
  local_beams_b3[[i]] <- execute.local.beam.search(filename = file, beams = 3)
  local_beams_b5[[i]] <- execute.local.beam.search(filename = file, beams = 5)
  local_beams_b10[[i]] <- execute.local.beam.search(filename = file, beams = 10)
}

# Initialize a problem instance for the analysis
problem <- initialize.problem(filename = file)

# Analyze results
analisis_b3 <- local.analyze.results(local_beams_b3, problem)
analisis_b5 <- local.analyze.results(local_beams_b5, problem)
analisis_b10 <- local.analyze.results(local_beams_b10, problem)
print(analisis_b3)
print(analisis_b5)
print(analisis_b10)

# Media y desvicion estandar del tiempo y el coste
print(paste0("La media de tiempo es [Beams = 3] -> ", mean(as.numeric(analisis_b3[[2]])) , " segundos" ))
print(paste0("La media del coste es [Beams = 3] -> ", mean(as.numeric(analisis_b3[[3]])) ))
print(paste0("La media de tiempo es [Beams = 5] -> ", mean(as.numeric(analisis_b5[[2]])) , " segundos" ))
print(paste0("La media del coste es [Beams = 5] -> ", mean(as.numeric(analisis_b5[[3]])) ))
print(paste0("La media de tiempo es [Beams = 10] -> ", mean(as.numeric(analisis_b10[[2]])) , " segundos" ))
print(paste0("La media del coste es [Beams = 10] -> ", mean(as.numeric(analisis_b10[[3]])) ))

print(paste0("La desviacion estandar del tiempo es [Beams = 3] -> ", sd(analisis_b3[[2]]) , " segundos" ))
print(paste0("La desviacion estandar del coste es [Beams = 3] -> ", sd(analisis_b3[[3]]) ))
print(paste0("La desviacion estandar del tiempo es [Beams = 5] -> ", sd(analisis_b5[[2]]) , " segundos" ))
print(paste0("La desviacion estandar del coste es [Beams = 5] -> ", sd(analisis_b5[[3]]) ))
print(paste0("La desviacion estandar del tiempo es [Beams = 10] -> ", sd(analisis_b10[[2]]) , " segundos" ))
print(paste0("La desviacion estandar del coste es [Beams = 10] -> ", sd(analisis_b10[[3]]) ))

