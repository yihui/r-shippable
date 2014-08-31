sapply(.libPaths(), list.files)
str(as.list(Sys.getenv()))
sessionInfo()

devtools::install_github('rstudio/rmarkdown')
update.packages(instlib=.libPaths()[1], ask=FALSE)
