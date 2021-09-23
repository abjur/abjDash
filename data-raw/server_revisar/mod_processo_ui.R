#' processo UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
mod_processo_ui <- function(id){
  ns <- shiny::NS(id)
  shiny::tagList(

    # infobox ----
    shiny::fluidRow(
      col_3(bs4Dash::bs4ValueBoxOutput(ns("card_total"), width = 12)),
      col_3(bs4Dash::bs4ValueBoxOutput(ns("card_resultado"), width = 12)),
      col_3(bs4Dash::bs4ValueBoxOutput(ns("card_tempo"), width = 12)),
      col_3(bs4Dash::bs4ValueBoxOutput(ns("card_pf"), width = 12))
    ),
    # primeira linha ----
    shiny::fluidRow(

      bs4Dash::tabBox(
        width = 6,
        collapsible = FALSE,
        closable = FALSE,
        id = ns("notempo"),
        title = "Decisões no tempo",

        bs4Dash::tabPanel(
          tabName = "Volume",
          highcharter::highchartOutput(ns("barras_volume_tempo"))
        ),
        bs4Dash::tabPanel(
          tabName = "Desfechos",
          highcharter::highchartOutput(ns("barras_desfecho_tempo"))
        )

      ),

      bs4Dash::tabBox(
        width = 6,
        collapsible = FALSE,
        closable = FALSE,
        id = ns("notempo"),
        title = "Desfechos",
        bs4Dash::tabPanel(
          tabName = "Proporção",
          highcharter::highchartOutput(ns("pizza_decisao"))
        ),
        bs4Dash::tabPanel(
          tabName = "Unanimidade",
          highcharter::highchartOutput(ns("pizza_unanimidade"))
        )
      )
    ),

    # segunda linha ----
    shiny::fluidRow(

      bs4Dash::box(
        width = 6,
        collapsible = FALSE,
        closable = FALSE,
        id = ns("tributo"),
        title = "Tributos",
        reactable::reactableOutput(ns("tab_tributo"))
      ),
      bs4Dash::box(
        width = 6,
        collapsible = FALSE,
        closable = FALSE,
        id = ns("relator"),
        title = "Relatores",
        reactable::reactableOutput(ns("tab_relator"))
      )
    ),

    # terceira linha ----
    shiny::fluidRow(
      bs4Dash::tabBox(
        width = 12,
        collapsible = FALSE,
        closable = FALSE,
        id = ns("partes"),
        title = "Partes",
        bs4Dash::tabPanel(
          tabName = "Atividade",
          reactable::reactableOutput(ns("tab_atividade"))
        ),
        bs4Dash::tabPanel(
          tabName = "Tipo de pessoa",
          reactable::reactableOutput(ns("tab_tipo_pessoa"))
        )
      )
    )

  )
}
