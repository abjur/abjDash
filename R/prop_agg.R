#' Render linhas com JS
#' @name prop_agg
#' @description  funcao de agregacao personalizada em JavaScript
#' @param x valores
#'
#' @export
prop_agg <- function(x) {
  reactable::JS(stringr::str_glue("
      function(values, rows) {{
        var total = 0.0;
        var ntot = 0.0;
        rows.forEach(function(row) {{
          total += row['n'] * row['{x}'];
          ntot += row['n'];
        }})
        return total / ntot;
      }}
    "))
}
