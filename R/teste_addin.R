#' teste
#' @name insertInAddin
#' @description funcao de test para addin
#'
#' @export
insertInAddin <- function() {
  rstudioapi::insertText(" teste <- function(a){
                         1 + a
                         }")
}
