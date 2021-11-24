#' Shiny Widgets
#' @name picker_options
#' @description Função que customiza inputs widgets shiny
#'
#' @export
picker_options <- function() {
  shinyWidgets::pickerOptions(
    actionsBox = TRUE,
    container = "body",
    tickIcon = "fa fa-check",
    width = "100%",
    style = "btn-light text-dark",
    selectAllText = "Todos",
    deselectAllText = "Nenhum",
    selectedTextFormat = "count > 1",
    dropupAuto = FALSE
  )
}
