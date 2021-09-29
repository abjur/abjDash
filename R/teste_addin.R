#' tinsertRun_app
#' @name insertRun_app
#' @description funcao de test para addin com run_app
#'
#' @export
insertRun_app <- function() {
  rstudioapi::insertText("run_app <- function(
    onStart = NULL,
    options = list(),
    enableBookmarking = NULL,
    ...
  ) {
    with_golem_options(
      app = shinyApp(
        ui = app_ui,
        server = app_server,
        onStart = onStart,
        options = options,
        enableBookmarking = enableBookmarking
      ),
      golem_opts = list(...)
    )")
}
