random.restart.hill.climbing = function(problem, 
                                        iterations, 
                                        max_iterations = 1000, 
                                        count_print = 100, 
                                        trace = FALSE, filename) {
  # Get Start time
  start_time       <- Sys.time()
  
  state_initial    <- problem$state_initial 
  actions_possible <- problem$actions_possible
  
  #  Lista donde se almacena el mejor resultado temporal
  best_temp_result <- list(parent = c(),
                          state = state_initial,
                          actions = c(),
                          depth = 1,
                          cost = get.cost(state = state_initial, problem = problem),
                          evaluation = get.evaluation(state_initial, problem))
  
  # Initialization of information for further analysis
  report <- data.frame(iteration = numeric(),
                       nodes_frontier = numeric(),
                       depth_of_expanded = numeric(),
                       nodes_added_frontier = numeric())
  limite <- 0
  iteraciones <- 0
  
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
    
    # Si la evaluación del resultado temporal es superior a la almacenada como mejor temporal, esta misma se actualizara
    if(result_temp$state_final$evaluation <= best_temp_result$evaluation){
      best_temp_result <- result_temp$state_final
    }
    
    #Comprobar si el best_temp_result es estado final
    if((is.final.state(best_temp_result$state, best_temp_result$state_final, problem))){
      break
    }
    else{
      limite <- limite + 1
    }
    
  }
  
  
  
  # Get runtime
  end_time <- Sys.time()
  
  result <- list()
  result$name        <- paste0("Random Restart Hill Climbing:")
  result$runtime     <- end_time - start_time
  result$state_final <- best_temp_result
  result$report      <- report
  
  
  return(result)
}