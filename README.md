
<!-- README.md is generated from README.Rmd. Please edit that file -->

# abjDash

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/katerine-dev/abjDash/branch/master/graph/badge.svg?token=JKAO8JGEHX)](https://codecov.io/gh/katerine-dev/abjDash)
[![update-tests](https://github.com/abjur/abjDash/workflows/update-tests/badge.svg)](https://github.com/abjur/abjDash/actions)
<!-- badges: end -->

### Utilidades ABJ

Pacote de desenvolvimento de ferramentas essenciais para os projetos da
[Associação Brasileira de Jurimetria](https://abj.org.br/).

Aqui estão todas as funções auxiliares para os gráficos, tabelas e
dashboards.

### Para instalar

Você pode instalar a versão mais recente do {abjDash} com:

    # Para instalar a versão GitHub (dev)
    install.packages("remotes")
    remotes::install_github("abjur/abjDash")

### Lista de funções

| Função                  | Descrição                                                                     | Teste                                                                                                                       |
|-------------------------|-------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| `barras_empilhadas`     | Função que cria gráfico dinâmico de colunas por grupo.                        | ok                                                                                                                          |
| `barras_prop`           | Função que cria gráfico dinâmico de barras com proporção.                     | ok                                                                                                                          |
| `barras`                | Função que cria gráfico dinâmico de barras.                                   | ok                                                                                                                          |
| `calcular_estatisticas` | Função que ajuda calcular medias e medianas por intervalo.                    | ok                                                                                                                          |
| `calcular_medianas`     | Função que calcula as medianas com base nos dados, datas e quebra.            | ok                                                                                                                          |
| `create_theme_css`      | Função que cria tema CSS para os Dashboards.                                  | [ok](https://github.com/abjur/obsDash/blob/1d9c5bd7ff41cf75cddc22dbbe118399aafac89f/R/app_ui.R#L114)                        |
| `custom_lab`            | Função que facilita o cálculo de milhares e milhões.                          | ok                                                                                                                          |
| `get_median`            | Função que ajuda pegar a mediana de processos por tempo baseada no processo   | ok                                                                                                                          |
| `grafico_km`            | Função que cria gráfico no modelo de sobrevivência Kaplan-meier               | [ok](https://github.com/abjur/obsFase3/blob/00575d1e5f180f91dab2307b9cd2de2b4dc556b6/inst/pres/20210629_obs/index.Rmd#L778) |
| `grafico_km2`           | Função que cria gráfico no modelo de sobrevivência Kaplan-meier (2 variáveis) | [ok](https://github.com/abjur/obsFase3/blob/00575d1e5f180f91dab2307b9cd2de2b4dc556b6/inst/pres/20210629_obs/index.Rmd#L790) |
| `histograma`            | Função que cria gráfico dinâmico de histograma.                               | ok                                                                                                                          |
| `mapa_tematico`         | Função que cria mapa dinâmico com reais e proporção.                          | [ok](https://github.com/abjur/obsCIEE/blob/af615b25d49bc5e14dd275ee555dde579e2821af/R/mod_tema.R#L129)                      |
| `nprop`                 | Função que retorna porcentagem no formato NN (PP).                            | ok                                                                                                                          |
| `pct`                   | Função que define porcentual.                                                 | ok                                                                                                                          |
| `picker_options`        | Função que customiza inputs widgets shiny.                                    | [ok](https://github.com/abjur/obsCIEE/blob/af615b25d49bc5e14dd275ee555dde579e2821af/R/app_ui.R#L15)                         |
| `pizza`                 | Função que cria gráfico dinâmico de pizza.                                    | ok                                                                                                                          |
| `prop_agg`              | Função de agregação personalizada em JavaScript. (Render)                     | \-                                                                                                                          |
| `reais`                 | Função que cria ferramenta para definir reais.                                | ok                                                                                                                          |
| `status_para_cor`       | Função que cria cores para os status dos dashboards.                          | [ok](https://github.com/abjur/obsDash/blob/1d9c5bd7ff41cf75cddc22dbbe118399aafac89f/R/app_ui.R#L114)                        |
| `tempo_lab_one`         | Função que ajuda calcular tempos.                                             | ok                                                                                                                          |
| `tempo_lab`             | Função que retorna um vetor de tempos.                                        | ok                                                                                                                          |

### Alguns exemplos de como usar as funções:

-   `reais`

``` r
abjDash::reais(c(1, 2, 3, 4, 4, 6))
#> [1] "R$ 1" "R$ 2" "R$ 3" "R$ 4" "R$ 4" "R$ 6"
```

-   `pct`

``` r
library(magrittr)
library(ggplot2)
library(abjDash)

mtcars %>% 
  dplyr::count(cyl) %>% 
  dplyr::mutate(prop = n/sum(n)) %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = cyl, y = prop, label = pct(prop)) +
  ggplot2::geom_col(fill = "#AFCA0A", width = .5) +
  ggplot2::scale_y_continuous(labels = scales::percent) +
  ggplot2::theme_minimal(10)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

## Templates disponíveis

Para as funções de módulo Server, UI e app Server deixamos disponíveis
drafts:

#### Exemplo de uso

``` r
abjDash::template_app_server()
```

## Requisitos

`{abjDash}` requer uma versão do R superior ou igual a 3.6.

### Licença

O sistema de gerenciamento de conteúdo `{abjDash}` é licenciado sob os
termos da [MIT + file
LICENSE](https://github.com/abjur/abjDash/blob/master/LICENSE).
