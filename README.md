
<!-- README.md is generated from README.Rmd. Please edit that file -->

# abjDash

![](https://img.shields.io/badge/test-construction-blue)

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

| Função                  | Descrição                                                                     | Teste                                                                                                |
|-------------------------|-------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| `barras_empilhadas`     | Função que cria gráfico dinâmico de colunas por grupo.                        | \-                                                                                                   |
| `barras_prop`           | Função que cria gráfico dinâmico de barras com proporção.                     | \-                                                                                                   |
| `barras`                | Função que cria gráfico dinâmico de barras.                                   | ok                                                                                                   |
| `calcular_estatisticas` | Função que ajuda calcular medias e medianas por intervalo.                    | ok                                                                                                   |
| `create_theme_css`      | Função que cria tema CSS para os Dashboards.                                  | [ok](https://github.com/abjur/obsDash/blob/1d9c5bd7ff41cf75cddc22dbbe118399aafac89f/R/app_ui.R#L114) |
| `custom_lab`            | Função que facilita o cálculo de milhares e milhões.                          | [ok](https://github.com/abjur/obsDash/blob/1d9c5bd7ff41cf75cddc22dbbe118399aafac89f/R/app_ui.R#L114) |
| `get_median`            | Função que ajuda pegar a mediana de processos por tempo baseada no processo   | ok                                                                                                   |
| `grafico_km`            | Função que cria gráfico no modelo de sobrevivência Kaplan-meier               | \-                                                                                                   |
| `grafico_km2`           | Função que cria gráfico no modelo de sobrevivência Kaplan-meier (2 variáveis) | \-                                                                                                   |
| `histograma`            | Função que cria gráfico dinâmico de histograma.                               | \-                                                                                                   |
| `mapa_tematico`         | Função que cria mapa dinâmico com reais e proporção.                          | \-                                                                                                   |
| `nprop`                 | Função que retorna porcentagem no formato NN (PP).                            | ok                                                                                                   |
| `pct`                   | Função que define porcentual.                                                 | ok                                                                                                   |
| `picker_options`        | Função que customiza inputs widgets shiny.                                    | \-                                                                                                   |
| `pizza`                 | Função que cria gráfico dinâmico de pizza.                                    | ok                                                                                                   |
| `prop_agg`              | Função de agregação personalizada em JavaScript. (Render)                     | \-                                                                                                   |
| `reais`                 | Função que cria ferramenta para definir reais.                                | ok                                                                                                   |
| `status_para_cor`       | Função que cria cores para os status dos dashboards.                          | [ok](https://github.com/abjur/obsDash/blob/1d9c5bd7ff41cf75cddc22dbbe118399aafac89f/R/app_ui.R#L114) |
| `tempo_lab_one`         | Função que ajuda calcular tempos.                                             | ok                                                                                                   |
| `tempo_lab`             | Função que retorna um vetor de tempos.                                        | ok                                                                                                   |

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
LICENSE](https://github.com/abjur/abjDash/blob/master/LICENSE)

### Testes

Para algumas funções de gráficos e relacionadas a construção de
aplicativos Shiny a fase de teste está em *andamento*. Caso encontrar
algum problema específico contribua em
[issues](https://github.com/abjur/abjDash/issues).
