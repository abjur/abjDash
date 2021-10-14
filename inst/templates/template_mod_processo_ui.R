#' processo UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
mod_processo_ui <- function(id){
  ns <- NS(id)
  tagList(

    # infobox ----
    shiny::fluidRow(
      col_3(bs4Dash::bs4ValueBoxOutput(ns("total"), width = 12)),
      col_3(bs4Dash::bs4ValueBoxOutput(ns("deferimento"), width = 12)),
      col_3(bs4Dash::bs4ValueBoxOutput(ns("aprovacao"), width = 12)),
      col_3(bs4Dash::bs4ValueBoxOutput(ns("cumprimento"), width = 12))
    )#,

    # primeira linha ----
    # segunda linha ----
    # terceira linha ----

  )
}

