# marxan.io Run Marxan

cat(paste0("hello\n"))
cat(paste0(getwd(),"\n"))

sAppDir <<- getwd()

sShinyPath <<- "/mnt/shiny/"
sShinyUserPath <<- paste0(sShinyPath,"users/")
sShinyDataPath <- paste0(sShinyPath,"data/")
sShinyTempPath <<- paste0(sShinyPath,"temp/")

sDatabase <<- ""
sSelectDb <<- "Tasmania"
sMarxanDir <<- ""
irefreshinput <<- 0
irefreshmrun <<- 0
isavetargetspf <<- 0
sSampleDataset <<- "Tasmania"
sBLM <<- 0.1
sProp <<- 0.3
sSPF <<- 1
iSpecDatRows <<- 0
iCores <<- 10
iRepsPerCore <<- 10

swhichparam <<- "BLM"
ruserblm <<- 0
ruserspf <<- 1
rusertarg <<- 0.3
irefreshptinput <<- 0

sUploadApp <<- "upload23"
sMarxanApp <<- "marxan23"

