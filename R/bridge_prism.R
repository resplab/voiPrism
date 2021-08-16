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
    if (is.null(model_input$se)) {model_input$se <- FALSE}
    if (is.null(model_input$B)) {model_input$B <- 500}
    if (is.null(model_input$verbose)) {model_input$verbose <- FALSE}
    args <- list(outputs                        =model_input$outputs,
                 inputs                         =model_input$inputs,
                 pars                           =model_input$pars,
                 method                         =model_input$method,
                 se                             =model_input$se,
                 B                              =model_input$B,
                 nsim                           =model_input$nsim,
                 verbose                        =model_input$verbose)

    results <- do.call(evppi, c(args, model_input$etc))

    return(as.list(results))
  }

  if(model_input$func=="evppi_mc"){
    if (is.null(model_input$verbose)) {model_input$verbose <- FALSE}
    results <- evppi_mc      (model_fn                       =model_input$model_fn,
                              par_fn                         =model_input$par_fn,
                              pars                           =model_input$pars,
                              nouter                         =model_input$nouter,
                              ninner                         =model_input$ninner,
                              wtp                            =model_input$wtp,
                              mfargs                         =model_input$mfargs,
                              verbose                        =model_input$verbose)

    return(as.list(results))
  }

  if(model_input$func=="evsi"){
    if(is.null(model_input$n)) {model_input$n <- 100}
    if(is.null(model_input$Q)) {model_input$Q<- 30}
    if(is.null(model_input$npreg_method)) {model_input$npreg_method <- "gam"}
    if(is.null(model_input$verbose)) {model_input$verbose <- FALSE}
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
                 verbose                        =model_input$verbose)

    results <- do.call(evsi, c(args, model_input$etc))

    return(as.list(results))
  }

  if(model_input$func=="evsivar"){
    if(is.null(model_input$n)) {model_input$n<- 100}
    if(is.null(model_input$Q)) {model_input$Q <- 30}
    if(is.null(model_input$npreg_method)) {model_input$npreg_method <- "gam"}
    if(is.null(model_input$verbose)) {model_input$verbose <- TRUE}
    args <- list(outputs                       =model_input$outputs,
                 inputs                        =model_input$inputs,
                 study                         =model_input$study,
                 datagen_fn                    =model_input$datagen_fn,
                 pars                          =model_input$pars,
                 n                             =model_input$n,
                 method                        =model_input$method,
                 likelihood                    =model_input$likelihood,
                 analysis_model                =model_input$analysis_model,
                 analysis_options              =model_input$analysis_options,
                 decision_model                =model_input$decision_model,
                 Q                             =model_input$Q,
                 npreg_method                  =model_input$npreg_method,
                 nsim                          =model_input$nsim,
                 verbose                       =model_input$verbose)
    results <- do.call(evsivar, c(args, model_input$etc))

    return(as.list(results))
  }

}
