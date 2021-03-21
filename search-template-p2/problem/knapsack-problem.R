# This function must return a list with the information needed to solve the problem.
# (Depending on the problem, it should receive or not parameters)
initialize.problem <- function(filename = "../data/Knapsack-5.txt") {
  problem <- list() # Default value is an empty list.

  # Number of items
  problem$num_items     <- as.numeric(read_lines(filename, skip = 0, n_max = 1))
  # Maximum weight
  problem$max_weight    <- as.numeric(read_lines(filename, skip = 1, n_max = 1))
  # dataframe of items (value, weight)
  problem$items         <- read.table(file = filename, sep = " ", skip = 2)
  names(problem$items)  <- c("value", "weight")
  
  # This attributes are compulsory
  problem$name          <- paste0("Knapsack - items=", problem$num_items, 
                                              ", max.weight=", problem$max_weight)
  # Initial state is a random vector of 0 and 1. 
  # Each position corresponds to one item. It indicates whether it is added to the knapsack
  repeat {
    problem$state_initial <- as.numeric(runif(problem$num_items) > 0.6)
    if (get.knapsack.weight(problem$state_initial, problem) <= problem$max_weight) {
      break
    }
  }
  # In this problem final state is unknown
  problem$state_final <- NULL
  
  # Action is: Changing the "purchase" value of a pizza
  problem$actions_possible <- data.frame(action = c(1:problem$num_items), stringsAsFactors = FALSE)
  
  return(problem)
}

# Analyzes if an action can be applied in the received state.
is.applicable <- function (state, action, problem) {
  new_state <- state
  # Change the value (1 to 0 | 0 to 1) of the position defined by the action.
  new_state[action] <- !new_state[action]
  # The new weight of the knapsack is compared with the maximum weight.
  return(get.knapsack.weight(new_state, problem) <= problem$max_weight)
}

# Returns the state resulting on applying the action over the state
effect <- function (state, action, problem) {
  new_state <- state
  # Change the value (1 to 0 | 0 to 1) of the position defined by the action
  new_state[action] <- !new_state[action]
  
  return(new_state)
}

# Analyzes if a state is final or not
is.final.state <- function (state, final_satate, problem) {
  return(TRUE)
}

# Transforms a state into a string
to.string = function (state, problem) {
    print(paste0("Value=", get.knapsack.value(state, problem), 
                 " / Weight=", get.knapsack.weight(state, problem),
                 " / Max_Weight= ", problem$max_weight), quote = FALSE)
}

# Returns the cost the state
get.cost <- function (state, problem) {
  return(get.knapsack.value(state, problem))
}

# Heuristic function used by Informed Search Algorithms
get.evaluation <- function(state, problem) {
  return(abs(problem$max_weight - get.knapsack.weight(state, problem)))
}

# Calculate the weight of the items added to the knapsack.
get.knapsack.weight <- function(state, problem) {
  return(sum(state * problem$items$weight))
}

# Calculate the value of the items added to the knapsack.
get.knapsack.value <- function(state, problem) {
  return(sum(state * problem$items$value))
}