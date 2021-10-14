#' template_mod_ui
#'
#' Cria templates para o modulo de UI
#'
#' @param nome_arquivo nome do arquivo
#' @param path nome do diretório
#' @param template nome do template que deseja
#'
#' @export
template_mod_ui <- function(nome_arquivo = "mod_processo_ui", path = "R", template = "templates/template_mod_processo_ui.R") {
  dir.create(path, FALSE, TRUE)
  nome_arquivo <- tolower(nome_arquivo)
  nome_arquivo <- stringi::stri_trans_general(nome_arquivo, "Latin-ASCII")
  nome_arquivo <- stringi::stri_trim_both(nome_arquivo)
  nome_arquivo <- gsub("[^a-z0-9]+", "_", nome_arquivo)
  file <- paste(path, "/", nome_arquivo, ".R", sep = "")
  f0 <- system.file(template, package = "abjDash")
  file.copy(f0, file)
  if (interactive()) {
    rstudioapi::navigateToFile(file)
  } else {
    utils::file.edit(file)
  }
}
