app_server <- function( input, output, session ) {

  shiny::observe({
    shinyalert::shinyalert(
      "Dashboard Tributário",
      text = shiny::tagList(
        "Seja bem vindo ao dashboard sobre Contencioso Tributário Administrativo. Neste aplicativo, voc\u00ea",
        " pode acessar an\u00e1lises sobre processos administrativos.",
        "Acesse os filtros no",
        shiny::strong("menu lateral"),
        " para especificar as an\u00e1lises.",
        "\n",
        "Se encontrar algum problema, envie um e-mail para",
        shiny::a(href = "mailto:contato@abj.org.br", "contato@abj.org.br"),
        "."
      ),
      closeOnClickOutside = TRUE,
      closeOnEsc = TRUE,
      showConfirmButton = FALSE,
      imageUrl = "https://abj.org.br/assets/logo-home.png",
      html = TRUE,
      size = "m",
      imageWidth = 300
    )
  })


  carregar_base <- shiny::reactive({
    input$executar
    # browser()
    getdata(input$fonte)
  })

  shiny::observeEvent(input$fonte, {
    shiny::isolate({
      purrr::imap(variaveis_cat(), ~{
        op <- as.character(unique(carregar_base()[[.x]]))
        shinyWidgets::updatePickerInput(
          session,
          .x, .y,
          choices = op,
          selected = op
        )
      })
    })
  })

  app_data <- shiny::reactive({

    input$executar

    shiny::isolate({
      da_filtrado <- purrr::reduce(variaveis_cat(), ~{
        if (length(input[[.y]]) > 0) {
          dplyr::filter(.x, .data[[.y]] %in% input[[.y]])
        } else {
          .x
        }
      }, .init = carregar_base())
    })

    list(
      processo = da_filtrado
    )

  })

  mod_processo_server("processo_ui_1", app_data)
  mod_pgfn_server("pgfn_ui")

}
