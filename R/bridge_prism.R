#' Title
#'
#' @param model_input
#'
#' @return
#' @export
#'
#' @examples
model_run<-function(model_input = NULL)
{
  if(model_input$func=="evpi"){

    results <- evpi         (outputs                        =model_input$outputs,
                             nsim                           =model_input$nsim)

    return(as.list(results))
  }

  if(model_input$func=="evppi"){

    args <- list(outputs                        =model_input$outputs,
                 inputs                         =model_input$inputs,
                 method                         =model_input$method,
                 se                             =model_input$se,
                 B                              =model_input$B,
                 nsim                           =model_input$nsim,
                 verbos                         =model_input$verbos)

    results <- do.call(evppi, c(args, model_input$pars, model_input$etc))

    return(as.list(results))
  }

  if(model_input$func=="evppi_mc"){

    results <- evppi_mc      (model_fn                       =model_input$model_fn,
                              par_fn                         =model_input$par_fn,
                              pars                           =model_input$pars,
                              nouter                         =model_input$nouter,
                              ninner                         =model_input$ninner,
                              wtp                            =model_input$wtp,
                              mfargs                         =model_input$mfargs,
                              verbos                         =model_input$verbos)

    return(as.list(results))
  }

  if(model_input$func=="evsi"){

    args <- list(outputs                        =model_input$outputs,
                 inputs                         =model_input$inputs,
                 study                          =model_input$study,
                 datagen_fn                     =model_input$datagen_fn,
                 pars                           =model_input$pars,
                 n                              =model_input$n,
                 method                         =model_input$method,
                 likelihood                     =model_input$likelihood,
                 analysis_model                 =model_input$analysis_model,
                 analysis_options               =model_input$analysis_options,
                 decision_model                 =model_input$decision_model,
                 Q                              =model_input$Q,
                 npreg_method                   =model_input$npreg_method,
                 nsim                           =model_input$nsim,
                 verbos                         =model_input$verbos)

    results <- do.call(evsi, c(args, model_input$etc))

    return(as.list(results))
  }

  if(model_input$func=="evsivar"){

    args <- list(outputs                       =model_input$outputs,
                inputs                         =model_input$inputs,
                study                          =model_input$study,
                datagen_fn                     =model_input$datagen_fn,
                pars                           =model_input$pars,
                n                              =model_input$n,
                method                         =model_input$method,
                likelihood                     =model_input$likelihood,
                analysis_model                 =model_input$analysis_model,
                analysis_options               =model_input$analysis_options,
                decision_model                 =model_input$decision_model,
                Q                              =model_input$Q,
                npreg_method                   =model_input$npreg_method,
                nsim                           =model_input$nsim,
                verbos                         =model_input$verbos)

    results <- do.call(evsivar, c(args, model_input$etc))

    return(as.list(results))
  }

}

