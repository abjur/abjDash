library(testthat)
library(abjDash)

test_check("abjDash")

covr::package_coverage(exclusions = c("R/barras_empilhadas.R",
                                      "R/barras_prop.R",
                                      "R/barras.R",
                                      "R/calcular_estatisticas.R",
                                      "R/calcular_medianas.R",
                                      "R/create_theme_css.R",
                                      "R/custom_lab.R",
                                      "R/get_median.R",
                                      "R/grafico_km.R",
                                      "R/grafico_km2.R",
                                      "R/histograma.R",
                                      "R/mapa_tematico.R",
                                      "R/picker_options.R",
                                      "R/pizza.R",
                                      "R/prop_agg.R",
                                      "R/status_para_cor.R",
                                      "R/template_app_server.R",
                                      "R/template_mod_server.R",
                                      "R/template_mod_ui.R"))
