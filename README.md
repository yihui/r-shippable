[![Build Status](https://api.shippable.com/projects/54021507980fd09d113e7404/badge/master)](https://www.shippable.com/projects/54021507980fd09d113e7404)

This repo is used to set up the R package development environment for me on
Shippable. Because Shippable maintains the state of its Minions, the installed
packages will not be re-installed during the next build, which will save a lot
of time.

Currently these packages are installed:

- r-base-dev: for R package development (`R CMD build`/`check` for packages that
  need to be compiled)
- r-cran-devtools: in case we need to install packages from Github
- a few other R packages `r-cran-*` were installed because it is faster to
  install them as Debian packages instead of R packages (compilation takes time)
- pandoc/pandoc-citeproc: for [**rmarkdown**](http://rmarkdown.rstudio.com),
  e.g. sometimes we may need to build R Markdown (v2) vignettes
- subversion: for checking out and updating R source from SVN

The development version of R is built in the directory `../r-source`, and
installed to `~/r-devel`. A symlink `/usr/bin/Rd` is made for `~/r-devel/bin/R`,
so we can use `Rd CMD build`/`check` to build/check packages against the
development version of R. When we need the latest version of R, just hit the
button :arrow_forward: on the build page in the Shippable project, and R-devel
will be re-built. Because we used `svn co` and `svn up`, we do not need to check
out the full source (only incremental changes). Because Shippable does not
delete the `r-source` directory, the next build of R-devel should be much faster
than the first time (thanks to `make`), unless tremendous changes have been made
in the R source. Moreover, `svn status -u` is analyzed to see if it is really
necessary to rebuild R-devel: when no new commits were made to the SVN repo, the
build step will be skipped.

I have a few custom setting for myself in this repo, which you may not need or
may want to change if you fork this repo:

- I have set up my git `user.name` and `user.email` (although Shippable does not
  seem to respect my git config)
- I use `~/R` as my library path (set in `.Renviron`)
- I use two repositories to install packages: http://rforge.net (I have some
  packages under development built daily there) and http://cran.rstudio.com
- the environment variable `R_KNITR_OPTIONS` is a hack; please do not use it
  unless you understand what it means
