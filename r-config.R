sapply(.libPaths(), list.files)
str(as.list(Sys.getenv()))
sessionInfo()

if (!grepl('unstable', R.version.string)) {
  if (!require('rmarkdown')) install.packages('rmarkdown')
  update.packages(instlib=.libPaths()[1], ask=FALSE, checkBuilt=TRUE)
  # I do not know what's wrong with r-cran-xtable (it is not loadable)
  if (!require('xtable')) install.packages('xtable')
}
