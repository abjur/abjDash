mod_processo_server <- function(id, app_data) {
  moduleServer( id, function(input, output, session) {
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

    # cards ----

    output$card_total <- bs4Dash::renderbs4ValueBox({
      val <- dplyr::n_distinct(da()$id)
      val <- scales::number(val, big.mark = ".", decimal.mark = ",")
      bs4Dash::valueBox(
        subtitle = "Quantidade de processos",
        value = tags$p(val, style = "font-size: 2vmax; margin-bottom: 0;"),
        icon = "hashtag",
        status = "primary"
      )
    })

    output$card_resultado <- bs4Dash::renderbs4ValueBox({
      val <- mean(da()$vencedor == "Fisco")
      val <- scales::percent(val, .1)
      bs4Dash::valueBox(
        subtitle = "Proporção de vitórias do fisco",
        value = tags$p(val, style = "font-size: 2vmax; margin-bottom: 0;"),
        icon = "percentage",
        status = "primary"
      )
    })

    output$card_tempo <- bs4Dash::renderbs4ValueBox({
      val <- validar_infobox()
      val <- stats::median(da()$tempo, na.rm = TRUE)
      if (is.na(val)) {
        val <- "<vazio>"
      } else {
        if (val > 100) val <- val / 365.25
        val <- paste(tempo_lab(val))
      }
      bs4Dash::valueBox(
        subtitle = "Tempo mediano at\u00e9 decis\u00e3o",
        value = tags$p(val, style = "font-size: 2vmax; margin-bottom: 0;"),
        icon = "clock",
        status = "primary"
      )
    })

    output$card_pf <- bs4Dash::renderbs4ValueBox({
      val <- mean(da()$pfpj == "Jurídica")
      val <- scales::percent(val, .1)
      bs4Dash::valueBox(
        subtitle = "Proporção de pessoas jurídicas",
        value = tags$p(val, style = "font-size: 2vmax; margin-bottom: 0;"),
        icon = "percentage",
        status = "primary"
      )
    })


    # linha 1 -----------------------------------------------------------------

    output$barras_volume_tempo <- highcharter::renderHighchart({
      validar()
      contagem <- da() %>%
        dplyr::count(ano) %>%
        dplyr::filter(n > 5)
      contagem %>%
        barras(tipo = "column")
    })

    output$barras_desfecho_tempo <- highcharter::renderHighchart({
      validar()
      contagem <- da() %>%
        dplyr::count(ano, vencedor) %>%
        dplyr::group_by(ano) %>%
        dplyr::mutate(prop = n/sum(n)) %>%
        dplyr::ungroup()
      contagem %>%
        barras_prop()
    })


    output$pizza_decisao <- highcharter::renderHighchart({
      validar()
      contagem <- da() %>%
        dplyr::count(vencedor) %>%
        dplyr::mutate(prop = n/sum(n), lab = scales::percent(prop))
      contagem %>%
        pizza()
    })
    output$pizza_unanimidade <- highcharter::renderHighchart({
      validar()
      contagem <- da() %>%
        dplyr::count(votacao) %>%
        dplyr::mutate(prop = n/sum(n), lab = scales::percent(prop))
      contagem %>%
        pizza()
    })


    # linha 2 -----------------------------------------------------------------

    output$tab_tributo <- reactable::renderReactable({
      pct <- reactable::colFormat(percent = TRUE, digits = 1)
      da() %>%
        dplyr::filter(tributos != "NAO INFORMADO") %>%
        dplyr::group_by(tributos) %>%
        dplyr::summarise(
          n = dplyr::n(),
          p_favoravel = mean(vencedor == "Fisco"),
          p_unanimidade = mean(votacao == "Unanimidade")
        ) %>%
        dplyr::arrange(dplyr::desc(n)) %>%
        reactable::reactable(
          columns = list(
            tributos = reactable::colDef("Tributo", minWidth = 400),
            n = reactable::colDef("N"),
            p_favoravel = reactable::colDef("% Pró-fisco", format = pct),
            p_unanimidade = reactable::colDef("% Unânime", format = pct)
          ),
          striped = TRUE,
          compact = TRUE,
          defaultPageSize = 20,
          searchable = TRUE
        )
    })

    output$tab_relator <- reactable::renderReactable({
      set.seed(1)
      pct <- reactable::colFormat(percent = TRUE, digits = 1)
      da() %>%
        dplyr::filter(relator != "<vazio>") %>%
        dplyr::group_by(relator) %>%
        dplyr::summarise(
          n = dplyr::n(),
          p_favoravel = mean(vencedor == "Fisco"),
          p_unanimidade = mean(votacao == "Unanimidade")
        ) %>%
        dplyr::mutate(relator = randomNames::randomNames(
          dplyr::n(),
          sample.with.replacement = FALSE,
          name.order = "first.last",
          name.sep = " "
        )) %>%
        dplyr::arrange(dplyr::desc(n)) %>%
        reactable::reactable(
          columns = list(
            relator = reactable::colDef("Relator(a)", minWidth = 400),
            n = reactable::colDef("N"),
            p_favoravel = reactable::colDef("% Pró-fisco", format = pct),
            p_unanimidade = reactable::colDef("% Unânime", format = pct)
          ),
          striped = TRUE,
          compact = TRUE,
          defaultPageSize = 20,
          searchable = TRUE
        )
    })

    output$tab_atividade <- reactable::renderReactable({
      validar()
      da() %>%
        dplyr::inner_join(bidScrapers::rfb_processos, "cnpj") %>%
        dplyr::left_join(bidScrapers::cnae, "cnae_principal") %>%
        dplyr::mutate(
          dplyr::across(secao:subclasse, tidyr::replace_na, "Sem informa\u00e7\u00e3o"),
          dplyr::across(secao:subclasse, stringr::str_to_sentence)
        ) %>%
        dplyr::group_by(secao, divisao, grupo, classe, subclasse) %>%
        dplyr::summarise(
          n = dplyr::n(),
          prop_fav = mean(vencedor == "Fisco"),
          prop_unam = mean(votacao == "Unanimidade"),
          .groups = "drop"
        ) %>%
        dplyr::mutate(prop = n/sum(n)) %>%
        dplyr::group_by(secao) %>%
        dplyr::mutate(nn = sum(n)) %>%
        dplyr::ungroup() %>%
        dplyr::arrange(dplyr::desc(nn)) %>%
        dplyr::select(-nn) %>%
        dplyr::relocate(prop, .after = n) %>%
        reactable::reactable(
          columns = list(
            secao = reactable::colDef("Se\u00e7\u00e3o", minWidth = 420),
            n = reactable::colDef("N", aggregate = "sum"),
            prop = reactable::colDef(
              "%", aggregate = "sum",
              format = reactable::colFormat(percent = TRUE, digits = 1)
            ),
            prop = reactable::colDef(
              "% da base",
              format = reactable::colFormat(
                percent = TRUE, digits = 1
              ),
              aggregate = "sum"
            ),
            prop_fav = reactable::colDef(
              "% Pró-Fisco",
              format = reactable::colFormat(
                percent = TRUE, digits = 1
              ),
              aggregate = prop_agg("prop_fav"),
            ),
            prop_unam = reactable::colDef(
              "% Un\u00e2nime",
              format = reactable::colFormat(
                percent = TRUE, digits = 1
              ),
              aggregate = prop_agg("prop_unam"),
            ),
            divisao = reactable::colDef("Divis\u00e3o", minWidth = 300),
            grupo = reactable::colDef("Grupo"),
            classe = reactable::colDef("Classe"),
            subclasse = reactable::colDef("Subclasse")
          ),
          groupBy = c("secao", "divisao", "grupo", "classe"),
          compact = TRUE
        )
    })

    output$tab_tipo_pessoa <- reactable::renderReactable({
      validar()
      da() %>%
        dplyr::group_by(pfpj) %>%
        dplyr::summarise(
          n = dplyr::n(),
          prop_fav = mean(vencedor == "Fisco"),
          prop_unam = mean(votacao == "Unanimidade"),
          .groups = "drop"
        ) %>%
        dplyr::mutate(prop = n/sum(n)) %>%
        dplyr::arrange(dplyr::desc(n)) %>%
        dplyr::relocate(prop, .after = n) %>%
        reactable::reactable(
          columns = list(
            pfpj = reactable::colDef("Tipo de pessoa"),
            n = reactable::colDef("N", aggregate = "sum"),
            prop = reactable::colDef(
              "%", aggregate = "sum",
              format = reactable::colFormat(percent = TRUE, digits = 1)
            ),
            prop = reactable::colDef(
              "% da base",
              format = reactable::colFormat(
                percent = TRUE, digits = 1
              ),
              aggregate = "sum"
            ),
            prop_fav = reactable::colDef(
              "% Pró-Fisco",
              format = reactable::colFormat(
                percent = TRUE, digits = 1
              ),
              aggregate = prop_agg("prop_fav"),
            ),
            prop_unam = reactable::colDef(
              "% Un\u00e2nime",
              format = reactable::colFormat(
                percent = TRUE, digits = 1
              ),
              aggregate = prop_agg("prop_unam"),
            )
          ),
          compact = FALSE
        )
    })


  })
}
