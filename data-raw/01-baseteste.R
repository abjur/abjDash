
# Subindo a base para os teste ------------------------------------------------------------------------------------------------------------------

base_teste <-  readxl::read_excel("~/Documents/abjDash/data-raw/base_exemplo.xlsx")

usethis::use_data(base_teste, overwrite = TRUE)
