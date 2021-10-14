#' psj Server Functions
#'
#' @noRd
mod_processo_server <- function(id, app_data){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # reactives ----
    da <- shiny::reactive({
      app_data()$processo
    })

    validar <- shiny::reactive({
      shiny::validate(shiny::need(
        nrow(da()) > 0,
        "N\u00e3o foi poss\u00edvel gerar a visualiza\u00e7\u00e3o com os par\u00e2metros selecionados."
      ))
    })
    validar_infobox <- shiny::reactive({
      shiny::need(nrow(da()) > 0, "<vazio>")
    })

    # infobox ----


  })
}

