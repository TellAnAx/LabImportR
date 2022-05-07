#
#  TITLE: import_Shimadzu_TOC
#
#  DESCRIPTION:
#   A wrapper function to import the data files given out by the
#   Shimadzu TOC-L/TN analyser.
#
#
# written by: Anil Axel Tellbuescher
#
# date written:   May 7th, 2022
# last modified:  May 7th, 2022
#
#
#
###############################################################################



import_Shimadzu_TOC <- function(file, headerLang = "eng"){

# READ .txt FILE DEFINED AS FILENAME
#
# The first 13 lines in the .txt file contain specifications of the TOC/TN
# analyser. These can be skipped.
# Line 14 contains the column headers. These are also skipped and eventually
# renamed.

  imported_file <- read.table(file = file
                              ,sep = '\t'
                              ,dec = ','
                              ,skip = 14
                              ,header = FALSE
                              ,colClasses = c(
                                 rep("factor", times = 4)
                                ,rep("character", times = 2)
                                ,"numeric"
                                ,rep("character", times = 2)
                                ,"character"
                                ,rep("numeric", times = 2)
                                ,"factor"
                                ,rep("numeric", times = 4)
                                ,rep("character", times = 3)
                                ,rep("numeric", times = 8)
                                ,"NULL"
                                )
                              )

# CHECK WHICH LANGUAGE FOR THE HEADER WAS SELECTED
  if(headerLang == "eng"){

    # ENGLISH
    colnames(imported_file) <- c(
      'type'
      ,'analysisMode'
      ,'sampleName'
      ,'sampleID'
      ,'method_Used'
      ,'calCurve_Used'
      ,'dillManual'
      ,'note'
      ,'comment'
      ,'dateTime'
      ,'sampleNo'
      ,'injNo'
      ,'injAnalyte'
      ,'area'
      ,'areaMean'
      ,'conc'
      ,'concMean'
      ,'result'
      ,'resultMean'
      ,'remark'
      ,'areaSD'
      ,'areaCV'
      ,'concSD'
      ,'concCV'
      ,'samplePosition'
      ,'excluded'
      ,'injVol'
      ,'dillAuto'
    )
  } else {

    stop("Currently only \'eng\' as header language supported!")
  }



# CONVERT dateTime COLUMN INTO POSIXct
  imported_file$dateTime <- as.POSIXct(imported_file$dateTime,
                                       format = '%d.%m.%Y %H:%M:%OS')



  return(imported_file)
}
