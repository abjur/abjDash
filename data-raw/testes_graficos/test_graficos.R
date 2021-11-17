# Teste barras ----------------------------------------------------------------------------------------------------------------------------------
mtcars %>%
  dplyr::count(cyl) %>%
  abjDash::barras()

# Teste barras definindo proporção --------------------------------------------------------------------------------------------------------------

mtcars %>%
  dplyr::count(cyl) %>%
  dplyr::mutate(prop = n / sum(n), lab = pct(prop)) %>%
  abjDash::barras_prop()


# Teste barras empilhadas  ----------------------------------------------------------------------------------------------------------------------

#barras_empilhadas
#custom_lab
#grafico_km
#grafico_km2
#histograma
#mapa_tematico
#pizza
