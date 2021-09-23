#' Status cores
#' @name status_para_cor
#' @description funcao que cria cores para os status dos dashboards
#' @param status info, secondary, primary, success, warning, danger
#' @export
status_para_cor <- function(status) {
  switch (
    status,
    info = "#0f7cbf",
    secondary = "#495961",
    primary = "#003366",
    success = "#7AD151",
    warning = "#ffcd37",
    danger = "#BF616A"
  )
}
