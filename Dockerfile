FROM rocker/verse:latest
RUN apt update 
RUN apt install -y aptitude
RUN aptitude install -y gdal-bin
RUN aptitude install -y libgdal-dev
RUN aptitude install -y libproj-dev
RUN apt install -y libudunits2-dev

# Install TMB from CRAN
RUN R -e 'install.packages("TMB")'
# Install INLA using currently recommended method
RUN R -e 'install.packages("INLA", repos=c(getOption("repos"), INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)'
# Install FishStatUtils from github
RUN R -e 'devtools::install_github("james-thorson/FishStatsUtils", INSTALL_opts="--no-staged-install")'
# Install VAST from github
RUN R -e 'devtools::install_github("james-thorson/VAST", INSTALL_opts="--no-staged-install")'

