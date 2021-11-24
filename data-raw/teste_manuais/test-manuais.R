library(magrittr)


# Teste nprop -----------------------------------------------------------------------------------------------------------------------------------

teste_nprop <- obsRJRS::da_processo_tidy %>%
  dplyr::mutate(tamanho = dplyr::case_when(
    litisconsorcio == "Sim" ~ "Litisconsórcio ativo",
    tipo_societario == "EPP" ~ "Pequeno Porte (EPP)",
    tipo_societario == "ME" ~ "Microempresa (ME)",
    TRUE ~ "Médias, grandes e grupos"
  ))
teste_nprop_me <- abjDash::nprop(teste_nprop$tamanho, "Microempresa (ME)")


# Construção  -----------------------------------------------------------------------------------------------------------------------------------

da_teste <- obsMC::da_cvm_tidy %>%
  dplyr::distinct(id_processo, .keep_all = TRUE) %>%
  dplyr::select(id_processo, dplyr::matches("dt|data|psj_dist")) %>%
  dplyr::mutate(dplyr::across(.fns = ~dplyr::if_else(
    as.character(.) == "Não aplicável",
    NA_character_,
    as.character(.)
  ))) %>%
  dplyr::mutate(dplyr::across(-id_processo, as.Date)) %>%
  dplyr::transmute(
    id_processo,
    dt1_fato = acusacao_fato_data1,
    dt2_manif = data_manifestacao,
    dt3_abertura = data_inicial,
    dt4_tacu = dt_dist
  )

intervalos <- list(
  # tempos inicial
  tempo_pas_fato_abertura = c("dt1_fato", "dt3_abertura"),
  tempo_pas_manif_abertura = c("dt2_manif", "dt3_abertura"),
  tempo_pas_abertura_tacu = c("dt3_abertura", "dt4_tacu")

)

# Teste calcular_estatisticas -------------------------------------------------------------------------------------------------------------------
teste_calcular_estatisticas <- intervalos %>%
  purrr::map_dfr(abjDash::calcular_estatisticas, da_teste, .id = "tempo")


# Teste get_median ------------------------------------------------------------------------------------------------------------------------------
med_abertura_tacu <- stringr::str_extract(
  abjDash::get_median(teste_calcular_estatisticas, "abertura_tacu"), "[0-9]+"
)

# Teste calcular_medianas -----------------------------------------------------------------------------------------------------------------------

tab_tempo_stay <- obsRJRS::da_processo_tidy %>%
  dplyr::mutate(data_referencia = data_hora) %>%
  abjDash::calcular_medianas(data_decisao_deferimento, data_agc1, capital)

# Teste barras ----------------------------------------------------------------------------------------------------------------------------------
# Gráfico de barras highcharter
mtcars %>%
  dplyr::count(cyl) %>%
  abjDash::barras()

# Teste barras definindo proporção --------------------------------------------------------------------------------------------------------------

# Gráfico de barras highcharter
mtcars %>%
  dplyr::count(cyl) %>%
  dplyr::mutate(prop = n / sum(n), lab = pct(prop)) %>% # precisa definir proporção.
  abjDash::barras_prop()

# Teste Pizza -----------------------------------------------------------------------------------------------------------------------------------
# Gráfico de Setores highcharter
mtcars %>%
  dplyr::count(cyl) %>%
  dplyr::mutate(prop = n / sum(n), lab = pct(prop)) %>% # precisa definir proporção.
  abjDash::pizza()

# Teste custom_lab ------------------------------------------------------------------------------------------------------------------------------

obsRJRS::da_processo_tidy %>%
  dplyr::filter(
    ativos > 0, passivos > 0,
    passivos < 1e9, ativos > 1e6
  ) %>%
  ggplot2::ggplot(ggplot2::aes(x = ativos, y = passivos)) +
  ggplot2::geom_point() +
  ggplot2::geom_abline(slope = 1, intercept = 0) +
  ggplot2::scale_x_log10(labels = abjDash::custom_lab) +
  ggplot2::scale_y_log10(labels = abjDash::custom_lab) +
  ggplot2::theme_minimal(12) +
  ggplot2::labs(
    x = "Ativo total",
    y = "Passivo total"
  ) +
  ggplot2::coord_fixed()

