#' Title
#'
#' @param model_input
#'
#' @return
#' @export
#'
#' @examples
model_run<-function(model_input = NULL, method)
{
  if(method=="evpi"){
    input<-unflatten_list(model_input)

    results <- evpi         (outputs                        =model_input$outputs,
                             nsim                           =model_input$nsim)

    return(as.list(results))
  }

  if(method=="evppi"){
    input<-unflatten_list(model_input)

    results <- evppi         (outputs                        =model_input$outputs,
                              inputs                         =model_input$inputs,
                              pars                           =model_input$pars,
                              method                         =model_input$method,
                              se                             =model_input$se,
                              B                              =model_input$B,
                              nsim                           =model_input$nsim,
                              verbos                         =model_input$verbos,
                              ...)

    return(as.list(results))
  }

  if(method=="evppi_mc"){
    input<-unflatten_list(model_input)

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

  if(method=="evsi"){
    input<-unflatten_list(model_input)

    results <- evsi          (outputs                        =model_input$outputs,
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
                              verbos                         =model_input$verbos,
                              ...)

    return(as.list(results))
  }

  if(method=="evsivar"){
    input<-unflatten_list(model_input)

    results <- evsivar       (outputs                        =model_input$outputs,
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
                              verbos                         =model_input$verbos,
                              ...)

    return(as.list(results))
  }

}

#Gets a hierarchical named list and flattens it; updating names accordingly
unflatten_list<-function(lst)
{
  if(is.null(lst)) return(lst)
  out<-list()

  nms<-names(lst)

  for(nm in nms)
  {
    path<-paste(strsplit(nm,'.',fixed=T)[[1]],sep="$")
    eval(parse(text=paste("out$",paste(path,collapse="$"),"<-lst[[nm]]",sep="")))
  }

  return(out)
}
