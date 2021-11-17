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


#barras_empilhadas
#grafico_km
#grafico_km2
#histograma
#mapa_tematico
