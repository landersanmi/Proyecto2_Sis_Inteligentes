random.restart.hill.climbing = function(problem, 
                                        iterations, 
                                        max_iterations = 1000, 
                                        count_print = 100, 
                                        trace = FALSE, filename) {
  
  
  name_method      <- paste0("Random Restart Hill Climbing Search")
  state_initial    <- problem$state_initial 
  actions_possible <- problem$actions_possible
  
  # Get Start time
  start_time       <- Sys.time()
  
  #  Lista donde se almacena el mejor resultado temporal
  best_temp_result <- list(parent = c(),
                          state = state_initial,
                          actions = c(),
                          depth = 1,
                          cost = get.cost(state = state_initial, problem = problem),
                          evaluation = get.evaluation(state_initial, problem))
  
  limite <- 0
  iteraciones <- 0
  
  # Initialization of information for further analysis
  report <- data.frame(iteration = numeric(),
                       nodes_frontier = numeric(),
                       depth_of_expanded = numeric(),
                       nodes_added_frontier = numeric())

  
  while (limite <= iterations) {
    
    report <- rbind(report, data.frame(iteration = iteraciones,
                                       nodes_frontier = 1,
                                       depth_of_expanded = best_temp_result$depth,
                                       nodes_added_frontier = 1))
    
    problem <- initialize.problem(filename) 
    
    # Ejecutar Hill Climbing Search
    result_temp <- hill.climbing.search(problem,
                                      max_iterations = max_iterations,
                                      count_print = count_print, 
                                      trace = trace 
    )
    
    #print("temp")
    #print(get.knapsack.value(result_temp$state_final$state, problem))
    #print("best")
    #print(get.knapsack.value(best_temp_result$state, problem))
    
    # Si la evaluacion del resultado temporal es superior a la almacenada como mejor temporal, esta misma se actualizara
    if( get.knapsack.value(result_temp$state_final$state, problem) >= get.knapsack.value(best_temp_result$state, problem)){
      best_temp_result <- result_temp$state_final
    }

    limite <- limite + 1
  }
  

  # Get runtime
  end_time <- Sys.time()
  
  result <- list()
  result$name        <- name_method
  result$runtime     <- end_time - start_time
  result$state_final <- best_temp_result
  result$report      <- report
  
  
  return(result)
}

