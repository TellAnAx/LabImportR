#
#  TITLE: import_HANNA_HI
#
#  DESCRIPTION:
#
#
#
# written by: Anil Axel Tellbuescher
#
# date written:   May 7th, 2022
# last modified:  May 8th, 2022
#
#
#
###############################################################################



import_HANNA_HI <- function(file) {
  imported_file <- read.table(
    file = file
    )

  return(imported_file)
}
